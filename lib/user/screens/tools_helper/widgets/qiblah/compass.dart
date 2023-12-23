

import 'dart:async';
import 'dart:math' show pi;
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'location_error_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class QiblahScreen extends StatelessWidget {
  const QiblahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/bookmarks'),
              icon: const Icon(Icons.bookmark, color: Colors.white)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/setting'),
              icon: const Icon(Icons.settings, color: Colors.white)),
        ],
      ),
      body: Center(
        child: Text(""),
          // child: SmoothCompass(
          //   height: 250,
          //   width: 280,
          //   isQiblahCompass: true,
          //   compassBuilder: (context, snapshot, child) {
          //     return SizedBox(
          //       height: 280,
          //       width: 280,
          //       child: AnimatedRotation(
          //         duration: const Duration(milliseconds: 800),
          //         turns: snapshot?.data?.turns ?? 0,
          //         child: Stack(
          //           children: [
          //             Positioned(
          //                 top: 0,
          //                 left: 0,
          //                 right: 0,
          //                 bottom: 0,
          //                 child: SvgPicture.asset(
          //                   'assets/svg/compass.svg',
          //                   fit: BoxFit.cover,
          //                 )),
          //             Positioned(
          //               top: 0,
          //               left: 0,
          //               right: 0,
          //               bottom: 0,
          //               child: AnimatedRotation(
          //                   duration: const Duration(milliseconds: 500),
          //                   turns: (snapshot?.data?.qiblahOffset ?? 0) / 360,
          //                   //Place your qiblah needle here
          //                   child: SvgPicture.asset(
          //                     'assets/svg/needle.svg',
          //                     fit: BoxFit.fitHeight,
          //                   )),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // )),
    ));
  }
}
