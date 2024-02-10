import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:be_health/ViewModel/Bloc/GetData/get_data_cubit.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ViewModel/utils/image.dart';
import '../../../main.dart';
import '../../component/WidgetDetails/DisplayHome.dart';
import '../../component/WidgetDetails/StackList.dart';
import 'Details/CategoriesDetails.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GetDataCubit.get(context);
    var cubitAuth = AuthCubit.get(context);
    return Scaffold(
      backgroundColor: myColor.backGround,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (MyApp.sign == true) {
            cubitAuth.getUserFromFireStore(MyApp.currentEmail);
          }
          return SafeArea(
            child: cubitAuth.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                    color: myColor.backButton,
                  ))
                : Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: BlocConsumer<GetDataCubit, GetDataState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Hello ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              '${AuthCubit.get(context).userData[0]['firstName']}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.amber),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          'Let\'s start your day',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        '${AuthCubit.get(context).userData[0]['img']}'),
                                  ),
                                ],
                              ),
                            ),
                            DisplayHome(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoriesDetails(
                                          nameCategories: 'Workout'),
                                    ));
                              },
                              title: 'Today Workout Plan',
                            ),
                            Expanded(
                                child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return StackList(
                                  namedTrack:
                                      ' ${cubit.workout[index]['name']} ',
                                  imgTrack: '${cubit.workout[index]['img']}',
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: cubit.workout.length,
                            )),
                            DisplayHome(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoriesDetails(
                                          nameCategories: 'Categories'),
                                    ));
                              },
                              title: 'Categories',
                            ),
                            Expanded(
                                child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return StackList(
                                  namedTrack:
                                  ' ${cubit.categories[index]['name']} ',
                                  imgTrack: '${cubit.categories[index]['img']}',
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: cubit.categories.length,
                            )),
                            DisplayHome(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoriesDetails(
                                          nameCategories: 'Trending'),
                                    ));
                              },
                              title: 'Trending',
                            ),
                            Expanded(
                                child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return StackList(
                                  namedTrack:
                                  ' ${cubit.trending[index]['name']} ',
                                  imgTrack: '${cubit.trending[index]['img']}',
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: cubit.trending.length,
                            )),
                          ],
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
