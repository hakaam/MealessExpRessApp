import 'package:geolocator/geolocator.dart';
import 'package:mealexpressapp/Repostries/geolcation/base_geolocation_repostry.dart';

class GeoLocationRepository extends BaseGeoLocationRepository{

  GeoLocationRepository();

  @override
  Future<Position> getCurrentLocation() async{

    return  await Geolocator.getCurrentPosition(

      desiredAccuracy: LocationAccuracy.high,


    );


  }


}