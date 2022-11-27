import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../consts/barber_consts.dart';

class VisitItem extends StatelessWidget {
  String salonName;
  String location;
  double rating;

  VisitItem(
      {Key? key,
      required this.salonName,
      required this.location,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 300,
        // color: Colors.blue,
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.white,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4,right: 4),
                  child: AutoSizeText(
                    // '${salonName}',
                    'gyumri barbershop',
                    style: myTextStyle,

                    maxLines: 4,
                  ),
                ),
                Row(
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_on_sharp,
                          color: Colors.white70,
                        )),
                    Text(
                      '${location}',
                      style: TextStyle(fontSize: 24, color: Colors.white70),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('${rating}'),
                    RatingBar.builder(
                      itemSize: 20,
                      unratedColor: Colors.white54 ,
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
