import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    final CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    return SafeArea(
      child: SingleChildScrollView(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        // Column(
        //   children: [
        //     SizedBox(height: getProportionateScreenHeight(20)),
        //     HomeHeader(),
        //     SizedBox(height: getProportionateScreenWidth(10)),
        //     DiscountBanner(),
        //     Categories(),
        //     SpecialOffers(),
        //     SizedBox(height: getProportionateScreenWidth(30)),
        //     PopularProducts(),
        //     SizedBox(height: getProportionateScreenWidth(30)),
        //   ],
        // ),
      ),
    );
  }
}
