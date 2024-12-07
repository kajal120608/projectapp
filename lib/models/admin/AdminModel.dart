class Adminmodel {

  String ?UserName;
  String  ?password;

  Adminmodel({
    this.UserName,
    this.password
    
  });

  Map<String,dynamic> tojson(){
    return {
     "username":UserName,
     "password":password,
    };
  }

  factory Adminmodel.fromjason(Map<String,dynamic> json){
    return Adminmodel(
      UserName: json["username"],
      password: json["password"],
    );
  }
}

