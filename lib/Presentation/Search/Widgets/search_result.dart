import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Services/search_service.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:netflix/Presentation/Search/Widgets/search_idle.dart';

const searchImg =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key}) : super(key: key);

  final searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlesWidget(title: 'Movies & TV'),
        cstHeight,
        Expanded(
            child: 
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 9,
            crossAxisSpacing: 9,
            childAspectRatio: 1 / 1.4,
            children: List.generate(searchController.data.value.length, (index) {
              final datas = searchController.data.value[index];
              final image = baseImage + datas.image.toString();
              return ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(10), // Image radius
                  child: datas.image == null
                      ? const Center(
                          child: Text('No image found'),
                        )
                      : Image.network(image, fit: BoxFit.cover),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
