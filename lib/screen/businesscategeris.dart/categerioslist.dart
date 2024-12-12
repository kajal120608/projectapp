import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/bussinesscategarios.dart';

import 'package:shopirox_app/services/categories/categeriosService.dart';

class Categerioslist extends StatefulWidget {
  const Categerioslist({super.key});

  @override
  State<Categerioslist> createState() => _CategerioslistState();
}

class _CategerioslistState extends State<Categerioslist> {
  var cbservice = Categeriosservice();
  late List<Bussinesscategarios> catelist;
  List<Bussinesscategarios> datalist = [];
  //  late List<Bussinesscategarios> sqno;
  // List<Bussinesscategarios> seqNos = [];

  @override
  void initState() {
    super.initState();
    getdata();
    Getlist();
    // seqNo();
  }

  void Getlist() async {
    catelist = await cbservice.Getlist();
    datalist = catelist;
    setState(() {});
  }

  var bcmtitle = TextEditingController();
  var bcmseqno = TextEditingController();
  var Eddittitle=TextEditingController();
  String? userId;

   void getdata() async {
    var data = await SharedPreferences.getInstance();
    userId = data.getString("userId");

    setState(() {});
  }

//   void seqNo()async{
//  sqno=await cbservice.GetSeqNo();
//  seqNos=sqno;
//  setState(() {
   
//  });

//   }

 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 234, 199, 234).withOpacity(0.6),
      backgroundColor: Colors.white,
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
          "Categories List",
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
      body: datalist.isEmpty
          
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              
              itemCount: datalist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle tap if needed
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
                        datalist[index].Bcmtitle,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: const Color.fromARGB(255, 72, 33, 243),
                        ),
                      ),
                      // leading: Icon(
                      //   Icons.category,
                      //   color: Colors.pinkAccent,
                      // ),
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.pinkAccent,
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
                                         hintText: datalist[index].Bcmtitle,
                                          border: OutlineInputBorder(
                                            
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green)
                                          ),
                                          
                                          suffixIcon: IconButton(onPressed: (){
                                            var Edd=Bussinesscategarios(
                          id: datalist[index].id,
                         AdminId: datalist[index].AdminId,
                        Bcmtitle: Eddittitle.text,
                        BcmSlug: Eddittitle.text,
                        BcmSeqNo: datalist[index].BcmSeqNo,
                       BcmActive: datalist[index].BcmActive,
                      BcmIsDelete: datalist[index].BcmIsDelete);

                      cbservice.eddit(Edd);
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
                                            fixedSize: Size(100, 50),
                                            shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.circular(2)
                                            )
                                          ),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text("Cancle", style: TextStyle(
                          
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
                                             var Edd=Bussinesscategarios(
                          id: datalist[index].id,
                         AdminId: datalist[index].AdminId,
                        Bcmtitle: Eddittitle.text,
                        BcmSlug: Eddittitle.text,
                        BcmSeqNo: datalist[index].BcmSeqNo,
                       BcmActive: datalist[index].BcmActive,
                      BcmIsDelete: datalist[index].BcmIsDelete);

                      cbservice.eddit(Edd);
                      setState(() {
                        
                      });
                                          }, child: Text("Save", style: TextStyle(
                          
                          fontWeight: FontWeight.bold,
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
                           var del=Bussinesscategarios(
                            id: datalist[index].id ,
                            AdminId:datalist[index].AdminId,
                            Bcmtitle: datalist[index].Bcmtitle,
                            BcmSlug: datalist[index].BcmSlug,
                            BcmSeqNo: datalist[index].BcmSeqNo,
                            BcmActive: datalist[index].BcmActive,
                            BcmIsDelete: datalist[index].BcmIsDelete
                            );

                             cbservice.Delete(del);
                            
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
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.lightBlue.shade100,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                height: 300,
                width: 350,
                margin: EdgeInsets.fromLTRB(10, 80, 10, 80),
                child: Card(
                  color: Colors.white,
                  elevation: 1,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          controller: bcmtitle,
                          decoration: InputDecoration(
                            hintText: "Enter Title ",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
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
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          var categary = Bussinesscategarios(
                            id: "00000000000000000000",
                            AdminId: userId.toString(),
                            Bcmtitle: bcmtitle.text,
                            BcmSlug: bcmtitle.text.toLowerCase(),
                            BcmSeqNo: 0,
                            BcmActive: true,
                            BcmIsDelete: false,
                          );
                          print(categary);

                          var result = await cbservice.create(categary);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Categerioslist()),
                          );
                          setState(() {});
                        },
                        child: Text("Submit"),
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}