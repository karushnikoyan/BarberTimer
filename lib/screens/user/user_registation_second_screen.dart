import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:revers/consts/barber_consts.dart';
import 'package:revers/providers/user_provider.dart';
import 'package:revers/widgets/my_bubtton_container.dart';

import '../../widgets/my_text_filed.dart';
import 'user_main_screen.dart';




class UserRegistrationSecondScreen extends StatelessWidget {
  const UserRegistrationSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController region = TextEditingController();
    TextEditingController citi = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();



    return Consumer<UserProvider>(builder: (context, provider, _) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: (){
                    // provider.PickImage();

                  },
                  child: CircleAvatar(radius: 50,backgroundColor: Colors.black12,
                    child: Icon(Icons.add_reaction,size: 70,color: Colors.black54,),),
                ),
                MyTextFiled(
                  text: 'Region',
                  textEditingController: region,
                    textInputType: TextInputType.text
                ),
                MyTextFiled(
                  text: 'Citi',
                  textEditingController: citi,
                    textInputType: TextInputType.text
                ),
                MyTextFiled(
                  text: 'Phone number',
                  textEditingController: phoneNumber,
                    textInputType: TextInputType.phone
                ),

                GestureDetector(
                  onTap: () {
                    {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1950, 1, 1),
                          maxTime: DateTime.now(), onChanged: (date) {
                        // print('change $date sa sa sa');
                      },onConfirm: (date) {

                        // print('confirm $date sa entrvac datan e');
                        /// TO DO  it wos selected main value
                        provider.setdayBirthday(date);

                      }, currentTime: DateTime.now(), locale: LocaleType.hy);
                    }

                    const Text(
                      'show date time picker (Chinese)',
                      style: TextStyle(color : Colors.red),
                    );
                  },
                  child: MyButtonContainer(
                    widget:  Padding(
                      padding: EdgeInsets.only(left: 20, top: 14),
                      child: Text(

                        "${provider.dayBirthday   ?? ('Day Birthday')}"
                        ,
                        style: myTextStyle,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 80,
                          width: 140,
                          decoration:  BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                            ),
                          ),
                          child: Icon(
                            Icons.account_circle,
                            size: 60,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 6, right: 6),
                        child: Container(
                          height: 120,
                          width: 6,
                          color: Colors.black54,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                            provider.regionP = region.text;
                            provider.citiP = citi.text;
                            provider.phoneNumberP= phoneNumber.text;
                            provider.create();


                            if(region.selection.isValid == false ||
                                citi.selection.isValid == false ||
                                phoneNumber.selection.isValid == false
                            ){
                              return showDialog<void>(context: context, builder: (BuildContext context) => AlertDialog(
                              title: const Text('Mistake'),
                              content: const Text('Please fill in all fields'),
                              actions: [FloatingActionButton(
                              onPressed: ()=> Navigator.pop(context ,'cancel'),
                              child : Text('ok'),
                              backgroundColor: mColor,
                              )],
                              ),
                              );


                            }else{

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
                              };

                        },
                        child: Container(
                          height: 80,
                          width: 140,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Icon(
                            Icons.navigate_next,
                            size: 60,
                            color: Colors.white70,
                          ),
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
