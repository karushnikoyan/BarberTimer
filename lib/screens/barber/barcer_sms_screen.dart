import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revers/screens/user/user_main_screen.dart';

import '../../providers/barber_provider.dart';
import '../../widgets/my_text_filed.dart';

class BarberSmsScreen extends StatelessWidget {
  const BarberSmsScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BarberProvider>(builder :(context,provider,_){
      TextEditingController smsCode = TextEditingController();

      return Scaffold(

        body: Container(
          // height: MediaQuery.of(context).size.height,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/one1.jpg'), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.center  ,
              children: [
                SizedBox(height: 100,),
                MyTextFiled(text: 'put your sms code',textEditingController: smsCode ,textInputType: TextInputType.phone),
                // MyTextFiled(text: 'surname',),
                // MyTextFiled(text: 'phone number',),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){
                          ///to do
                          /// hear we will put button send sms again
                          // Navigator.pop(context);
                        },
                        child: Container(
                          height: 80,
                          width: 140,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:  BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                            ),
                          ),
                          child: Icon(Icons.refresh,size: 60,
                            color: Colors.white70

                            ,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6,right: 6),
                        child: Container (height: 120,width: 6,color: Colors.black54,),
                      ),

                      GestureDetector(
                        onTap: (){
                          //Todo
                          ///hear we will compare values and if it true it will go to next screen
                          provider.smsCodeP = smsCode;


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainScreen() ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 140,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:  BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Icon(Icons.navigate_next,size : 60,
                            color: Colors.white70,),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });

  }
}
