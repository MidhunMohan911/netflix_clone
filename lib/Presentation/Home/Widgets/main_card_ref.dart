import 'package:flutter/material.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/constants.dart';

class MainCardRef extends StatelessWidget {
  MainCardRef({Key? key, required this.title, required this.items})
      : super(key: key);
  final String title;
  List<DataModel> items;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  width: size.width * .25,
                  height: size.width * .4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(10), // Image radius
                      child: Image.network(baseImage + data.image.toString(),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
