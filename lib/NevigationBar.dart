import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'FormScreen.dart';
import 'ListOfItems.dart';
import 'cubit/bigStates.dart';
import 'cubit/logicCubit.dart';

class NevigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicShowCubit(),
      child: BlocConsumer<LogicShowCubit, BigShowStates>(
        listener: (context, state) {},
        builder: (context, state) {
         LogicShowCubit cubit = LogicShowCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: cubit.list_color[cubit.c_index],
              ),
              drawer: Drawer(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.account_balance),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "test",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.account_balance),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "test",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.account_balance),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "test",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.account_balance),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "test",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: cubit.list_widget[cubit.c_index],
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: cubit.list_color[cubit.c_index],
                currentIndex: cubit.c_index,
                onTap: (value) {
                  cubit.getIndex(value);
                },
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Colors.green,
                      icon: Icon(Icons.list_outlined),
                      label: 'list view'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.credit_card_sharp), label: 'card'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.table_chart_outlined), label: 'gallery'),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // print("${LogicShowCubit.task}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormScreen()),
                  );
                  // deckListView(n: "${back[0]}",d: "${back[1]}",e: "${back[2]}",i: "${back[3]}");
                  cubit.getDataFromFirebase();
                },
                child: Icon(
                  Icons.add,
                ),
                backgroundColor: cubit.list_color[cubit.c_index],
              ),
            ),
          );
        },
      ),
    );
  }

}

