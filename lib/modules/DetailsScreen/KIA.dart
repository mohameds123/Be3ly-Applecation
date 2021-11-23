import 'package:carshop/model/carModel.dart';
import 'package:carshop/modules/DetailsScreen/pegas/begas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'DetailsCubit/cubit.dart';
import 'DetailsCubit/state.dart';


class DetailsScreen extends StatelessWidget {
  String name;
  DetailsScreen(this.name);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<DetailsCubit>(context)..getKiaCarsData(this.name),
      child: BlocConsumer<DetailsCubit, DetailsSState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            elevation: 100.0,
            title: Center(
              child: Text('سيارات جديدة'),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(
                  'https://wallpapercave.com/wp/wp2187928.jpg',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 450,
                  child: Conditional.single(
                    context: context,
                    conditionBuilder: (context) =>
                    DetailsCubit.get(context).carsModel!.length > 0,
                    widgetBuilder: (context) => ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          KiaItem(DetailsCubit.get(context).carsModel![index]),
                      separatorBuilder: (context, state) => SizedBox(
                        height: 5.0,
                      ),
                      itemCount: DetailsCubit.get(context).carsModel!.length,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KiaItem extends StatelessWidget {
  CarsModel kiaModel;

  KiaItem(
    this.kiaModel,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KiaBegas(),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Column(
              children: [
                Text(kiaModel.priceFrom ?? ''),
                Text(kiaModel.priceTo ?? ''),
                Text('ــــــــــــــــــــــــــــــ'),
                Text(kiaModel.lessPayment ?? ''),
                Text(kiaModel.lessPremium ?? ''),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: [
                Image.network(
                  kiaModel.carImage ?? "",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 100,
                ),
                Text(kiaModel.carName ?? ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
