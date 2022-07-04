import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:netflix/Presentation/Home/screen_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EveryOnesWatching extends StatelessWidget {
  List<DataModel> items;
  EveryOnesWatching({Key? key, required this.items}) : super(key: key);

   final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          final data = items[index];
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: data.image == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Image.network(baseImage + data.image.toString(),
                              fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 20,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black.withOpacity(.3),
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.volumeXmark,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // cstHeight,
                // videowidget(),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 90,
                      child: Text(
                        data.title.toString(),

                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            color: whitecolor,
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: IconWithLabel(
                          icon: CupertinoIcons.paperplane, label: "Share"),
                    ),
                    cstWidth,
                    const Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: IconWithLabel(icon: Icons.add, label: "My List"),
                    ),
                    cstWidth,
                    const Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: IconWithLabel(
                          icon: CupertinoIcons.play_fill, label: "Play"),
                    ),
                  ],
                ),

                Text(
                  data.title.toString(),
                  // 'F r i e n d s',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                cstHeight,
                Text(
                  data.overview.toString(),
                  // 'Friends jhhkhlhhjhgfyfyddvvvvvv   ooiiiiiijjjhgcff  xxesezwawecfgvhbjkkm hbhbtf drdrdezxf mokmmughgh bbjjnn',
                  style: TextStyle(fontSize: 14),
                  maxLines: 5,
                ),
                // cstHeight,
              ],
            ),
          );
        });
  }
}
