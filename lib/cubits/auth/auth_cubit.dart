import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:groceries_app/view/screens/login/login_screen.dart';
import 'package:groceries_app/view_model/data/network/end_points.dart';
import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  // making a controllers to catch what the user write in the formField .,
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // (CREATING OUR FUNCTIONS)

  //1st method to show and hidden the password
  // start (togglePassword Function) .
  void togglePassword() {
    hidden = !hidden;
    emit(TogglePasswordState());
  }
  // end of (togglePassword Function) .

  //2d method to handle actions when i call the (logIn Function) with API.
  // start (login Function)
  void login() async {
    emit(LoggingLoadingState());
    Dio dio = Dio();
    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    try {
      final response =
          await dio.post('${EndPoints.baseUrl}${EndPoints.logIn}', data: {
        "email": emailController.text,
        "password": passwordController.text,
      });

      print(response.statusCode);
      print(response.data);

      emit(LoggingSuccessfulState());
    } catch (e) {
      if (e is DioException) {
        emit(LoggingErrorState(
            e.response?.data?['message'].toString() ?? 'Error occurred'));
        return; // we used (return ;) here to stop OR skip any (if / else) below if he entered this (if) ,
      } else {
        emit(LoggingErrorState('Error occurred'));
      }
    }
  }
  // end of (login function)
}
