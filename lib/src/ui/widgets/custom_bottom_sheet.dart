import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:flutter/material.dart';

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
          child: Image.asset("assets/images/taller.jpeg"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 4, child: Text(affiliate.name)),
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
                    Expanded(flex: 1 ,child: Icon(Icons.location_on_sharp)),
                    Expanded(
                      flex: 3 ,
                      child: SizedBox(
                        width: size.width * 0.40,
                        child: Text( affiliate.address,maxLines: 3,overflow: TextOverflow.ellipsis,)
                        ),
                    ),
                    SizedBox(width: 30,),
                      Expanded(flex: 2 ,child: Icon(Icons.call)),
                      Expanded(flex: 2 ,child: Icon(Icons.message))

                  ],
                ),
                Text("Abierto las 24 horas"),
                Text(affiliate.rating.toString())
              ],
            ),
           
          ],
        )
      ]),
    );
  }
}
