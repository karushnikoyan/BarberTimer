import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/ithem_provider.dart';
import '../../widgets/drower.dart';
import '../../widgets/visit_ithem.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer <ItemProvider>(builder : (context, provider, _)
    {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          toolbarHeight: 50,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          centerTitle: true,
          title: const Text('Barber Timer'),
        ),
        drawer: const   MyDrower(),
        body: Container(
          // foregroundDecoration: De,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/one6.jpg'), fit: BoxFit.cover),
          ),

          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  VisitItem(salonName: "Gyumri Barbershop",
                    location: "Sayat Nova",
                    rating: 3.5,),
                  VisitItem(salonName: "Gyumri Barbershop",
                    location: "Sayat Nova",
                    rating: 3.5,),
                  VisitItem(salonName: "Gyumri Barbershop",
                    location: "Sayat Nova",
                    rating: 3.5,),
                  VisitItem(salonName: "Gyumri Barbershop",
                    location: "Sayat Nova",
                    rating: 3.5,),
                  VisitItem(salonName: "Gyumri Barbershop",
                    location: "Sayat Nova",
                    rating: 3.5,),
                  VisitItem(salonName: "Gyumri Barbershop",
                    location: "Sayat Nova",
                    rating: 3.5,),

                ],
              ),
            ),
          ),
        ),
      );

  }

    );
  }
}
