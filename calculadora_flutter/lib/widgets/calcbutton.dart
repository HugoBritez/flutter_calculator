import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calcbutton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final int bgcolor;
  const Calcbutton({super.key, required this.callback, required this.text, this.textSize=28, this.bgcolor=0xffffffff});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
      height: 65,
      width: 65,
      child: TextButton(
        onPressed: () {
          callback(text);
        },
        style: 
          TextButton.styleFrom(
            foregroundColor: Color(bgcolor),
            padding:const EdgeInsets.all(16),
            textStyle: const TextStyle(
              fontSize: 24
            )
          ),
        child:
          Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize
              )
            )
          ),
      ),
      ),
    );
  }
}