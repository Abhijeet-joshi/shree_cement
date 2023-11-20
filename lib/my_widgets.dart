import 'package:flutter/material.dart';

Widget vSpace(double h){
  return SizedBox(height: h,);
}

Widget hSpace(double w){
  return SizedBox(width: w,);
}

Widget menuItem(IconData iconData, String textData, IconData? icn2, {Color icnClr = Colors.black, Color textClr = Colors.black} ){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          hSpace(10),
          Icon(iconData, color: icnClr, size: 30,),
          hSpace(10),
          Expanded(flex: 7, child: Text(textData, style: TextStyle(color: textClr, fontSize: 20),)),
          hSpace(10),
          Icon(icn2, color: Colors.black, size: 30,),
        ],
      ),
      Divider(color: Colors.black,),
    ],
  );
}

Widget columnHeading(String columnHeading, {Color txtClr = Colors.black, bool dropdown = false}){
  return Container(
    height: 40,
    decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.grey.shade100
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(columnHeading, style: TextStyle(color: txtClr),)),
          Visibility(
            visible: dropdown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_drop_up, size: 15, color: Colors.grey,),
                Icon(Icons.arrow_drop_down, size: 15, color: Colors.grey,),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget userRow({required String sno, required String name, required String role, required String org, required String geo, required String status}){
  return Row(
    children: [
      Expanded(flex: 1, child: columnHeading(sno)),
      Expanded(flex: 1, child: columnHeading(name, txtClr: Colors.red.shade900)),
      Expanded(flex: 1, child: columnHeading(role, txtClr: Colors.grey.shade600)),
      Expanded(flex: 1, child: columnHeading(org, txtClr: Colors.grey.shade600)),
      Expanded(flex: 1, child: columnHeading(geo, txtClr: Colors.grey.shade600)),
      Expanded(flex: 1, child: Container(
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.grey.shade100
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  color: status=="Active" ? Colors.green.shade600 : Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(status, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ],
                )),
          ))),
      Expanded(flex: 1, child: actionButtons()),
    ],
  );
}

Widget navBox({required double boxWidth ,required String text, Color txtClr = Colors.grey, Color bgClr = Colors.white}){
  return Container(
    height: 30,
    width: boxWidth,
    decoration: BoxDecoration(
        border: Border.all(),
        color: bgClr
    ),
    child: Center(
      child: Text(text, style: TextStyle(fontSize: 12, color: txtClr),),
    ),
  );
}

Widget actionButtons(){
  return Container(
    height: 40,
    decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.grey.shade100
    ),
    child: Row(
      children: [
        Icon(Icons.edit, color: Colors.green, size: 21,),
        Icon(Icons.delete, color: Colors.red, size: 21,),
        Icon(Icons.sms_outlined, color: Colors.blue, size: 21,),
        Icon(Icons.mail_outline, color: Colors.yellow, size: 21,),
      ],
    ),
  );
}