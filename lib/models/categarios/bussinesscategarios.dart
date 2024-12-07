import 'package:flutter/foundation.dart';

class Bussinesscategarios {
 
  String id;
  String AdminId;
  String Bcmtitle;
  String BcmSlug;
  int BcmSeqNo;
  bool BcmActive;
bool BcmIsDelete;

Bussinesscategarios({
 required this.id,
 required this.AdminId,
  required this.Bcmtitle,
 required this.BcmSlug,
  required this.BcmSeqNo,
  required this.BcmActive,
  required this.BcmIsDelete
});

Map<String,dynamic> tojson(){
  return{
   "id":id ,
  "adminId": AdminId,
  "bcmTitle":Bcmtitle ,
  "bcmSlug":BcmSlug ,
  "bcmSeqNo":BcmSeqNo ,
  "bcmActive":BcmActive,
  "bcmIsDelete": BcmIsDelete

  };
}

factory Bussinesscategarios.fromjason(Map<String,dynamic>item){
  return Bussinesscategarios(
    id: item["id"],
     AdminId: item["adminId"],
      Bcmtitle: item["bcmTitle"],
       BcmSlug: item["bcmSlug"], 
       BcmSeqNo: item["bcmSeqNo"],
        BcmActive: item["bcmActive"],
         BcmIsDelete: item["bcmIsDelete"]);
}
}