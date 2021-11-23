class CarsModel {
  String? carName;
  String? carImage;
  String ?id;
  String? priceFrom;
  String?priceTo;
  String? lessPayment;
  String? lessPremium;
  CarsModel({
    this.carName,
    this.carImage,
    this.id,
    this.lessPayment,
    this.lessPremium,
    this.priceFrom,
    this.priceTo,
  });

  CarsModel.fromMap(Map<String, dynamic>jason){
    carName = jason['carName'];
    carImage = jason['carImage'];
    lessPayment = jason['lessPayment'];
    lessPremium = jason['lessPremium'];
    priceFrom = jason['priceFrom'];
    priceTo = jason['priceTo'];
    id = jason['id'];
  }
  Map<String,dynamic>toMap(){
    return{
      'carName':carName,
      'carImage':carImage,
      'lessPayment':lessPayment,
      'lessPremium':lessPremium,
      'priceFrom':priceFrom,
      'priceTo':priceTo,
      'id':id,
    };
  }
}