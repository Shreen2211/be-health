part of 'get_data_cubit.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class GetLunchSuccessfulState extends GetDataState {}

class GetLunchLoadingState extends GetDataState {}

class GetDinnerSuccessfulState extends GetDataState {}

class GetDinnerLoadingState extends GetDataState {}

class GetBreakFastSuccessfulState extends GetDataState {}

class GetBreakFastLoadingState extends GetDataState {}

class GetWorkLoadingState extends GetDataState {}

class GetWorkSuccessfulState extends GetDataState {}

class GetCategoriesLoadingState extends GetDataState {}

class GetCategoriesSuccessfulState extends GetDataState {}

class GetTrendingLoadingState extends GetDataState {}

class GetTrendingSuccessfulState extends GetDataState {}

class GetDiscoverLoadingState extends GetDataState {}

class GetDiscoverSuccessfulState extends GetDataState {}
