import 'package:be_health/View/component/WidgetDetails/ContainerSeeAll.dart';
import 'package:be_health/ViewModel/Bloc/GetData/get_data_cubit.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDetails extends StatelessWidget {
  CategoriesDetails({super.key, required this.nameCategories,});

  String nameCategories;

  @override
  Widget build(BuildContext context) {
    var cubit;
    if (nameCategories == 'Categories') {
      cubit = GetDataCubit
          .get(context)
          .categories;
    }
    else if(nameCategories == 'Trending') {
      cubit = GetDataCubit
          .get(context)
          .trending;
    }else if(nameCategories == 'Workout'){
      cubit = GetDataCubit
          .get(context)
          .workout;
    }
    return Scaffold(
      backgroundColor: myColor.backGround,
      appBar: AppBar(
        centerTitle: true,
        title: Text(nameCategories),
        backgroundColor: myColor.appColor,
        elevation: 0,
      ),
      body: BlocConsumer<GetDataCubit, GetDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListView.builder(itemBuilder: (context, index) {
            return ContainerSeeAll(
              img: '${cubit[index]['img']}',
              text:'${cubit[index]['name']}',
              onTap: () {},);
          }, itemCount: cubit.length,);
        },
      ),
    );
  }
}
