import 'package:flutter/material.dart';

import 'dropdown.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final String userPhotoUrl;
  final void Function(String) onSubmmit;
  final void Function(String) onStatePicked;
  const CustomAppBar(
      {super.key,
      required this.userName,
      required this.userPhotoUrl,
      required this.onSubmmit,
      required this.onStatePicked});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = ThemeData();

    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: const EdgeInsets.only(top: 32.0, right: 4.0, left: 4.0),
        height: 128,
        width: size.width,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: Offset(0, 3))
        ], borderRadius: BorderRadius.circular(4), color: theme.primaryColor),
      ),
      Positioned(
        right: 8.0,
        top: 4,
        child: CircleAvatar(
          radius: 28.0,
          foregroundImage: AssetImage(userPhotoUrl),
        ),
      ),
      Positioned(
        top: 2,
        child: Padding(
            padding: const EdgeInsets.only(left: 64, right: 64, top: 16),
            child: Container(
              width: size.width * 0.60,
              height: 35,
              decoration: BoxDecoration(
                  color: theme.dialogBackgroundColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2.0,
                        spreadRadius: 3.0,
                        offset: Offset(2.0, 0.0))
                  ],
                  borderRadius: BorderRadius.circular(4.0)),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: const [
                  Icon(Icons.edit_location_alt_outlined),
                   CustomDropDown(),
                ],
              ),
            )),
      ),
      Positioned(
          left: 24.0,
          top: 56.0,
          child: Text(
            "Hola $userName",
            style: TextStyle(fontSize: 16),
          )),
      const Positioned(
          left: 24.0,
          top: 72.0,
          child: Text(
            "Bienvenido",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
      Positioned(
        bottom: 24,
        child: Padding(
          padding: const EdgeInsets.only(left: 64, right: 64),
          child: Container(
            decoration: BoxDecoration(
                color: theme.primaryColorLight,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2.0,
                      spreadRadius: 3.0,
                      offset: Offset(2.0, 0.0))
                ],
                borderRadius: BorderRadius.circular(4.0)),
            width: size.width * 0.60,
            height: 35,
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Buscar", prefixIcon: Icon(Icons.search_outlined)),
            ),
          ),
        ),
      )
    ]);
  }
}
