import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/screen/bussinesstype/bussinesstypecreate.dart';
import 'package:shopirox_app/screen/home.dart';
import 'package:shopirox_app/screen/login.dart';



void main() {
  runApp(const MyApp());
 getdata();
}
var islogin1 =false;
void getdata()async{
var data=await SharedPreferences.getInstance();
     data.getString("login");
     if(data.getString("login")==null){
      islogin1=true;
      
     }
     else{
      islogin1=false;
     }
     
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project app',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home://Bussinesstypecreate()
      islogin1==true?login():Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
    
     
    );
  }
}
