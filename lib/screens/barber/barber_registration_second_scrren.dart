import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:revers/consts/barber_consts.dart';
import 'package:revers/widgets/my_bubtton_container.dart';

import '../../providers/barber_provider.dart';
import '../../widgets/my_text_filed.dart';
import '../user/user_main_screen.dart';




class BarberRegistrationSecondScreen extends StatelessWidget {
  const BarberRegistrationSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController region = TextEditingController();
    TextEditingController citi = TextEditingController();
    TextEditingController address = TextEditingController();


    return Consumer<BarberProvider>(builder: (context, provider, _) {
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
                  text: 'Address',
                  textEditingController: address,
                    textInputType: TextInputType.text
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
                      style: TextStyle(color : Colors.blue),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        // onTap: (){
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => const LoginUserScreen() ),
                        //   );
                        // },
                        child: Container(
                          height: 80,
                          width: 140,
                          decoration: const BoxDecoration(
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
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: Container(
                          height: 120,
                          width: 6,
                          color: Colors.black54,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.regionP = region.text;
                          provider.citiP = citi.text;
                          provider.addressP = address;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
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
