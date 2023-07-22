import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Constants {
 static Future<Color> getcolorLocation() async {
  try {
   // Request location permission
   PermissionStatus permissionStatus = await Permission.location.request();

   // Check if the permission is granted
   if (permissionStatus.isGranted) {
    Position position = await Geolocator.getCurrentPosition(
     desiredAccuracy: LocationAccuracy.high,
    );
    print(position.latitude);
    if (position.latitude > 30) {
     return Colors.orange;
    } else {
     return Colors.blue;
    }
   } else {

    return Colors.brown;
   }
  } catch (e) {
   print('Error getting user location: $e');
   // Default color if location cannot be determined
   return Colors.brown;
  }
 }
}
