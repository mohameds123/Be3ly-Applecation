class UserModel{
  String? uId;
  UserModel({
    this.uId,
  });
  UserModel.fromMap(Map<String,dynamic>jason){
    uId=jason['uId'];
  }
  Map<String,dynamic>toMap(){
    return{
      'uId':uId,
    };
  }
}