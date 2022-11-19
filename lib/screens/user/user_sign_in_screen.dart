import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revers/consts/barber_consts.dart';
import 'package:revers/providers/user_provider.dart';
import 'package:revers/screens/user/user_main_screen.dart';
import 'package:revers/screens/user/user_regisrtation_screen.dart';
import '../../widgets/my_text_filed.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context,provider,_){
      // TextEditingController name = TextEditingController();
      // TextEditingController phoneNumber = TextEditingController();
      TextEditingController email = TextEditingController();
      TextEditingController password = TextEditingController();
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
                MyTextFiled(text: 'Email',textEditingController: email,textInputType: TextInputType.text),
                MyTextFiled(text: 'Password',textEditingController: password,textInputType: TextInputType.text),
                // MyTextFiled(text: 'password',textEditingController: password,),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const UserRegistrationScreen() ),
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
                          child: Icon(Icons.manage_accounts,size: 60,
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
                          // provider.nameP = name ;
                          provider.passwordP = password.text;
                          provider.mailP = email.text;
                         provider.signInWithEmailAndPhoneNumber(email.text, password.text).then((value){
                           if(value == true){
                             print(value);

                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const MainScreen() ),
                             );

                           }else {
                             print(value);
                             print ('sxalmunq login kam passwordi mej');
                             /// Alert Dialog
                             showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                               title: const Text('Wrong login or password'),
                               content: const Text('Please reed correct login and password'),
                               actions: [FloatingActionButton(
                                   onPressed: ()=> Navigator.pop(context ,'cancel'),
                                       child : Text('ok'),
                                 backgroundColor: mColor,
                               )],
                             )
                             );



                           }
                         });
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
