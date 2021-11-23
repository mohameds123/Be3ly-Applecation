import 'package:carshop/model/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '1.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class BegasModel {
  late final String image;

  BegasModel({
    required this.image,
  });
}

class KiaBegas extends StatefulWidget {
  @override
  _KiaBegasState createState() => _KiaBegasState();
}

class _KiaBegasState extends State<KiaBegas> {
  var imagecontroller = PageController();
  List<BegasModel> images = [
    BegasModel(
      image: 'images/pegas2.jpg',
    ),
    BegasModel(
      image: 'images/pegas3.jpg',
    ),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value:BlocProvider.of<PegasDetailsCubit>(context)..getDetailsData(),

       child: BlocConsumer<PegasDetailsCubit,DetailsState>(
         listener: (context,state){},
         builder: (context,state)=>Scaffold(
           appBar: AppBar(
             title: Text('Kia Pegas'),
           ),
           body: Padding(
             padding: const EdgeInsets.all(30.0),
             child: Column(
               children: [
                 Expanded(
                   child: PageView.builder(
                     physics: BouncingScrollPhysics(),
                     controller: imagecontroller,
                     onPageChanged: (int index) {
                       if (index == images.length - 1) {
                         setState(() {
                           isLast = true;
                         });
                         print('last');
                       } else {
                         setState(() {
                           isLast = false;
                         });
                       }
                     },
                     itemBuilder: (context, index) => pegasItem(images[index]),
                     itemCount: images.length,
                   ),
                 ),
                 SmoothPageIndicator(
                   controller: imagecontroller,
                   effect: ExpandingDotsEffect(
                     dotColor: Colors.grey,
                     dotHeight: 10,
                     expansionFactor: 4,
                     dotWidth: 10,
                     spacing: 5,
                   ),
                   count: images.length,
                 ),
                 SizedBox(height: 40.0,),
                 Text('Kia Pegas'),
                 Container(
                   width: MediaQuery.of(context).size.width *0.8,
                   height: MediaQuery.of(context).size.height *0.3,
                   child: ListView.separated(
                       itemBuilder:(context,index)=>Details(PegasDetailsCubit.get(context).detailsModel![index]),
                       separatorBuilder: (context,index)=>SizedBox(
                         height: 5.0,
                       ),
                       itemCount: PegasDetailsCubit.get(context).detailsModel!.length,
                   ),
                 ),
               ],
             ),
           ),
         ),
       ),
    );
  }
}

Widget pegasItem(BegasModel model) => Column(
      children: [
        Image(
            image: AssetImage(
          model.image,
        )),
      ],
    );
class Details extends StatelessWidget {
  DetailsModel detailsModel;
  Details(this.detailsModel);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassOne(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height *0.2,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(detailsModel.className??''),
              Text('السعر                         ${detailsModel.price??''}'),
              Text('اقل مقدم                      ${detailsModel.lessPayment}'),
              Text('اقل قسط                       ${detailsModel.lessPremium}'),
            ],
          ),
        ),
      ),
    );
  }
}
