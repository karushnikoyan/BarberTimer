import 'dart:io';

import 'package:flutter/cupertino.dart';

class BarberProvider with ChangeNotifier{
// Text sss = 'sss' as Text;


  var regionP ;
  var citiP ;
  var phoneNumberP ;
  var nameP ;
  var surnameP ;
  var mailP ;
  var smsCodeP ;
  var addressP ;
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




  String? _dayBirthday ;

  String? get dayBirthday => _dayBirthday;

  void  setdayBirthday (DateTime? dayBirthday) {
    _dayBirthday =  "${dayBirthday?.year}-${dayBirthday?.month}-${dayBirthday?.day}";
    notifyListeners();
  }
// String textDayBirthday = 'Day Birthday';
//   notifyListeners();



}