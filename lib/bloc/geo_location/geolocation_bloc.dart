import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../Repostries/geolcation/geolocation_repostry.dart';
part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {


  final GeoLocationRepository _geoLocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationBloc({required GeoLocationRepository geoLocationRepository})
      : _geoLocationRepository = geoLocationRepository,
        super(GeolocationLoading()) {
    on<LoadGeoLocation>((event, emit) async* {
      yield* _mapLoadGeoLocationState();
    });
  }

  @override
  Stream<GeolocationState> mapEventToState(
      GeolocationEvent event,
      ) async* {
    if (event is UpdateGeolocation) {
      yield* _mapUpdateGeolocationToState(event);
    }
  }


  Stream<GeolocationState> _mapLoadGeoLocationState() async* {
    _geolocationSubscription?.cancel();
    final Position position = await _geoLocationRepository.getCurrentLocation();

    add(UpdateGeolocation(position: position));
  }

  Stream<GeolocationState> _mapUpdateGeolocationToState(
      UpdateGeolocation event) async* {
    yield GeolocationLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
