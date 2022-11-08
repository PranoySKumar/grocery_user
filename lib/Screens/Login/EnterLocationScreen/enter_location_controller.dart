import 'package:get/get.dart';
import 'package:location/location.dart';

class EnterLocationController extends GetxController {
  late LocationData _locationData;

  //Get user location.
  getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    //Checking for whether the service is enabled or not.
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    //checking whether the permission was granted or not.
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    printInfo(info: _locationData.latitude.toString());
    printInfo(info: _locationData.longitude.toString());
  }

  sendLocationDataAndLoginUser() {}
}
