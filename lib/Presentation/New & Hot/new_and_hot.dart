import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:netflix/Presentation/New%20&%20Hot/Widgets/coming_soon.dart';
import 'package:netflix/Presentation/New%20&%20Hot/Widgets/everyones_watching.dart';

class ScreenNewHot extends StatelessWidget {
  ScreenNewHot({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final _pages = [
      ComingSoonWidget(
        items: controller.popular,
      ),
      EveryOnesWatching(
        items: controller.trending,
      )
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'New & Hot',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            const Icon(
              Icons.cast,
              size: 25,
              color: Colors.white,
            ),
            cstWidth,
            Image.network(
              'https://ih0.redbubble.net/image.618363037.0853/flat,1000x1000,075,f.u2.jpg',
              width: 25,
              height: 25,
            ),
            cstWidth,
          ],
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: whitecolor,
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
              indicator: BoxDecoration(
                  color: whitecolor, borderRadius: BorderRadius.circular(50)),
              tabs: const [
                Tab(text: "🍿 Coming Soon"),
                Tab(
                  text: "👀  Everyone's Watching",
                )
              ]),
        ),
        body: TabBarView(children: [
          ComingSoonWidget(
            items: controller.popular,
          ),
          EveryOnesWatching(
            items: controller.newrelease,
          )
        ]),
      ),
    );
  }
}
