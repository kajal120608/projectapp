
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shopirox_app/models/admin/AdminModel.dart';
import 'package:shopirox_app/models/admin/tokenModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Adminservice {

  String apiUrl="https://shopiroxapilocal.onrender.com/api/Admin/Login";



Future<Tokenmodel> createlogin(Adminmodel login)async{
var dataget = await SharedPreferences.getInstance();
var token= "Bearer "+dataget.getString("token").toString();
print(token);
var result=await post(Uri.parse(apiUrl),
 headers: {
  'Content-Type': 'application/json',
  'Aurthorizetion':token
  },
 body: jsonEncode(login.tojson())
);
print(result.body);
 var data=Tokenmodel.fromjason(jsonDecode(result.body));
 


return data;
}
  


  


}

// var data = Tokenmodel.fromjason(jsonDecode(result.body));
// print(data.responsemsg);