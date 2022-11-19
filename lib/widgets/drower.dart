import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/barber_consts.dart';
import '../providers/user_provider.dart';

class MyDrower extends StatelessWidget {
  const MyDrower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context,provider,_){

    return Drawer(
      backgroundColor: Colors.white10,
      child: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add_circle,size: 100,),
            ),
          ),
          Row(children: [],),
          Text('${provider.nameP}' ,style: myTextStyle,),
          Text('${provider.surnameP}' ,style: myTextStyle,),
          Text('${provider.phoneNumberP}' ,style:myTextStyle,),
          Text('${provider.dayBirthday}' ,style: myTextStyle,),


        ],
      ),
    );
    },);
  }
}
