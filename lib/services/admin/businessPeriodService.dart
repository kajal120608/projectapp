import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopirox_app/models/admin/businessPeriod.dart';


class businessPeriodService{

   String Api="https://shopiroxapilocal.onrender.com/api/AdminBusinessPeriod/Create";

  Future<void> create(businessPeriod Period)async{
    
 var dataget = await SharedPreferences.getInstance();

    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
    print(Period.tojson());
    
  var result=post(Uri.parse(Api),
  headers: {
    'Content-Type': 'application/json',
     'Authorization': token
    },
  body: jsonEncode(Period.tojson())
  );
  print(result);
  }

  String getapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessPeriod/List";

  Future<List<businessPeriod>>  Getlist()async{
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

    List<businessPeriod> data =
        response.map((dynamic items) => businessPeriod.fromjason(items)).toList();
        
return data;
  }

String apiEdit="https://shopiroxapilocal.onrender.com/api/AdminBusinessPeriod/Edit";

Future<void> eddit(businessPeriod Edd)async{
   var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
print(Edd.BpmTitle);
var result=await post(Uri.parse(apiEdit),
headers: {'Content-Type': 'application/json', 'Authorization': token},
body: jsonEncode(Edd.tojson())
);
print(result);
}

String Deletapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessPeriod/Delete";
Future<void> Delete(businessPeriod Del)async{
 var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
var result=await post(Uri.parse(Deletapi),
headers: {'Content-Type': 'application/json', 'Authorization': token},
body: jsonEncode(Del.tojson())
);
print(result);
}

String Snoapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessPeriod/GetSeqNo";

Future<List<businessPeriod>> GetSeqNo ()async{
   var dataget = await SharedPreferences.getInstance();
    var token= "Bearer "+dataget.getString("token").toString();
    print("token"+token);
 var result =await get(Uri.parse(Snoapi),
   headers: {'Content-Type': 'application/json', 'Authorization': token},
   
  );
  List<dynamic> response=jsonDecode(result.body);
  List<businessPeriod> data=response.map((dynamic item) =>businessPeriod.fromjason(item) ,).toList();
  print(result);  
  return data;
}
  
}

