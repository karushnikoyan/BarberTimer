import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:revers/domain/user.dart';
// import 'package:image_picker/image_picker.dart';


class UserProvider with ChangeNotifier{

   var regionP ;
   var citiP ;
    var phoneNumberP ;
    var nameP ;
     var surnameP ;
    var mailP ;
   var smsCodeP ;
   var passwordP ;

   File? image;
   // Future PickImage() async {
   //   try{
   //     final image = await ImagePicker().pickImage(source : ImageSource.gallery, );
   //
   //     if(image == null) return;
   //
   //    final imageTemp = File(image.path);
   //     this.image = imageTemp;
   //     notifyListeners();
   //   }on PlatformException catch (e){
   //     print('chexav pick image');
   //
   //   }
   // }

 dynamic _dayBirthday ;

  String? get dayBirthday => _dayBirthday;

  void  setdayBirthday (DateTime? dayBirthday) {
    _dayBirthday =  "${dayBirthday?.year}-${dayBirthday?.month}-${dayBirthday?.day}";

    notifyListeners();
  }

   Future create () async {
     final userCollection = FirebaseFirestore.instance.collection('user');
     final docRef = userCollection.doc();
     dispose();

     await docRef.set({
       'name':nameP,
       "surname": surnameP,
       "mail": mailP,
       "phoneNumber" : phoneNumberP,
       "city": citiP,
       "region": regionP,
       "birdDay": _dayBirthday

     });}

 bool userIsNotRegistred = false ;
  final auth = FirebaseAuth.instance;
  Future createUserWithEmailAndPhoneNumber (String email,String password) async {
    // String? id = auth.currentUser?.uid;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,

      );
      userIsNotRegistred = true;
      notifyListeners();
      print('user is created');
    }catch(e){
      // karoxa sxal printem erel

      userIsNotRegistred = false;
      notifyListeners();
      print('user is not registred');

    };
    notifyListeners();

  }

   Future  signInWithEmailAndPhoneNumber (String email,String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print('user is sign in ');
      return true;

      print('oll right');
    }catch(e){
      print('sxal login password');
      print(e);

    }
    notifyListeners();

   }




}