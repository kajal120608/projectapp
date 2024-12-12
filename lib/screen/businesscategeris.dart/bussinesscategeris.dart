

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/bussinesscategarios.dart';
import 'package:shopirox_app/screen/businesscategeris.dart/categerioslist.dart';


import 'package:shopirox_app/services/categories/categeriosService.dart';

class Bucategeris extends StatefulWidget {
  const Bucategeris({super.key});

  @override
  State<Bucategeris> createState() => _BucategerisState();
}

class _BucategerisState extends State<Bucategeris> {
 
  var bcmtitle=TextEditingController();
  var bcmslug=TextEditingController();
  var   bcmseqno=TextEditingController();
 
 String? userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async{
 
 var data = await SharedPreferences.getInstance();
    userId = data.getString("userId");

  setState(() {
    
  });
 
  }

  var bucateservice= Categeriosservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.lightBlue.shade100.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
        title: Text("Categories"),
      ),
      body: Container(
        height: 300,
            width: 350,
           margin: EdgeInsets.fromLTRB(10, 80, 10, 80),
            child:Card(
              color: Colors.white,
              elevation: 1,
        child: Column(
          children: [
             SizedBox(height: 20,),
             Container(
              
                    padding: EdgeInsets.all(15),
                    child: TextField(
                     controller:bcmtitle ,
                    decoration: InputDecoration(
                      
                      hintText: "Enter Title ",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                  
                    ),
                  ),
                    ),

                    
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                     controller: bcmseqno,
                    decoration: InputDecoration(
                      hintText: "Enter Seq No",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                  contentPadding: EdgeInsets.all(20)
                    ),
                  ),
                    ),
            
             SizedBox(height: 20,),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                
              ),
              onPressed: ()async{

              var categary= Bussinesscategarios(
                id: "00000000000000000000" ,
                AdminId:userId.toString(),
                Bcmtitle: bcmtitle.text,
                BcmSlug: bcmtitle.text.toLowerCase(),
                BcmSeqNo: 0,
                BcmActive: true,
                BcmIsDelete: false
              );
              print(categary);
             
             var result=await bucateservice.create(categary);
             Navigator.push(context,MaterialPageRoute(builder: (context) => Categerioslist(),));
             setState(() {
               
             });
          
             }, child: Text("Submit")),

            
          ],
        ),
      )
      )
    );
  }
}