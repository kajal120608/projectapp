import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopirox_app/models/admin/bussinesstype.dart';


class Bussinesstypeservice {
  String Api="https://shopiroxapilocal.onrender.com/api/AdminBusinessType/Create";

  Future<void> create(Bussinesstype type)async{
    print(type);
 var dataget = await SharedPreferences.getInstance();

    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
    print(type.tojson());
  var result=post(Uri.parse(Api),
  headers: {
    'Content-Type': 'application/json',
     'Authorization': token
    },
  body: jsonEncode(type.tojson())
  );
  print(result);
  }

  String getapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessType/List";

  Future<List<Bussinesstype>>  Getlist()async{
     var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
  var result =await get(Uri.parse(getapi),
   headers: {
    'Content-Type': 'application/json',
    'Authorization': token
    },
   
  );
  List<dynamic> response = jsonDecode(result.body);

    List<Bussinesstype> data =
        response.map((dynamic items) => Bussinesstype.fromjason(items)).toList();
        
return data;
  }

String apiEdit="https://shopiroxapilocal.onrender.com/api/AdminBusinessType/Edit";

Future<void> eddit(Bussinesstype Edd)async{
   var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
print(Edd.Btmtitle);
var result=await post(Uri.parse(apiEdit),
headers: {'Content-Type': 'application/json', 'Authorization': token},
body: jsonEncode(Edd.tojson())
);
print(result);
}

String Deletapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessType/Delete";
Future<void> Delete(Bussinesstype Del)async{
 var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
var result=await post(Uri.parse(Deletapi),
headers: {'Content-Type': 'application/json', 'Authorization': token},
body: jsonEncode(Del.tojson())
);
print(result);
}

String Seqnoapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessType/GetSeqNo";

Future<List<Bussinesstype>> GetSeqNo ()async{
   var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
 var result =await get(Uri.parse(Seqnoapi),
   headers: {'Content-Type': 'application/json', 'Authorization': token},
   
  );
  List<dynamic> response=jsonDecode(result.body);
  print(result.body);
  List<Bussinesstype> data=response.map((dynamic item) =>Bussinesstype.fromjason(item) ,).toList();
  print(result);  
  return data;
}
  
}

