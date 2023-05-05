import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String affiliateName;
  final String address;
  final double rating;

  const CustomCard({super.key, required this.affiliateName, required this.address, required this.rating});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double cardWidth = size.width / 2 -
        64; // ajusta el ancho de la tarjeta al tamaño de la pantalla
    final double cardHeight = cardWidth *
        1.5; // establece la relación de aspecto de 1:1.5 para la tarjeta

    return Card(
      elevation: 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: cardHeight,
            width: cardWidth,
            decoration: BoxDecoration(
                boxShadow: const [], borderRadius: BorderRadius.circular(4)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset("assets/images/taller.jpeg"),
                ),
              ),
              const SizedBox(height: 8),
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(maxLines: 2,overflow: TextOverflow.ellipsis,
                  affiliateName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(address,maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),
              Row(
                children: [
                  const Icon(Icons.star,color: Color.fromARGB(255, 218, 202, 59)),
                  Expanded(child: Text(rating.toStringAsFixed(1))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
