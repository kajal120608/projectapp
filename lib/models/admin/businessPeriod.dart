

class businessPeriod {

  String Id;
  String adminId;
  String BpmTitle;
  int BpmSeqNo;
  bool BpmDelete;
  bool BpmIsActive;

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
       BpmDelete: item["bpmIsDelete"],
       BpmIsActive: item["bpmActive"]);
  }
  
}