import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:netflix/Presentation/Widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final List imageList = [
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zL40soH0AYoBD5BVNu9U2B98ejD.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/vQztlJgcFMEncmLzoNRBBgMT2IS.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/5BU4qoPUPiOSiLue8ni8VdxNP4U.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                children: const [
                  cstWidth,
                  Icon(
                    Icons.settings_outlined,
                    color: whitecolor,
                  ),
                  cstWidth,
                  Text('smart downloads')
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              const Text(
                'Introducing Downloads for You',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: Text(
                  'We will download personilized selection of movies and shows for you,so there is always something to watch on your device.',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 13,
                      color: white60),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.36,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[800],
                      radius: size.width * 0.29,
                    ),
                    DownloadsImage(
                      image: imageList[0],
                      margin: const EdgeInsets.only(left: 150, bottom: 32),
                      angle: 17,
                      size: Size(size.width * 0.26, size.height * 0.38),
                    ),
                    DownloadsImage(
                      image: imageList[1],
                      margin: const EdgeInsets.only(right: 150, bottom: 32),
                      angle: -17,
                      size: Size(size.width * 0.26, size.height * 0.38),
                    ),
                    DownloadsImage(
                      image: imageList[2],
                      margin: const EdgeInsets.all(0),
                      size: Size(size.width * 0.30, size.height * 0.48),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  onPressed: () {},
                  color: kbluebutton,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Set Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: whitecolor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: MaterialButton(
                    color: whitecolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    child: const Text(
                      'See What You Can Download',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
              )
            ],
          ),
        ));
  }
}

class DownloadsImage extends StatelessWidget {
  const DownloadsImage({
    Key? key,
    required this.image,
    this.angle = 0,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(20),
            child: Image.network(image),
          ),
        ),
      ),
    );
  }
}
