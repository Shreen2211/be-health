import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:be_health/ViewModel/Bloc/GetData/get_data_cubit.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ViewModel/utils/image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GetDataCubit.get(context);
    return Scaffold(
      backgroundColor: const Color(0xea1a0625),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: BlocConsumer<GetDataCubit, GetDataState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Hello ',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      Text(
                                        '${AuthCubit.get(context).userData[0]['name']}',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.amber),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Let\'s start your day',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      '${AuthCubit.get(context).userData[0]['img']}'),
                                ),
                                const Positioned(
                                  top: 80,
                                  left: 90,
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(Icons.task_alt_sharp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Today Workout Plan',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                      Text(
                        '6am-8am',
                        style: TextStyle(color: Colors.amber, fontSize: 17),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                '${cubit.workout[index]['img']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 90,
                              right: 65,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: myColor.backGround,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    '${cubit.workout[index]['name']}',
                                    style: const TextStyle(
                                        color: myColor.textTitle, fontSize: 17),
                                  ),
                                ),
                              )),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: cubit.workout.length,
                  )),
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Categories',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                      Text(
                        'See all',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            width: 75,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                '${cubit.categories[index]['img']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 80,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: myColor.backGround,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    '${cubit.categories[index]['name']}',
                                    style: const TextStyle(
                                        color: myColor.textTitle, fontSize: 17),
                                  ),
                                ),
                              )),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: cubit.categories.length,
                  )),
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Tranding',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                      Text(
                        'See all',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            width: 220,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                '${cubit.categories[index]['img']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 90,
                              right: 110,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: myColor.backGround,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    '${cubit.trending[index]['name']}',
                                    style: const TextStyle(
                                        color: myColor.textTitle, fontSize: 17),
                                  ),
                                ),
                              )),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: cubit.trending.length,
                  )),
                  const Row(
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            width: 220,
                            height: 170,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                AllImage.food,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 90,
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
                                        color: myColor.textTitle, fontSize: 17),
                                  ),
                                ),
                              )),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 4,
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
