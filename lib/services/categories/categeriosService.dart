import 'dart:convert';

import 'package:http/http.dart';
import 'package:shopirox_app/models/categarios/bussinesscategarios.dart';

class Categeriosservice {
  String Api="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/Create";

  Future<void> create(Bussinesscategarios Categories)async{
    print(Categories.tojson());
  var result=post(Uri.parse(Api),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode(Categories.tojson())
  );
  print(result);
  }

  String getapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/List";

  Future<List<Bussinesscategarios>>  Getlist()async{
  var result =await get(Uri.parse(getapi),
   headers: {'Content-Type': 'application/json'},
   
  );
  List<dynamic> response = jsonDecode(result.body);

    List<Bussinesscategarios> data =
        response.map((dynamic items) => Bussinesscategarios.fromjason(items)).toList();
        
return data;
  }

String apiEdit="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/Edit";

Future<void> eddit(Bussinesscategarios Edd)async{
print(Edd.Bcmtitle);
var result=await post(Uri.parse(apiEdit),
headers: {'Content-Type': 'application/json'},
body: jsonEncode(Edd.tojson())
);
print(result);
}

String Deletapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/Delete";
Future<void> Delete(Bussinesscategarios Del)async{

var result=await post(Uri.parse(Deletapi),
headers: {'Content-Type': 'application/json'},
body: jsonEncode(Del.tojson())
);
print(result);
}

String Noapi="https://shopiroxapilocal.onrender.com/api/AdminBusinessCategory/GetSeqNo";

Future<void> GetSeqNo ()async{
 var result =await get(Uri.parse(Noapi),
   headers: {'Content-Type': 'application/json'},
   
  );
  print(result);  
}
  
}

