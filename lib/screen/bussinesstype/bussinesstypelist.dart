import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shopirox_app/models/admin/bussinesstype.dart';
import 'package:shopirox_app/screen/bussinesstype/bussinesstypecreate.dart';
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
      backgroundColor: Colors.blue[50]?.withOpacity(0.5),
      appBar: AppBar(
        title: Text("TypeList"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          minTileHeight: 50,
        title: Text(Typelist[index].Btmtitle),
        );
      },
      itemCount: Typelist.length,
      ),
      floatingActionButton: FloatingActionButton(
       
         backgroundColor: Colors.pinkAccent[200],
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: (){
        //showLicensePage(context: context);
       
       showBarModalBottomSheet(context: context, builder: (context) {
         return Container(
          height: 500,
          child: Bussinesstypecreate(),
         );
       },);
        },
        
        ),
    );
  }
}