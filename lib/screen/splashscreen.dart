import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:shopirox_app/screen/login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(
  //     Duration(seconds: 5),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login(),))
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          colorBrightness: Brightness.light,
          height: 80,
      color: Colors.grey[300],
      minWidth: double.infinity,
      onPressed: () => Dialogs.materialDialog(
          msg: 'Are you sure ? you can\'t undo this',
          title: "Delete",
          color: Colors.white,
          context: context,
          //dialogWidth: kIsWeb ? 0.3 :,
          //onClose: (value) => print("returned value is 'stri'"),
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancel',
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {},
              text: "Delete",
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]),
      child: Text("Show Material Dialog"),
    )
      ],
    )
   ),
    );
  }
}



