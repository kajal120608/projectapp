class Tokenmodel {

  String? Id;
  String? name;
  String? token;
  String? email;
  String? responsemsg;


  Tokenmodel({
    this.Id,
    this.name,
    this.token,
    this.email,
    this.responsemsg

  });

  Map<String ,dynamic> tojson(){
    return {
   "id":Id,
   "name":name,
   "token":token,
   "email":email,
   "responseMessage":responsemsg
    };
  }

  factory Tokenmodel.fromjason(Map<String ,dynamic>tojson){
   return Tokenmodel(
    Id: tojson["id"],
    name: tojson["name"],
    token: tojson["token"],
    email: tojson["email"],
    responsemsg: tojson["responseMessage"]
    );
  }

}