import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/businessPeriod.dart';
import 'package:shopirox_app/screen/home.dart';
import 'package:shopirox_app/services/categories/businessPeriodService.dart';

class buss extends StatefulWidget {
  const buss({super.key});

  @override
  State<buss> createState() => _bussState();
}

class _bussState extends State<buss> {
  var bpmtitle=TextEditingController();
  var bpmslug=TextEditingController();
  var   bpmseqno=TextEditingController();
 
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

  var bussinesperiodservice= businessPeriodService();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                     controller:bpmtitle ,
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
                     controller: bpmseqno,
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

              var categary= businessPeriod(
                Id: "00000000000000000000" ,
                adminId:userId.toString(),
                BpmTitle: bpmtitle.text,
                
                BpmSeqNo: "1",
                BpmIsActive: "",
                BpmDelete: "",
              );
              print(categary);
             
             var result=await bussinesperiodservice.create(categary);
             Navigator.push(context,MaterialPageRoute(builder: (context) => Home(),));
             setState(() {
               
             });
          
             }, child: Text("Submit")),

            
          ],
        ),
      )
      )
    );;
  }
}