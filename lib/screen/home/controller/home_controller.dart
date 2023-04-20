import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;
  RxList<Placemark> placemarkList = <Placemark>[].obs;
  RxBool isClick = false.obs;
}
