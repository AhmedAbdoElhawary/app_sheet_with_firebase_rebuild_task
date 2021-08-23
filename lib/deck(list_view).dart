import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onemore/cubit/bigStates.dart';
import 'package:onemore/cubit/logicCubit.dart';

class deckListView extends StatelessWidget {
 // static List<Map>task=[
 //    {"name":"ahmed","description":"learn"},
 //    {"name":"abdo","description":"learn"},
 //    {"name":"ali","description":"learn"},
 //    {"name":"salama","description":"learn"},
 //    {"name":"ahmed","description":"learn"},
 //
 //  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicShowCubit,BigShowStates>(

        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LogicShowCubit.get(context);
          // return new ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: cubit.task.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Card(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             Text("Name: " + cubit.task[index]["name"].toString()),
          //             Text("Age: "+ cubit.task[index]["description"].toString()),
          //           ],
          //         ),
          //       );
          //     });
          // // return ListView.builder(itemBuilder: (context, index) => cubit.buildPadding(cubit.task[index]),itemCount: cubit.task.length,shrinkWrap: true,);

          return ListView.separated(
              itemBuilder: (context, index) =>cubit.buildPadding(cubit.task[index]),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1,
              ),
              itemCount:cubit.task.length);
        },
      );
  }


}
