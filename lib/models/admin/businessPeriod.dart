import 'package:flutter/foundation.dart';

class businessPeriod {

  String Id;
  String adminId;
  String BpmTitle;
  String BpmSeqNo;
  String BpmDelete;
  String BpmIsActive;

  businessPeriod({
required  this.Id,
required this.adminId,
required this.BpmTitle,
required this.BpmSeqNo,
required this.BpmDelete,
required this.BpmIsActive
  });

  Map<String,dynamic> tojson (){
    return {
   "id":Id,
   "adminId":adminId,
   "bpmTitle":BpmTitle,
   "bpmSeqNo":BpmSeqNo,
   "bpmDelete":BpmDelete,
   "bpmIsActive":BpmIsActive
    };

    
  }

  factory businessPeriod.fromjason(Map<String,dynamic>item){
      return businessPeriod(
        Id: item["id"],
        adminId:item["adminId"] ,
         BpmTitle: item["bpmTitle"], 
         BpmSeqNo: item["bpmSeqNo"],
         BpmDelete: item["bpmDelete"],
           BpmIsActive: item["bpmIsActive"]);
  }
  
}