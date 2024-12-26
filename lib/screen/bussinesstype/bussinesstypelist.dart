import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:shopirox_app/models/admin/bussinesstype.dart';
import 'package:shopirox_app/services/admin/bussinesstypeservice.dart';

class Bussinesstypelist extends StatefulWidget {
  const Bussinesstypelist({super.key});

  @override
  State<Bussinesstypelist> createState() => _BussinesstypelistState();
}

class _BussinesstypelistState extends State<Bussinesstypelist> {
  var Typeservice=Bussinesstypeservice();
 late List<Bussinesstype> Typedetails;
 List<Bussinesstype> Typelist=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getdata();
  }

 Getdata()async{
 Typedetails =await Typeservice.Getlist();
 Typelist=Typedetails;
 setState(() {
   
 });
 }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TypeList"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
        title: Text(Typelist[index].Btmtitle),
        );
      },
      itemCount: Typelist.length,
      ),
    );
  }
}