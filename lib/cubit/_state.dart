part of '_cubit.dart';

@immutable
abstract class  AuthState {}

class Initial extends AuthState {}

class ChangeBottomNavIndexState extends AuthState{}

class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class  FailedRegisterState extends AuthState {
  final String massege;
  FailedRegisterState({required this.massege});}

class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {}
class  FailedLoginState extends AuthState {
  final String massege;
  FailedLoginState({required this.massege});
}

class GetUserDataLoadingState extends AuthState {}
class GetUserDataSuccessState extends AuthState {}
class  FailedGetUserDataState extends AuthState {
  final String massege;
  FailedGetUserDataState({required this.massege});
}

class GetBannersLoadingState extends AuthState{}
class GetBannersSuccessState extends AuthState{}
class FailedGetBannersState extends AuthState{}

class GetCategoriesLoadingState extends AuthState{}
class GetCategoriesSuccessState extends AuthState{}
class FailedGetCategoriesState extends AuthState{}

class GetProductsLoadingState extends AuthState{}
class GetProductsSuccessState extends AuthState{}
class FailedGetProductsState extends AuthState{}

class GetFavoritesSuccessState extends AuthState{}
class FailedGetFavoritesState extends AuthState{}

class AddOrRemoveItemFromFavoritesSuccessState extends AuthState{}
class FailedToAddOrRemoveItemFromFavoritesState extends AuthState{}

class GetCartSuccessState extends AuthState{}
class FailedGetCartState extends AuthState{}

class AddOrRemoveItemFromCartsSuccessState extends AuthState{}
class FailedToAddOrRemoveItemFromCartsState extends AuthState{}

class FilterProductsSuccessState extends AuthState{}







