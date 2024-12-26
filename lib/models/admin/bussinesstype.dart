import 'package:flutter/foundation.dart';

class Bussinesstype {
 
  String id;
  String AdminId;
  String Btmtitle;
  int BtmSeqNo;

  
  bool BtmActive;
bool BtmIsDelete;

Bussinesstype({
 required this.id,
 required this.AdminId,
  required this.Btmtitle,
 
  required this.BtmSeqNo,
  required this.BtmActive,
  required this.BtmIsDelete, 
});

Map<String,dynamic> tojson(){
  return{
   "id":id ,
  "adminId": AdminId,
  "btmTitle":Btmtitle ,
  
  "btmSeqNo":BtmSeqNo ,
  "btmActive":BtmActive,
  "btmIsDelete": BtmIsDelete

  };
}

factory Bussinesstype.fromjason(Map<String,dynamic>item){
  return Bussinesstype(
    id: item["id"],
     AdminId: item["adminId"],
      Btmtitle: item["btmTitle"],
       BtmSeqNo: item["btmSeqNo"],
        BtmActive: item["btmActive"],
         BtmIsDelete: item["btmIsDelete"],);
}
}