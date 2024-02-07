import 'package:be_health/ViewModel/Bloc/GetData/get_data_cubit.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: myColor.backGround,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: myColor.appColor
          ),
          elevation: 0,
          backgroundColor: myColor.appColor,
          title: const Text('Diet Plan'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  color: Colors.grey,
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    color: Colors.amber,
                  ),
                  tabs: const [
                    Tab(
                      child: Text('BreakFast'),
                    ),
                    Tab(
                      child: Text('lunch'),
                    ),
                    Tab(
                      child: Text('Dinner'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: BlocConsumer<GetDataCubit, GetDataState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return TabBarView(physics: const BouncingScrollPhysics(), children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                         '${GetDataCubit.get(context).breakfast[index]['img']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    /*Positioned(
                        top: 130,
                        right: 110,
                        child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: myColor.backGround,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'data',
                              style: TextStyle(
                                  color: myColor.textTitle, fontSize: 20),
                            ),
                          ),
                        )),*/
                  ],
                );
              },
              itemCount: GetDataCubit.get(context).breakfast.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          '${GetDataCubit.get(context).lunch[index]['img']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                   /* Positioned(
                        top: 130,
                        right: 110,
                        child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: myColor.backGround,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'data',
                              style: TextStyle(
                                  color: myColor.textTitle, fontSize: 20),
                            ),
                          ),
                        ))*/
                  ],
                );
              },
              itemCount:  GetDataCubit.get(context).lunch.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:  Image.network(
                          '${GetDataCubit.get(context).dinner[index]['img']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    /*Positioned(
                        top: 130,
                        right: 110,
                        child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: myColor.backGround,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'data',
                              style: TextStyle(
                                  color: myColor.textTitle, fontSize: 20),
                            ),
                          ),
                        )),*/
                  ],
                );
              },
              itemCount:  GetDataCubit.get(context).dinner.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            ),
          ),
        ]);
  },
),
      ),
    );
  }
}
