import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartDevies extends StatelessWidget {
  final String DeviceName;
  final String iconPath;
  final bool status;
  Function(bool)? onChanged;

  SmartDevies(
      {super.key,
      required this.DeviceName,
      required this.iconPath,
      required this.status,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: status ? Colors.black87 : Colors.grey[300],
          borderRadius: BorderRadius.circular(24),
    
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Image.asset(iconPath,height: 65,color: status ? Colors.green : Colors.grey[800],),

            Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(DeviceName,style: GoogleFonts.lato(fontSize: 23,fontWeight: FontWeight.bold,color: status ?  Colors.white : Colors.grey[800]),),
                  )),

                  Transform.rotate(
                    angle: pi/2,
                    child: CupertinoSwitch(value: status, onChanged: onChanged),
                    ),
                ],
              ),
    
          ],)
      ),
    );
  }
}
