class NewCarsModel {
  String? name;
  String? image;
  String ?id;

  NewCarsModel({
    this.name,
    this.image,
    this.id,
  });

  NewCarsModel.fromMap(Map<String, dynamic>jason){
    name = jason['name'];
    image = jason['image'];
    id = jason['id'];
  }
  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'image':image,
      'id':id,
    };
  }
}