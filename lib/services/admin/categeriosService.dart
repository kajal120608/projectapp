import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/bussinesscategarios.dart';


class Categeriosservice {
  String Api="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/Create";

  Future<void> create(Bussinesscategarios Categories)async{
 var dataget = await SharedPreferences.getInstance();

    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
    print(Categories.tojson());
  var result=post(Uri.parse(Api),
  headers: {
    'Content-Type': 'application/json',
     'Authorization': token
    },
  body: jsonEncode(Categories.tojson())
  );
  print(result);
  }

  String getapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/List";

  Future<List<Bussinesscategarios>>  Getlist()async{
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

    List<Bussinesscategarios> data =
        response.map((dynamic items) => Bussinesscategarios.fromjason(items)).toList();
        
return data;
  }

String apiEdit="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/Edit";

Future<void> eddit(Bussinesscategarios Edd)async{
   var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
print(Edd.Bcmtitle);
var result=await post(Uri.parse(apiEdit),
headers: {'Content-Type': 'application/json', 'Authorization': token},
body: jsonEncode(Edd.tojson())
);
print(result);
}

String Deletapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/Delete";
Future<void> Delete(Bussinesscategarios Del)async{
 var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
var result=await post(Uri.parse(Deletapi),
headers: {'Content-Type': 'application/json', 'Authorization': token},
body: jsonEncode(Del.tojson())
);
print(result);
}

String Seqnoapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/GetSeqNo";

Future<String> GetSeqNo ()async{
   var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
 var result =await get(Uri.parse(Seqnoapi),
   headers: {'Content-Type': 'application/json', 'Authorization': token},
   
  );
  print(result.body);
  return result.body;
}
  
}

