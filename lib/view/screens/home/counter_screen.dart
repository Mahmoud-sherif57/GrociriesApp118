import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/counter/counter_cubit.dart';
import 'package:groceries_app/cubits/counter/counter_state.dart';
import 'package:groceries_app/view/screens/login/login_screen.dart';
import 'package:groceries_app/view_model/utils/app_functions.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AppFunctions.navigateTo(context, const LoginScreen() as Widget);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              const Text(
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
                      padding: const EdgeInsets.all(12),
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 2,color: Colors.green,);
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
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.cleaning_services_rounded),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // we call the the decrement function form the CounterCubit
                        CounterCubit.get(context).decrement();
                      },
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.exposure_minus_1),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // we call the the increment function form the CounterCubit
                        CounterCubit.get(context).increment();
                      },
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.plus_one),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // we call the the increment function form the CounterCubit
                        CounterCubit.get(context).clearCounter();
                      },
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.restore_from_trash),
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
                  decoration: const InputDecoration(border: OutlineInputBorder(),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
