import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomBottomSheet extends StatelessWidget {
  final Affiliate affiliate;
  const CustomBottomSheet({super.key, required this.affiliate});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(height: 160,width: double.infinity,child: Image.asset("assets/images/taller.jpeg",fit:BoxFit.cover ,)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(affiliate.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                )),
            const Expanded(flex: 1, child: Icon(Icons.favorite_border))
          ],
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.location_on_sharp)),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                          width: size.width * 0.40,
                          child: Text(
                            affiliate.address,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        flex: 2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/ic_phone_green.png"),
                        )),
                    Expanded(
                        flex: 2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/ic_whatsapp.png"),
                        ))
                  ],
                ),
                affiliate.isFullTimeService
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Open 24 h",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "${affiliate.openTime} - ${affiliate.closeTime}",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                        child: Row(
                          children: [
                            Text(affiliate.rating.toStringAsFixed(1)),
                                      RatingBar.builder(
                                        initialRating: affiliate.rating,
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
                        ),
                      )
              ],
            ),
           
          ],
        ),
         Padding(
              padding: EdgeInsets.only(left: size.width -120, top: 8 ),
              child: Text("more details..."),
            )

        
      ]),
    );
  }
}
