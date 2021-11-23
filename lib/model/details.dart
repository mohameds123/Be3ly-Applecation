class DetailsModel {
  String? className;
  String ?id;
  String? price;
  String? lessPayment;
  String? lessPremium;
  DetailsModel({
    this.className,
    this.id,
    this.lessPayment,
    this.lessPremium,
    this.price,
  });

  DetailsModel.fromMap(Map<String, dynamic>jason){
    className = jason['className'];
    lessPayment = jason['lessPayment'];
    lessPremium = jason['lessPremium'];
    price = jason['price'];
    id = jason['id'];
  }
  Map<String,dynamic>toMap(){
    return{
      'className':className,
      'lessPayment':lessPayment,
      'lessPremium':lessPremium,
      'price':price,
      'id':id,
    };
  }
}