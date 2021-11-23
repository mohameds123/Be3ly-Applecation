class Bee3Model{
  String? status;
  String? image;
  String? model;
  String? elmadena;
  String?model3am;
  String?toraz;
  String ?No3NaqelEl7araka;
  String?color;
  String?price;
  String?phoneNum;
  String?location;
  String?uid;
  Bee3Model({
    this.color,
    this.price,
    this.elmadena,
    this.model,
    this.location,
    this.model3am,
    this.No3NaqelEl7araka,
    this.phoneNum,
    this.toraz,
    this.image,
    this.uid,
  });
  Bee3Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    color = json['color'];
    price = json['price'];
    elmadena = json['elmadena'];
    model = json['model'];
    location = json['location'];
    No3NaqelEl7araka = json['No3NaqelEl7araka'];
    phoneNum = json['phoneNum'];
    toraz = json['toraz'];
    model3am = json['model3am'];
    uid = json['uId'];
    image = json['image']!=null?json['image']:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQJ5-8i40JZqhetGuqQBHxqSW71maPLNm6-Hc7IFDgvZfCC6zNDdROWUD08RmrCJRdNjE&usqp=CAU';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['color'] = this.color;
    data['price'] = this.price;
    data['elmadena'] = this.elmadena;
    data['model'] = this.model;
    data['location'] = this.location;
    data['No3NaqelEl7araka'] = this.No3NaqelEl7araka;
    data['phoneNum'] = this.phoneNum;
    data['toraz'] = this.toraz;
    data['model3am'] = this.model3am;
    data['image'] = this.image;
    data['uId'] = this.uid;
    return data;
  }
}