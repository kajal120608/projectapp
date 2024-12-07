
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shopirox_app/models/admin/AdminModel.dart';
import 'package:shopirox_app/models/admin/tokenModel.dart';

class Adminservice {

  String apiUrl="https://shopiroxapilocal.onrender.com/api/Admin/Login";



Future<Tokenmodel> createlogin(Adminmodel login)async{
  
var result=await post(Uri.parse(apiUrl),
 headers: {'Content-Type': 'application/json'},
 body: jsonEncode(login.tojson())
);
print(result.body);
 var data=Tokenmodel.fromjason(jsonDecode(result.body));
 


return data;
}
  


  


}

// var data = Tokenmodel.fromjason(jsonDecode(result.body));
// print(data.responsemsg);