import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revers/providers/barber_provider.dart';
import 'package:revers/providers/ithem_provider.dart';
import 'package:revers/providers/user_provider.dart';
import 'package:revers/choice_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ItemProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) =>  BarberProvider()),
    ],
    // child: MyApp()
          child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return Consumer<ItemProvider>(
    //     (builder : (context,provider,_){
    //
    //
    // }
    // );
    return const MaterialApp(
      home: ChoiceScreen(),
    );
  }
}
