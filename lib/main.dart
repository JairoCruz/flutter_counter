//import 'package:counter/counter_functions_screen.dart';
import 'package:counter/counter_screen.dart';
import 'package:counter/myredux/reducer.dart';
//import 'package:counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


void main() {

  final store = Store<int>(counterReducer, initialState: 0);

  runApp(MainApp(store: store,));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.store});
  
  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    
    return  StoreProvider<int>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue
        ),
        //home: const CounterFunctionsScreen(),
        home: const CounterScreen(),
      ),
    );
  }
}
