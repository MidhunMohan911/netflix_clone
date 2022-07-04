import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Presentation/Fast%20Laughs/Widgets/video_list_items.dart';

class ScreenFastLaughs extends StatelessWidget {
  List<DataModel> items;
  ScreenFastLaughs({Key? key, required this.items}) : super(key: key);

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              controller.popular.length,
              (index) {
                final data = controller.popular[index];
                return Stack(
                  children: [
                    Image.network(
                      baseImage + data.image.toString(),
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    //<<<< Left Side >>>>>//
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.volumeXmark,
                            size: 20,
                            color: whitecolor,
                          ),
                        ),
                      ),
                    ),
                    //<<<<<<Right Side>>>>>//
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  baseImage + data.image.toString(),
                                ),
                              ),
                            ),
                            VideoAction(
                                icon: Icons.emoji_emotions, title: 'LOL'),
                            VideoAction(
                                icon: CupertinoIcons.add, title: 'My List'),
                            VideoAction(
                                icon: CupertinoIcons.paperplane,
                                title: 'Share'),
                            VideoAction(
                                icon: CupertinoIcons.play_fill, title: 'Play'),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
