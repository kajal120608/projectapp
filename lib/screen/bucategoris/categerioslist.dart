import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/categarios/bussinesscategarios.dart';
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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 155, 219, 250),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 0.10),
              ),
            ],
          ),
        ),
        title: Text(
          "Categories List",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 5.0,
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
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                     clipBehavior: Clip.antiAlias,
                    child: ExpansionTile(
                    enabled: true,
                      minTileHeight: 70,
                      
               shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),

               ),
                      backgroundColor: Colors.blue.shade50,
                      collapsedBackgroundColor: Colors.blue.shade100,
                      title: Text(
                        datalist[index].Bcmtitle,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
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
                           Container(
                            height: 50,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue,
                            ),
                            child:Center(child: Text("Eddit",style: TextStyle(color: Colors.white,fontSize: 20,),),)
                          ),
                        Container(
                            height: 50,
                            width: 100,
                             margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.red,
                            ),
                            child:Center(child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 20,),),)
                          ),
                        
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
                            BcmSeqNo: int.tryParse(bcmseqno.text) ?? 0,
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