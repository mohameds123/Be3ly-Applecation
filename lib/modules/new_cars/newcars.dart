import 'package:carshop/model/newcars.dart';
import 'package:carshop/modules/DetailsScreen/KIA.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class NewCarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<NewCarsCubit>(context)..getNewCarsData(),
        child: BlocConsumer<NewCarsCubit, NewCarsStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'New Cars',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 10.0),
              child: Container(
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      NewCarsCubit.get(context).newCarsModel!.length > 0,
                  widgetBuilder: (context) => ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => NewCarItem(
                        NewCarsCubit.get(context).newCarsModel![index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5.0,
                    ),
                    itemCount: NewCarsCubit.get(context).newCarsModel!.length,
                  ),
                  fallbackBuilder: (context) => Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Center(
                      child: LoadingIndicator(
                          indicatorType: Indicator.ballRotateChase,
                          colors: const [Colors.red],
                          strokeWidth: 2,
                          backgroundColor: Colors.white54,
                          pathBackgroundColor: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class NewCarItem extends StatelessWidget {
  NewCarsModel newCarsModel;

  NewCarItem(
    this.newCarsModel,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DetailsScreen(
                  newCarsModel.name![0].toUpperCase() +
                      newCarsModel.name!.substring(1)),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              newCarsModel.image ?? "",
              width: 100,
              height: 100,
            ),
            Text(
              newCarsModel.name ?? "",
            ),
          ],
        ),
      ),
    );
  }
}
