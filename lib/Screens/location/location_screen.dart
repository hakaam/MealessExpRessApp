import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mealexpressapp/bloc/geo_location/geolocation_bloc.dart';
import 'package:mealexpressapp/widgets/gmaps.dart';

import '../../widgets/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LocationScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            // constraints: BoxConstraints.expand(),

            child:  BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
                if (state is GeolocationLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GeolocationLoaded) {
                  return GMaps(
                      lat: state.position.latitude,
                      lan: state.position.latitude);
                } else {
                  return Center(
                    child: Text('Something went wrong.'),
                  );
                }
              },
            )),


        Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: LocationSearchBox()),
                ],
              ),
            )),
        Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {},
                  child: Text('Save')),
            )),
      ],
    ));
  }
}
