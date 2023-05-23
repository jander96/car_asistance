import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dropdown.dart';

class CustomAppBar extends StatelessWidget {
  final String? userName;
  final String? userPhotoUrl;
  final void Function(String) onSubmmit;
  final void Function(String) onStatePicked;
  final void Function() onCrowTap;
  final void Function() onAvatarTap;

  const CustomAppBar(
      {super.key,
      required this.userName,
      required this.userPhotoUrl,
      required this.onSubmmit,
      required this.onStatePicked,
      required this.onCrowTap,
      required this.onAvatarTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Stack(alignment: Alignment.center, children: [
      _Back(size: size, colors: colors),
      _Avatar(userPhotoUrl: userPhotoUrl,onAvatarTap: onAvatarTap),
      _StateSelector(size: size, colors: colors),
      _Gettings(userName: userName, textStyles: textStyles),
      _SearchBar(colors: colors, size: size),
      _Crown(onCrowTap: onCrowTap),
    ]);
  }
}

class _Crown extends StatelessWidget {
  const _Crown({
    required this.onCrowTap,
  });

  final void Function() onCrowTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      child: GestureDetector(
        onTap: () => onCrowTap,
        child: Lottie.asset(height: 56, 'assets/jsons/ic_crown.json'),
      ),
    );
  }
}

class _Back extends StatelessWidget {
  const _Back({
    super.key,
    required this.size,
    required this.colors,
  });

  final Size size;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32.0, right: 4.0, left: 4.0),
      height: 120,
      width: size.width,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: Offset(0, 3))
      ], borderRadius: BorderRadius.circular(4), color: colors.primary),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.colors,
    required this.size,
  });

  final ColorScheme colors;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      child: Padding(
        padding: const EdgeInsets.only(left: 64, right: 64),
        child: Container(
          decoration: BoxDecoration(
              color: colors.secondaryContainer,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2.0,
                    spreadRadius: 3.0,
                    offset: Offset(2.0, 0.0))
              ],
              borderRadius: BorderRadius.circular(4.0)),
          width: size.width * 0.60,
          height: 36,
          child: const TextField(
            decoration: InputDecoration(
                hintText: "Search", prefixIcon: Icon(Icons.search_outlined)),
          ),
        ),
      ),
    );
  }
}

class _Gettings extends StatelessWidget {
  const _Gettings({
    required this.userName,
    required this.textStyles,
  });

  final String? userName;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 24.0,
        top: 56.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${userName ?? 'User'}",
              style: textStyles.bodySmall,
            ),
            Text(
              "Wellcome",
              style: textStyles.headlineSmall,
            )
          ],
        ));
  }
}

class _StateSelector extends StatelessWidget {
  const _StateSelector({
    super.key,
    required this.size,
    required this.colors,
  });

  final Size size;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2,
      child: Padding(
          padding: const EdgeInsets.only(left: 64, right: 64, top: 16),
          child: Container(
            width: size.width * 0.60,
            height: 36,
            decoration: BoxDecoration(
                color: colors.onPrimary,
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
              children: [
                Icon(Icons.edit_location_alt_outlined),
                CustomDropDown(),
              ],
            ),
          )),
    );
  }
}

class _Avatar extends StatelessWidget {

  final String? userPhotoUrl;
  final void Function() onAvatarTap;
  const _Avatar(
      {required this.userPhotoUrl, required this.onAvatarTap, });

  

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8.0,
      top: 4,
      child: GestureDetector(
        onTap: () => onAvatarTap,
        child: CircleAvatar(
          radius: 28.0,
          foregroundImage: NetworkImage(
            userPhotoUrl ?? "https://th.bing.com/th/id/R.70539295fbd82cf866d02ccacaee6cba?rik=K%2f40F0IUYGEEHA&pid=ImgRaw&r=0"),
        ),
      ),
    );
  }
}
