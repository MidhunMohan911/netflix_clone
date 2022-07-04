import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:netflix/Api/Controler/controller.dart';
import 'package:netflix/Api/Model/model.dart';
import 'package:netflix/Core/colors/baseimage.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/6Ys6koNajP5ld9EIMfOSQrRquki.jpg';

class SearchIdleWidget extends StatelessWidget {
  List<DataModel> items;
  SearchIdleWidget({Key? key, required this.items}) : super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    print(items);
    return Column(
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
                final data = items[index];
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
                        style: const TextStyle(fontWeight: FontWeight.w500),
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
              itemCount: items.length),
        )
      ],
    );
  }
}

class TitlesWidget extends StatelessWidget {
  const TitlesWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
