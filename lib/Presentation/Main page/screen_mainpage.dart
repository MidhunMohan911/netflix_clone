import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Presentation/Fast%20Laughs/screen_fast_laugh.dart';
import 'package:netflix/Presentation/Home/screen_home.dart';
import 'package:netflix/Presentation/Main%20page/Widgets/bottom_nav.dart';
import 'package:netflix/Presentation/New%20&%20Hot/new_and_hot.dart';
import 'package:netflix/Presentation/Search/screen_search.dart';
import 'package:netflix/Presentation/downloads/screen_downloads.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  Controller controller = Get.put(Controller());

  final _pages = [
    ScreenHome(),
    ScreenNewHot(),
    ScreenFastLaughs(items: [],),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
