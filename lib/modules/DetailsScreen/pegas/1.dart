import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BegasModel {
  late final String image;

  BegasModel({
    required this.image,
  });
}

class ClassOne extends StatefulWidget {
  @override
  _ClassOneState createState() => _ClassOneState();
}

class _ClassOneState extends State<ClassOne> {
  var imagecontroller = PageController();
  List<BegasModel> images = [
    BegasModel(
      image: 'images/c1.jpg',
    ),
    BegasModel(
      image: 'images/c1-2.jpg',
    ),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 80,bottom: 30),
            child: Column(children: [
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
                  itemBuilder: (context, index) =>
                      CategoryOneItem(images[index]),
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
            ],
            ),
        ),
    );
  }
}

Widget CategoryOneItem(BegasModel model) => Column(
      children: [
        Image(
            image: AssetImage(
          model.image,
        )),
      ],
    );
