import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Firebase/firebaseConstant.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  static GetDataCubit get(context) => BlocProvider.of<GetDataCubit>(context);

  List<QueryDocumentSnapshot> userData = [];
  List<QueryDocumentSnapshot> workout = [];
  List<QueryDocumentSnapshot> lunch = [];
  List<QueryDocumentSnapshot> dinner = [];
  List<QueryDocumentSnapshot> breakfast = [];
  List<QueryDocumentSnapshot> categories = [];
  List<QueryDocumentSnapshot> trending = [];
  List<QueryDocumentSnapshot> discover = [];

  var db = FirebaseFirestore.instance;

  Future<void> getWorkoutFromFireStore() async {
    emit(GetWorkLoadingState());
    QuerySnapshot work = await FirebaseFirestore.instance
        .collection(FirebaseKeys.workoutPlan)
        .get();
    workout.addAll(work.docs);
    emit(GetWorkSuccessfulState());
  }

  Future<void> getLunchFromFireStore() async {
    emit(GetLunchLoadingState());
    QuerySnapshot lunchFood =
    await db.collection(FirebaseKeys.lunch).get();
    lunch.addAll(lunchFood.docs);
    emit(GetLunchSuccessfulState());
  }

  Future<void> getDinnerFromFireStore() async {
    emit(GetDinnerLoadingState());
    QuerySnapshot dinnerFood =
    await db.collection(FirebaseKeys.dinner).get();
    dinner.addAll(dinnerFood.docs);
    emit(GetDinnerSuccessfulState());
  }

  Future<void> getBreakFastFromFireStore() async {
    emit(GetBreakFastLoadingState());
    QuerySnapshot breakFastFood = await db
        .collection(FirebaseKeys.breakFast)
        .get();
    breakfast.addAll(breakFastFood.docs);
    emit(GetBreakFastSuccessfulState());
  }

  Future<void> getTrendingFromFireStore() async {
    emit(GetTrendingLoadingState());
    QuerySnapshot trend = await db
        .collection(FirebaseKeys.trending)
        .get();
    trending.addAll(trend.docs);
    emit(GetTrendingSuccessfulState());
  }
  Future<void> getCategoriesFromFireStore() async {
    emit(GetCategoriesLoadingState());
    QuerySnapshot cate = await db
        .collection(FirebaseKeys.categories)
        .get();
    categories.addAll(cate.docs);
    emit(GetCategoriesSuccessfulState());
  }


}
