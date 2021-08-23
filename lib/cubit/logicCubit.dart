import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onemore/card(GridView).dart';
import 'package:onemore/cubit/bigStates.dart';
import 'package:sqflite/sqflite.dart';
import '../deck(list_view).dart';
import '../gallery(ScreenHome).dart';

class LogicShowCubit extends Cubit<BigShowStates>{

  LogicShowCubit() : super(ShowInitialState());

  static LogicShowCubit get(context) => BlocProvider.of<LogicShowCubit>(context);

  int c_index=0;
  getIndex(int i){
    c_index=i;
    emit(ShowGetIndexState());
  }


  // setInList(dynamic v){
  //   task.add(v);
  //   // print("add ${task.length}");
  //   emit(ShowSetInListState());
  // }
 Widget buildPadding(dynamic model) {
   return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Container(
        color: Colors.white,
        height: 105,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image.network(
            //   "${model["image"]}",
            //   width: 100,
            //   height: 110,
            //   fit: BoxFit.fill,
            // ),
            // Icon(
            //   Icons.waves_outlined,
            //   size: 110,
            // ),
            SizedBox(width: 6,),
            Container(
              width: 301.42,
              padding: EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${model["name"]}"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${model["description"]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mail_outline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<Color> list_color=[
    Colors.green,
    Colors.blue,
    Colors.teal,
  ];
  List<Widget>list_widget=[
    deckListView(),
    CardGridView(),
    galleryScreenHome(),
  ];

  /*database functions*/
 //
 //  static late Database database;
 //
 //  void createDatabase() async {
 //    database=await openDatabase(
 //      'appSheet2.db',
 //      version: 1,
 //      onCreate: (database, version) {
 //        print("database created");
 //        database
 //            .execute(
 //            'CREATE TABLE tasks ( id INTEGER PRIMARY KEY,name TEXT,description TEXT,email TEXT,image TEXT)')
 //            .then((value) {
 //          print("table created");
 //        }).catchError((e) {
 //          print('Error when creating table ${e.toString()}');
 //        });
 //        emit(ShowCreateDatabaseState());
 //      },
 //      onOpen: (database) {
 //        print("database opened");
 //
 //      },
 //
 //    );
 //
 //  }
 //  insertDatabase({
 //    required String name,
 //    required String description,
 //    required String email,
 //    required String image,
 //  }) async {
 //    await database.transaction((txn) async {
 //       await txn
 //          .rawInsert('INSERT INTO tasks (name, description, email, image) VALUES("${name.toString()} ","${description.toString()}","${email.toString()}","${image.toString()}")')
 //          .then((value) {
 //        print("$value inserted successfully");
 //
 //        getData(database).then((value) {
 //          // setInList(value);
 //          deckListView.task1.cast().add(
 //              {"name":"$name","description":"$description","email":"$email","image":"$image",}
 //          );
 //          print(deckListView.task1);
 //          print("==================================================");
 //          print(deckListView.task1.length);
 //          emit(ShowGetDataState());
 //        });
 //
 //      }).catchError((e) {
 //        print("not good");
 //      });
 //    });
 //    emit(ShowInsertDatabaseState());
 //    return null;
 //  }
 //
 // static dynamic getData(database) async {
 //    return await database.rawQuery("SELECT * FROM tasks");
 //  }
 //
 //  void deltedb(int id){
 //    database
 //        .rawDelete('DELETE FROM tasks WHERE id = ?', [id]);
 //    print ("delete ");
 //  }


// void getData(database)async{
//   List<Map> task= await database.rawQuery("SELECT * FROM tasks");
//   print(task);
// }
  
  dynamic task=[];

  final databaseRef = FirebaseDatabase.instance.reference();

  setDataInFirebase({
    required String name,
    required String description,
    required String email,
    required String image,
}){
    databaseRef.push().set({
      'name': "$name",
      'description': '$description',
      "email":"$email",
      "Image":"$image",
    });
    emit(ShowInsertFirebaseState());
  }

  getDataFromFirebase(){
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
      task=snapshot.value;
      print("\n\nthis is the task $task\n\n");
      print(task.length);

    });

    emit(ShowGetDataState());
  }

}
