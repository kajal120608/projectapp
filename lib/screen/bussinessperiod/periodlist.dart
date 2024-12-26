import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/businessPeriod.dart';
import 'package:shopirox_app/services/admin/businessPeriodService.dart';


class Periodlist extends StatefulWidget {
  const Periodlist({super.key});

  @override
  State<Periodlist> createState() => _PeriodlistState();
}

class _PeriodlistState extends State<Periodlist> {

  var periodservice=businessPeriodService();
 late List<businessPeriod> Perioddetails;
 List<businessPeriod> periodlist=[];

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    Getdata();
    print("initstate");
  }

  getdata() async{
    print("data");
   Perioddetails=await periodservice.Getlist();
   periodlist=Perioddetails;

   setState(() {
     
   });
  }


   var bpmtitle=TextEditingController();
  var bpmslug=TextEditingController();
  var   bpmseqno=TextEditingController();
 
 String? userId;

 

  void Getdata() async{
 
 var data = await SharedPreferences.getInstance();
    userId = data.getString("userId");

  setState(() {
    
  });
 
  }

var Eddittitle=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        
        flexibleSpace: Container(
          decoration: BoxDecoration(
            //color: Color.fromARGB(255, 155, 219, 250),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 0,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        title: Text(
          "Period List",
          style: TextStyle(
            color: const Color.fromARGB(255, 72, 33, 243),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: periodlist.isEmpty?Center(
         child: CircularProgressIndicator(),
      ):ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                     clipBehavior: Clip.antiAlias,
                     child: ExpansionTile(
                      enabled: true,
                      minTileHeight: 70,
                      
               shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),

               ),
                      //backgroundColor: Colors.blue.shade50,
                      backgroundColor: Colors.grey[300],
                      collapsedBackgroundColor: Colors.grey.shade200,
                       title: Text(
                        periodlist[index].BpmTitle,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: const Color.fromARGB(255, 72, 33, 243),
                        ),
                      ),
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                  showBarModalBottomSheet(
                                
                                context: context, builder: (context) {
                                return Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[50]
                                  ),
                                  child:Column(
                                    
                                    children: [
                                     Container(
                                      margin: EdgeInsets.only(left: 300),
                                      child: CloseButton(
                                        color: Colors.red,
                                        
                                      ),

                                    
                                     ),
                                     Container(
                                      margin: EdgeInsets.only(right: 200),
                                      child: Text("Enter Rename",style: TextStyle(fontSize: 20),)

                                    
                                     ),
                                     ListTile(
                                      title: TextField(
                                       
                                        controller: Eddittitle,
                                        decoration: InputDecoration(
                                         hintText: periodlist[index].BpmTitle,
                                          border: OutlineInputBorder(
                                            
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green)
                                          ),
                                          
                                          suffixIcon: IconButton(onPressed: (){
                                           var Edd=businessPeriod(
                                            Id: periodlist[index].Id, 
                                            adminId: periodlist[index].adminId, 
                                            BpmTitle: Eddittitle.text,
                                            BpmSeqNo: periodlist[index].BpmSeqNo,
                                            BpmDelete: periodlist[index].BpmDelete,
                                             BpmIsActive: periodlist[index].BpmIsActive);

                                             periodservice.eddit(Edd);
                                             setState(() {
                                               
                                             });
                                              
                                          }, icon: Icon(Icons.edit_outlined,color: Colors.green,size: 30,)),
                                        ),
                                      ),
                                      
                                     ),
                                     SizedBox(height: 10,),
                                     Container(
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            fixedSize: Size(120, 50),
                                            shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.circular(2)
                                            )
                                          ),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text("Cancle", style: TextStyle(
                           fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),)),
                                        SizedBox(width: 40,),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            fixedSize: Size(100, 50),
                                            shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)
                                            )
                                          ),
                                          onPressed: (){
                                           var Edd=businessPeriod(
                                            Id: periodlist[index].Id, 
                                            adminId: periodlist[index].adminId, 
                                            BpmTitle: Eddittitle.text,
                                            BpmSeqNo: periodlist[index].BpmSeqNo,
                                            BpmDelete: periodlist[index].BpmDelete,
                                             BpmIsActive: periodlist[index].BpmIsActive);

                                             periodservice.eddit(Edd);
                                             
                                              
                      setState(() {
                        
                      });
                                          }, child: Text("Save", style: TextStyle(
                          
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),))
                                      ],
                                     ),
                                     )
                                    ],
                                  ),
                                );
                              },);
                              },
                             child:  Container(
                            height: 50,
                            width: 150,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue,
                            ),
                            child:ListTile(
                              leading: Icon(Icons.edit_outlined,color: Colors.white,),
                              title: Text("Eddit",style: TextStyle(color: Colors.white,fontSize: 20,),),
                            )
                          ),
                            ),

                             InkWell(
                        onTap: () {
                           var del=businessPeriod(
                            Id: periodlist[index].Id, 
                            adminId: periodlist[index].adminId,
                            BpmTitle: periodlist[index].BpmTitle,
                             BpmSeqNo: periodlist[index].BpmSeqNo, 
                             BpmDelete: periodlist[index].BpmDelete,
                              BpmIsActive: periodlist[index].BpmIsActive);

                             periodservice.Delete(del);
                            
                            setState(() {
                              
                            });	
                            print("delete");
                        },
                        child:  Container(
                            height: 50,
                            width: 150,
                             margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.red,
                            ),
                            child:ListTile(
                              leading: Icon(Icons.delete_outline,color: Colors.white,),
                              title: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 20,),),
                            )
                          ),
                        
                       )
                          ],
                        )
                      ],
                     ),
          ),
        );
      },
      itemCount: periodlist.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        showBarModalBottomSheet(
          context: context, builder: (context) {
          return Container(
            height: 500,
            child: Container(
              //color: Colors.blue.shade100,
        height: 300,
            width: 350,
           margin: EdgeInsets.fromLTRB(10, 80, 10, 80),
            child:Card(
              color: Colors.blue[50],
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
                
                BpmSeqNo: 0,
                BpmIsActive: true,
                BpmDelete: false,
              );
              print(categary);
             
             var result=await periodservice.create(categary);
             Navigator.push(context,MaterialPageRoute(builder: (context) => Periodlist(),));
             setState(() {
               
             });
          
             }, child: Text("Submit")),

            
          ],
        ),
      )
      ),
          );
        },);
      }),
    );
  }
}