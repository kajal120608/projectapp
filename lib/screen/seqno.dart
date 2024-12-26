// import 'package:flutter/material.dart';
// import 'package:shopirox_app/models/admin/bussinesscategarios.dart';
// import 'package:shopirox_app/screen/businesscategeris.dart/bussinesscategeris.dart';
// import 'package:shopirox_app/services/categories/categeriosService.dart';

// class Seqno extends StatefulWidget {
//   const Seqno({super.key});

//   @override
//   State<Seqno> createState() => _SeqnoState();
// }

// class _SeqnoState extends State<Seqno> {
//   var catese=Categeriosservice();
//  late List<Bussinesscategarios> nodetails;
//  List<Bussinesscategarios> nolist=[];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getno();
//   }

//   getno()async{
//   nodetails =await catese.GetSeqNo();
//   nolist=nodetails;
//   setState(() {
    
//   });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("No"),
//       ),
//       body: ListView.builder(itemBuilder: (context, index) {
//         return Text("data");
//       },),
//     );
//   }
// }