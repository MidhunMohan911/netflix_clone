import 'package:flutter/material.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/colors.dart';

class FirstImgRef extends StatelessWidget {
  FirstImgRef({Key? key, required this.title, required this.items})
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
          maxHeight: 172,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(items.length, (index) {
              final data = items[index];
              return Padding(
                padding: EdgeInsets.only(left: 8),
                child: Stack(
                  children: [
                    SizedBox(
                      width: size.width * 0.24,
                      height: size.height * 0.22,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(5),
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width * 0.24,
                                height: size.height * 0.17,
                                child: Image.network(
                                  baseImage + data.image.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                color: Colors.grey[800],
                                width: size.width * .24,
                                height: size.height * .05,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 23,
                      top: 50,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.shade800.withOpacity(.8),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: whitecolor,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  
  }
}
