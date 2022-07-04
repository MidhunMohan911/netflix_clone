import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/colors/constants.dart';





// class VideoListItem extends StatelessWidget {
//   final int ;

//   const VideoListItem({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

class VideoAction extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoAction({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7, right: 10, top: 15),
      child: Column(
        children: [
          Icon(
            icon,
            color: whitecolor,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
