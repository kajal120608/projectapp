import 'package:flutter/material.dart';

class droup extends StatefulWidget {
  const droup({super.key});

  @override
  State<droup> createState() => _droupState();
}

class _droupState extends State<droup> {
  String ddValue = "";
  var er = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Droupdoun"),
      ),
      body:DropdownButton(items: [
        DropdownMenuItem(child: Text("data"),value: "data",),
        DropdownMenuItem(child: Text("data"),value: "data",),
        DropdownMenuItem(child: Text("data"),value: "data",),
        DropdownMenuItem(child: Text("data"),value: "data",)
      ], onChanged: (value) {
        
      },)
    );
  }
}