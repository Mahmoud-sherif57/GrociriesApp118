
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grociries_app/cubits/auth/auth_state.dart';
import 'package:grociries_app/view/screens/login/login_screen.dart';

class AuthCubit extends Cubit<AuthState> {
 AuthCubit(): super(InitialAuthState());

 static AuthCubit get (context)=> BlocProvider.of<AuthCubit>(context);



void togglePassword(){
 hidden = !hidden;
 emit(TogglePasswordState());
}

void login () async{
 emit (LogIngLoadingState());
 await Future.delayed(Duration(seconds: 2), (){
  emit(LogIngSuccessfulState());
 });
}
}
