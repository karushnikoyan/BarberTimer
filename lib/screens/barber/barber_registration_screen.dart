import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/barber_provider.dart';
import '../../widgets/my_text_filed.dart';
import 'barber_registration_second_scrren.dart';

class BarberRegistrationScreen extends StatelessWidget {
  const BarberRegistrationScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<BarberProvider>(builder: (context,provider,_){
      TextEditingController name = TextEditingController();
      TextEditingController surname = TextEditingController();
      TextEditingController mail = TextEditingController();
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
                MyTextFiled(text: 'Name',textEditingController: name,textInputType: TextInputType.text),
                MyTextFiled(text: 'Surname',textEditingController: surname,textInputType: TextInputType.text),
                MyTextFiled(text: 'Mail',textEditingController: mail,textInputType: TextInputType.emailAddress),
                MyTextFiled(text: 'Password',textEditingController: password,textInputType: TextInputType.visiblePassword),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){

                          Navigator.pop(context);},
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
                        onTap: (){
                          provider.nameP = name.text;
                          provider.surnameP = surname.text;
                          provider.mailP = mail.text;
                          provider.passwordP = password.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BarberRegistrationSecondScreen() ),
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
