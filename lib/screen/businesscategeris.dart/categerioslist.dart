import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/bussinesscategarios.dart';
import 'package:shopirox_app/screen/businesscategeris.dart/bussinesscategeris.dart';
import 'package:shopirox_app/services/admin/categeriosService.dart';



class Categerioslist extends StatefulWidget {
  const Categerioslist({super.key});

  @override
  State<Categerioslist> createState() => _CategerioslistState();
}

class _CategerioslistState extends State<Categerioslist> {
  var cbservice = Categeriosservice();
  late List<Bussinesscategarios> catelist;
  List<Bussinesscategarios> datalist = [];

   

  @override
  void initState() {
    super.initState();
    getdata();
    Getlist();
   
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
                      // leading: Text(sqno![index]),
                      trailing: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_drop_down),
                        color: Colors.pinkAccent,
                      ),
                      children: [
                       Row(
                        
                        children: [
                          InkWell(
                            onTap: () {
                              showBarModalBottomSheet(
                                topControl: Center(),
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
                            width: 50,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue,
                            ),
                            child:Center(
                              child:  Icon(Icons.edit_outlined,color: Colors.white,),
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
                            width: 50,
                             margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.red,
                            ),
                            child:Center(
                              child: Icon(Icons.delete_outline,color: Colors.white,),
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
              return Bucategeris();
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