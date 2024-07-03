import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grociries_app/cubits/counter/counter_cubit.dart';
import 'package:grociries_app/cubits/counter/counter_state.dart';
import 'package:grociries_app/view/screens/login/login_screen.dart';
import 'package:grociries_app/view_model/utils/app_functions.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            AppFunctions.navigateTo(context, LoginScreen() as Widget);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Text(
                'Counter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // here we called BlocBuilder to build the counter cubit , it takes 2 parameters <subject Cubit,subject State>   ,
              BlocBuilder<CounterCubit, CounterState>(
                // to build the cubit we call (builder) and return to it the part we need to build or the part witch change  ,
                builder: (context, state) {
                  return Text(
                    //we called the counter from the counter cubit by (CounterCubit.get.counter) then we turned it from <int> to <string> via (counter.toString()) ,
                    CounterCubit.get(context).counter.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),


              Expanded(child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap:(){
                            CounterCubit.get(context).clearInputs(index);
                          },
                            child: Text(CounterCubit.get(context).inputs[index]),
                        );
                      },
                      padding: EdgeInsets.all(12),
                      separatorBuilder: (context, index) {
                        return Divider(thickness: 2,color: Colors.green,);
                      },
                      itemCount: CounterCubit.get(context).inputs.length);
                },
              )),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        // we call the the reset function form the CounterCubit
                        CounterCubit.get(context).reset();
                      },
                      child: Icon(Icons.cleaning_services_rounded),
                      backgroundColor: Colors.green,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // we call the the decrement function form the CounterCubit
                        CounterCubit.get(context).decrement();
                      },
                      child: Icon(Icons.exposure_minus_1),
                      backgroundColor: Colors.green,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // we call the the increment function form the CounterCubit
                        CounterCubit.get(context).increment();
                      },
                      child: Icon(Icons.plus_one),
                      backgroundColor: Colors.green,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // we call the the increment function form the CounterCubit
                        CounterCubit.get(context).clearCounter();
                      },
                      child: Icon(Icons.restore_from_trash),
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(12),
                child: TextFormField(
                  controller: CounterCubit.get(context).inputController,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: (){},
                  onTapOutside: (_){
                    Focus.of(context).unfocus();
                  },
                  onFieldSubmitted: (value) {
                    CounterCubit.get(context).addInput();
                  },
                  decoration: InputDecoration(border: OutlineInputBorder(),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
