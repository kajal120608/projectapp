import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/AdminModel.dart';
import 'package:shopirox_app/models/admin/tokenModel.dart';
import 'package:shopirox_app/screen/home.dart';
import 'package:shopirox_app/services/admin/Adminservice.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  var UserName=TextEditingController();
  var UserPassword=TextEditingController();

  var loginservice=Adminservice();
  
  Tokenmodel ?details;
  var response;
  var objt=true;
  var isloding=false;
 


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
      title: Text("Login"),
        //  title: Image.asset('asset/images/ka.png',height: 100,width: 200,),
        centerTitle: true,
      ),
      body:
          Container(
            height: 450,
            width: 375,
            margin: EdgeInsets.fromLTRB(10, 80, 10, 80),
            child:Card(
              color: Colors.white,
              elevation: 1,
              child:  Column(
                children: [
                  // Center(
                  //   child: Image.asset('asset/images/k.png',height: 70,width: 200,),
                  // ),
                 SizedBox(height: 10,),
                  Center(
                    child: Text("Sign In",style: TextStyle(fontSize: 21,color: Colors.blue[800],fontWeight: FontWeight.normal),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      
                     controller:UserName ,
                    decoration: InputDecoration(
                      
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2)),
                      suffixIcon: Icon(Icons.person),
                      hintText: "Enter UserName",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                  
                    ),
                  ),
                    ),

                    
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      obscureText: objt,
                     controller: UserPassword,
                    decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2)),
                      suffixIcon: IconButton(onPressed: (){
                        if(objt==true){
                           objt=false;
                        }
                        else{
                           objt=true;
                        }
                        setState(() {});
          
                      }, icon:objt==true? Icon(Icons.remove_red_eye,size: 30,): FaIcon(FontAwesomeIcons.eyeSlash,size:20,color: Colors.black,)),
                      hintText: "Enter password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                  contentPadding: EdgeInsets.all(20)
                    ),
                  ),
                    ),
                    SizedBox(height: 10,),
                   
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(320, 50),
                        backgroundColor: Colors.blue[400],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      onPressed: ()async{
                       isloding=true;
                       setState(() {
                         
                       });
                        var login=Adminmodel(
                          UserName: UserName.text,
                          password: UserPassword.text
                        );
                        var result=await loginservice.createlogin(login);
                      
                     
                      if(result.responsemsg=="Success"){
                      CircularProgressIndicator();
                        var data = await SharedPreferences.getInstance();
                       data.setString("userId", result.Id.toString()); 
                       data.setString("token", result.token.toString());
                       data.setString("login",result.responsemsg.toString());
                        print("User ID stored in SharedPreferences: ${result.Id}");
                        
                        
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Home(),));
                        setState(() {
                          
                        });
                       

                      }
                      else{
                        isloding=false;
                        print("Invalid credintiol");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid Credential")));
                        setState(() {
                          
                        });
                      }
                      
                    
                      }, child: isloding?Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize:20 ),),
                        ),
                        SizedBox(width: 30,),
                        Container(
                          child: CircularProgressIndicator(
                          
                            color: Colors.white,
                            
                          )
                     
                        )
                      ],):Text("Sign In",style: TextStyle(color: Colors.white,fontSize:20 ),)),
                 
                     
                ],
              ),
            )
            ),
          
      
         );
  }
}


//https://shopiroxapilocal.onrender.com/swagger/index.html
//password& username
//admin@demo.com
//Shopirox@123