// ignore_for_file: unnecessary_null_comparison

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:netflix/Presentation/Home/Widgets/dropdown_category.dart';
import 'package:netflix/Presentation/Home/Widgets/image_ref.dart';
import 'package:netflix/Presentation/Home/Widgets/main_card_ref.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<bool>(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, bool isScroll, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }

                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 520,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/prSfAi1xGrhLQNxVSUFh61xQ4Qy.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const IconWithLabel(
                                  icon: CupertinoIcons.add,
                                  label: 'My List',
                                ),
                                ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              whitecolor)),
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.play_fill,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  label: const Text(
                                    'play',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const IconWithLabel(
                                  icon: CupertinoIcons.info,
                                  label: 'Info',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.newrelease == null
                                ? const CircularProgressIndicator()
                                : FirstImgRef(
                                    title: 'Continue Watching for Nivea C M',
                                    items: controller.newrelease),
                            controller.popular == null
                                ? const CircularProgressIndicator()
                                : MainCardRef(
                                    title: 'Popular on Netflix',
                                    items: controller.popular),
                            controller.trending == null
                                ? const CircularProgressIndicator()
                                : MainCardRef(
                                    title: 'Trending Nows',
                                    items: controller.trending),
                            controller.tvshowsbooks == null
                                ? const CircularProgressIndicator()
                                : MainCardRef(
                                    title: 'Tv Shows Based on Books',
                                    items: controller.tvshowsbooks),
                            controller.newrelease == null
                                ? const CircularProgressIndicator()
                                : MainCardRef(
                                    title: 'New Releases',
                                    items: controller.newrelease),
                            cstHeight,
                            controller.tvdramas == null
                                ? const CircularProgressIndicator()
                                : MainCardRef(
                                    title: 'Tv Dramas',
                                    items: controller.tvdramas),
                            cstHeight,
                            controller.popular == null
                                ? const CircularProgressIndicator()
                                : NumberCard(
                                    items: controller.popular,
                                    title: 'Top 10 India Today'),
                            cstHeight,
                            // controller.usmovies == null
                            //     ? const CircularProgressIndicator()
                            //     : MainCardRef(
                            //         title: 'US Movies',
                            //         items: controller.usmovies),
                            // cstHeight,
                            controller.hindimovies == null
                                ? const CircularProgressIndicator()
                                : MainCardRef(
                                    title: 'Hindi Movies & Tv',
                                    items: controller.hindimovies),
                            cstHeight,
                            controller.international == null
                                ? const CircularProgressIndicator()
                                : MainCardRef(
                                    title: 'International Tv Shows',
                                    items: controller.international),
                          ],
                        ),
                      ),
                    ],
                  ),
                  isScroll
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/netflix-icon-transparent-29.jpg',
                                      // height: 20,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    cstWidth,
                                    Image.network(
                                      'https://ih0.redbubble.net/image.618363037.0853/flat,1000x1000,075,f.u2.jpg',
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                                cstHeight,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    cstWidth,
                                    const Text('TV Shows'),
                                    const Text('Movies'),
                                    GestureDetector(
                                      onTap: () {
                                        _showCategoryList(context);
                                      },
                                      child: Row(children: const [
                                        Text("Categories",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                        Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: whitecolor,
                                        )
                                      ]),
                                    ),
                                    cstWidth
                                  ],
                                )
                              ],
                            ),
                          ),
                      )
                      : cstHeight
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class IconWithLabel extends StatelessWidget {
  const IconWithLabel({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whitecolor,
        ),
        Text(label),
      ],
    );
  }
}

class NumberCard extends StatelessWidget {
  NumberCard({Key? key, required this.items, required this.title})
      : super(key: key);
  List<DataModel> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6, top: 5),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        LimitedBox(
          maxHeight: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(items.length, (index) {
              final data = items[index];
              return Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 140,
                      ),
                      Container(
                        height: 180,
                        width: 102,
                        decoration: BoxDecoration(
                          borderRadius: cstRadius10,
                          image: DecorationImage(
                              image: NetworkImage(
                                baseImage + data.image.toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 80,
                    top: 12,
                    child: BorderedText(
                      strokeWidth: 5.0,
                      strokeColor: Colors.white,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                            fontSize: 115,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

Future<Object?> _showCategoryList(BuildContext context) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      body: Column(
        children: const [
          SizedBox(height: 50),
          CategoryDropdown(),
          SizedBox(height: 20),
          ClossButtonWid(),
          SizedBox(height: 30)
        ],
      ),
    ),
  );
}
