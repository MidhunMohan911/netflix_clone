import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:netflix/Presentation/Home/screen_home.dart';

class ComingSoonWidget extends StatelessWidget {
  List<DataModel> items;
  ComingSoonWidget({Key? key, required this.items}) : super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final data = items[index];
        return Row(
          children: [
            SizedBox(
              width: 50,
              height: 500,
              child: Column(
                children: const [
                  Text(
                    'FEB',
                    style: TextStyle(color: white60),
                  ),
                  Text(
                    '11',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 50,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // videowidget(),
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(baseImage + data.image.toString(),
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black.withOpacity(.3),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.ad_units),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: 500,
                          height: 100,
                          child: Text(
                            // "Evil",
                            data.title.toString(),
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily:
                                    GoogleFonts.frederickaTheGreat().toString(),
                                fontWeight: FontWeight.w900,
                                fontSize: 25),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: IconWithLabel(
                          label: 'Remind Me',
                          icon: Icons.notifications_none_outlined,
                        ),
                      ),
                      cstWidth,
                      const Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: IconWithLabel(
                            icon: CupertinoIcons.info, label: "Info"),
                      ),
                      cstWidth
                    ],
                  ),
                  cstHeight,
                  Text(
                    data.releasedate.toString(),
                    // "Coming on Friday",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, color: white60),
                  ),
                  // height10,
                  // netflixlog(),
                  cstHeight,
                  Text(
                    data.title.toString(),
                    // 'Heart Stopper',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  cstHeight,
                  Text(
                    data.overview.toString(),
                    // 'packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy.',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
