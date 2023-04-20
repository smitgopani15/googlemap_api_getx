import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap_api_getx/screen/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Set<Marker> _createMarker() {
      return {
        Marker(
          markerId: MarkerId("marker"),
          position: LatLng(homeController.lat.value, homeController.long.value),
          infoWindow: InfoWindow(title: 'Current Location'),
        ),
      };
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
              () => GoogleMap(
                markers: _createMarker(),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: homeController.isClick.isTrue
                    ? MapType.satellite
                    : MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    homeController.lat.value,
                    homeController.long.value,
                  ),
                  zoom: 14.4746,
                ),
              ),
            ),
            Positioned(
              top: -15,
              left: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/2.png",
                  height: 90,
                ),
              ),
            ),
            Positioned(
              top: 678,
              left: 352.5,
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        homeController.isClick.value =
                            !homeController.isClick.value;
                      },
                      child: Obx(
                        () => Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Container(
                                height: 40,
                                width: 37,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: Image.asset(
                                    homeController.isClick.isFalse
                                        ? "assets/images/4.jpg"
                                        : "assets/images/3.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
