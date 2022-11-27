import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revers/providers/user_provider.dart';
import 'package:revers/screens/user/user_sign_in_screen.dart';
import 'package:revers/screens/user/user_registation_second_screen.dart';

import '../../consts/barber_consts.dart';
import '../../widgets/my_text_filed.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
      TextEditingController name = TextEditingController();
      TextEditingController surname = TextEditingController();
      TextEditingController mail = TextEditingController();
      TextEditingController password = TextEditingController();



      // Future create () async {
      //   final userCollection = FirebaseFirestore.instance.collection('user');
      //   final docRef = userCollection.doc();
      //   // dispose();
      //
      //     await docRef.set({
      //       'name':name.text,
      //       "surname": surname.text,
      //       "mail": mail.text,
      //     });}

    return Consumer<UserProvider>(builder: (context,provider,_){
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
                MyTextFiled(text: 'Mail',textEditingController: mail,textInputType: TextInputType.text),
                MyTextFiled(text: 'Password',textEditingController: password,textInputType: TextInputType.none),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){

                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen() ),
                        );},
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
                          child: Icon(Icons.account_circle,size: 60,
                            color: Colors.white70

                            ,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6,right: 6),
                        child: Container (height: 120,width: 6,color: Colors.black54,),
                      ),

                      GestureDetector(
                        onTap: () async {
                          provider.nameP = name.text;
                          provider.surnameP = surname.text;
                          provider.mailP = mail.text;
                          provider.passwordP = password.text;
                          print(name);
                          print('--------------------');

                         // create();


                          if (name.selection.isValid == false &&
                              surname.selection.isValid == false &&
                              mail.selection.isValid == false &&
                              password.selection.isValid == false){

                            print('is not null');
                            return showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                              title: const Text('Mistake'),
                              content: const Text('Please fill in all fields'),
                              actions: [FloatingActionButton(
                                onPressed: ()=> Navigator.pop(context ,'cancel'),
                                child : Text('ok'),
                                backgroundColor: mColor,
                              )],
                            ),
                            );
                          }else {

                           await provider.createUserWithEmailAndPhoneNumber(
                                mail.text, password.text);
                           if(provider.userIsNotRegistred == true) {
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (
                                   context) => const UserRegistrationSecondScreen()),
                             );
                           }else{
                             return showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                               title: const Text('Mistake'),
                               content: const Text('User is not created please try again and fill correct'),
                               actions: [FloatingActionButton(
                                 onPressed: ()=> Navigator.pop(context ,'cancel'),
                                 child : Text('ok'),
                                 backgroundColor: mColor,
                               )],
                             ),
                             );
                           }

                          }
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
