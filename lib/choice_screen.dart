import 'package:flutter/material.dart';

import 'screens/barber/barber_sign_in_screen.dart';
import 'screens/user/user_sign_in_screen.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // foregroundDecoration: De,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/one1.jpg'), fit: BoxFit.cover),
          ),
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen() ),
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
                      child: Icon(Icons.account_circle,size: 60,

                        color: Colors.white70






                        ,),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 6,right: 6),
                    child: Container (height: 120,width: 6,color: Colors.black54,),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BarberSignInScreen() ),
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
                      child: Icon(Icons.home_repair_service,size : 60,
                      color: Colors.white70,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
