
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


import 'NevigationBar.dart';
import 'cubit/BlocObserver.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => print("completed"));

  runApp( MyApp());

  // WidgetsFlutterBinding.ensureInitialized();
  // DatabaseReference ref=FirebaseDatabase.instance.reference().child('name');
  // ref.set("20");
  // FirebaseFirestore.instance.doc("test/test").get().then((v) {
    //   print(v.data());
    // });

  // Bloc.observer = MyBlocObserver();
  // runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppSheet',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(228, 247, 250, 247),
        appBarTheme: AppBarTheme(
        ),
      ),
      home:NevigationBar(),
    );
  }
}
