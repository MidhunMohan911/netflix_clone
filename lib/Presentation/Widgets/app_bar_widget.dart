import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        cstWidth,
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Icon(
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
    );
  }
}
