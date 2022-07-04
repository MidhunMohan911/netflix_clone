import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Api/Services/search_service.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:netflix/Presentation/Search/Widgets/search_idle.dart';

import '../../Core/colors/baseimage.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  Controller controller = Get.find<Controller>();

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchController());

    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: textEditingController,
              onChanged: (value) {
                searchController.putdata(value);
              },
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
            ),
            cstHeight,
            Obx(
              () {
                if (textEditingController.text.isEmpty) {
                  searchController.putdata('Tv & Movies');
                }
                return Expanded(
                  child: textEditingController.text.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitlesWidget(
                              title: 'Top Searches',
                            ),
                            cstHeight,
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (ctx, index) {
                                  final data =
                                      searchController.data.value[index];
                                  return Row(
                                    children: [
                                      Container(
                                        width: size * 0.35,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "http://image.tmdb.org/t/p/w500" +
                                                  data.image.toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      cstWidth,
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          data.title.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          CupertinoIcons.play_circle,
                                          size: 45,
                                          color: whitecolor,
                                        ),
                                      )
                                    ],
                                  );
                                },
                                separatorBuilder: (ctx, index) {
                                  return cstHeight20;
                                },
                                itemCount: searchController.data.value.length,
                              ),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitlesWidget(title: 'Movies & TV'),
                            cstHeight,
                            Expanded(
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                mainAxisSpacing: 9,
                                crossAxisSpacing: 9,
                                childAspectRatio: 1 / 1.4,
                                children: List.generate(
                                    searchController.data.value.length,
                                    (index) {
                                  final datas =
                                      searchController.data.value[index];
                                  final image =
                                      baseImage + datas.image.toString();
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(
                                          10), // Image radius
                                      child: datas.image == null
                                          ? const Center(
                                              child: Text('No image found'),
                                            )
                                          : Image.network(image,
                                              fit: BoxFit.cover),
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
