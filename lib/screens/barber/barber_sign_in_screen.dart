import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revers/consts/barber_consts.dart';
import 'package:revers/screens/barber/barber_registration_screen.dart';
import 'package:revers/screens/user/user_sms_page.dart';
import '../../providers/barber_provider.dart';
import '../../widgets/my_text_filed.dart';

class BarberSignInScreen extends StatelessWidget {
  const BarberSignInScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BarberProvider>(builder: (context,provider,_){
      TextEditingController name = TextEditingController();
      TextEditingController surname = TextEditingController();
      TextEditingController phoneNumber = TextEditingController();
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
                MyTextFiled(text: 'Name',textEditingController: name,textInputType: TextInputType.text),
                MyTextFiled(text: 'Surname',textEditingController: surname,textInputType: TextInputType.text),
                MyTextFiled(text: 'Phone Number',textEditingController: phoneNumber,textInputType: TextInputType.phone),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            //ToDo
                           MaterialPageRoute(builder: (context) => BarberRegistrationScreen() ),
                          );
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
                          child: Column(
                            children: [
                              Icon(Icons.manage_accounts,size: 60,
                                color: Colors.white70
                                ,),
                              Text('Registration',style: myTextStyleSmallSize,)
                              
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6,right: 6),
                        child: Container (height: 120,width: 6,color: Colors.black54,),
                      ),

                      GestureDetector(
                        onTap: (){
                          provider.nameP = name ;
                          provider.surnameP = surname;
                          provider.phoneNumberP= phoneNumber;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SmsScreen() ),
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
