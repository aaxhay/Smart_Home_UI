import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_smart/utils/smart_devies.dart';

class HomeSmart extends StatefulWidget {
  HomeSmart({super.key});

  @override
  State<HomeSmart> createState() => _HomeSmartState();
}

class _HomeSmartState extends State<HomeSmart> {
  final double horizontalpadding = 24;
  final double verticalpadding = 14;

  List MySmartDevices = [
    ['Smart TV', 'lib/Icons/tv.png', true],
    ['Smart Bulb', 'lib/Icons/bulb.png', false],
    ['AC', 'lib/Icons/air-conditioner (1).png', false],
    ['Smart Fan', 'lib/Icons/fan.png', false]
  ];

   void powerOnOff(bool status,int index){
      setState(() {
        MySmartDevices[index][2] = status;
      });
    } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "lib/Icons/menu (1).png",
                  height: 40,
                  color: Colors.grey[800],
                ),
                Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.grey[800],
                )
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //welcome home
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Home,",
                  style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold)
                ),
                Text(
                  "Aashay",
                  style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontSize: 68,color: Colors.grey[800])),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: Divider(
              color: Colors.grey[400],
              thickness: 2,
            ),
          ),


          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: Text(
              "Smart Devices",
              style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: GridView.builder(
                itemCount: MySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return SmartDevies(
                      DeviceName: MySmartDevices[index][0],
                      iconPath: MySmartDevices[index][1],
                      status: MySmartDevices[index][2],
                      onChanged: (value) => powerOnOff(value,index),
                      );
                }),
          )
        ]),
      ),
    );
  }
}
