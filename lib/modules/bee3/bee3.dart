import 'package:carshop/modules/used_cars/usedcars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Bee3Screen extends StatefulWidget {
  @override
  _Bee3ScreenState createState() => _Bee3ScreenState();
}

class _Bee3ScreenState extends State<Bee3Screen> {
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    @override
    void initState() {
      super.initState();
    }

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }
  @override
  void dispose() {
   Bee3Cubit.get(context).textEmpty();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Bee3Cubit, Bee3State>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 20.0,
          title: Text(
            'Bee3',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (images.isEmpty)
                      Image.asset(
                          'images/card.jpg'),
                    if (images.isNotEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width *0.8,
                        height: MediaQuery.of(context).size.height *0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          itemCount: images.length,
                          itemBuilder: (ctx, index){
                            return AssetThumb(asset: images[index], width: 60, height: 60);
                          },
                        ),
                      ),
                    TextButton(
                        onPressed: () {
                          //Bee3Cubit.get(context).imagePicker();
                          loadAssets();
                        },
                        child: Text('chose photo')),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: Bee3Cubit.get(context).modelController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    المركات والموديلات',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: Bee3Cubit.get(context).toraztroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    طراز',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: Bee3Cubit.get(context).model3amController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    موديل عام',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: Bee3Cubit.get(context).elmadenaController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    المدينة',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: Bee3Cubit.get(context).locationController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    مكان المعاينة',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller:
                              Bee3Cubit.get(context).no3NaqelEl7rakaController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    نوع ناقل الحركة',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: Bee3Cubit.get(context).colorController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    اللون',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: Bee3Cubit.get(context).priceController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    السعر',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller:
                              Bee3Cubit.get(context).whatsappNamberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '    رقم الواتساب',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Center(
                      child: Text(
                        '*برجاء ادخال جميع البيانات المطلوبة*',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Center(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Bee3Cubit.get(context).getCars();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UsedCars(),
                              ),
                            );
                          },
                          child: Text(
                            'حفظ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
