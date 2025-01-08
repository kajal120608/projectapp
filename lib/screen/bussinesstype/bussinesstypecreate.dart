import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/bussinesstype.dart';
import 'package:shopirox_app/screen/bussinesstype/bussinesstypelist.dart';
import 'package:shopirox_app/screen/home.dart';
import 'package:shopirox_app/services/admin/bussinesstypeservice.dart';


class Bussinesstypecreate extends StatefulWidget {
  const Bussinesstypecreate({super.key});

  @override
  State<Bussinesstypecreate> createState() => _BussinesstypecreateState();
}

class _BussinesstypecreateState extends State<Bussinesstypecreate> {
  var btmtitle=TextEditingController();
 var btmseqno=TextEditingController();
 
 String? userId;

 var typeservice=Bussinesstypeservice();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async{
 
 var data = await SharedPreferences.getInstance();
    userId = data.getString("userId");
  print(userId);
  print("getdata");
  setState(() {
    
  });
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text("BussinessType"),
      ),
      body: Container(
        height: 300,
       
            width: 350,
           margin: EdgeInsets.fromLTRB(10, 80, 10, 80),
            child:Card(
              color:   Colors.blue[100],
              elevation: 1,
        child: Column(
          children: [
             SizedBox(height: 20,),
             Container(
              
                    padding: EdgeInsets.all(15),
                    child: TextField(
                     controller:btmtitle ,
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
                     controller: btmseqno,
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
             var type=Bussinesstype(
              id: "00000000000000000000",
              AdminId: userId.toString(),
              Btmtitle: btmtitle.text,
              BtmSeqNo: 0, 
              BtmActive: true, 
              BtmIsDelete: false);

             typeservice.create(type);
              
             Navigator.push(context,MaterialPageRoute(builder: (context) => Bussinesstypelist(),));
             setState(() {
               
             });
          
             }, child: Text("Submit")),

            
          ],
        ),
      )
      ),
    );
  }
}