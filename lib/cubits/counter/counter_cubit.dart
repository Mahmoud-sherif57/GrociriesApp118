
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grociries_app/cubits/counter/counter_state.dart';

// we create our (CounterCubit) witch extends from (Cubit) ,
class CounterCubit extends Cubit<CounterState>{
  // we create the constructor and give the super the first state to start from (InitialCounterState) ,
  CounterCubit(): super(InitialCounterState());

int counter =0;
// we create the functions and emit it to state to tell the state that we have changes here so change yourself too and show it in the UI ,
  void initial(){
    counter=0;
    emit(InitialCounterState());
  }

    void reset(){
    counter=0;
    emit(ResetCounterState());
  }
  void increment(){
    counter++;
    emit(IncrementCounterState());
  }

  void decrement(){
    counter--;
    emit(DecrementCounterState());
  }

  // we create this function to
  static CounterCubit get (context)=> BlocProvider.of<CounterCubit>(context);


  List<String> inputs = [];

  TextEditingController inputController = TextEditingController();

  void addInput(){
    inputs.add(inputController.text);
    inputController.clear();
      emit(AddingNewInput());
  }
 void clearCounter(){
    inputs.remove(inputController.text);
      emit(RemovingCounter());
  }
void clearInputs(index){
    inputs.removeAt(index);
      emit(RemovingInputs());
  }

}

