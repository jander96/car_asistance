import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../domain/model/affiliate_model.dart';
import '../../utils/bottom_shower.dart';
import '../delegates/search_appbar_delegate.dart';
import 'custom_bottom_sheet.dart';
import 'dropdown.dart';

class CustomAppBar extends StatelessWidget {
  final List<Affiliate> affiliates;
  final String? userName;
  final String? userPhotoUrl;
  final void Function(String) onSubmmit;
  final void Function(String?) onStatePicked;
  final void Function() onCrowTap;
  final void Function() onAvatarTap;

  const CustomAppBar(
      {super.key,
      required this.userName,
      required this.userPhotoUrl,
      required this.affiliates,
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
      _Avatar(userPhotoUrl: userPhotoUrl, onAvatarTap: onAvatarTap),
      _StateSelector(size: size, colors: colors, onStatePicked: onStatePicked),
      _Gettings(userName: userName, textStyles: textStyles),
      _SearchBar(colors: colors, size: size, affiliates: affiliates),
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
        onTap: onCrowTap,
        child: Lottie.asset(height: 56, 'assets/jsons/ic_crown.json'),
      ),
    );
  }
}

class _Back extends StatelessWidget {
  const _Back({
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
    required this.affiliates,
  });

  final ColorScheme colors;
  final Size size;
  final List<Affiliate> affiliates;

  @override
  Widget build(BuildContext context) {
    const boxShadow = [
      BoxShadow(
          color: Colors.black26, blurRadius: 2.0, offset: Offset(0.0, 2.0))
    ];
    var boxDecoration = BoxDecoration(
        color: colors.secondaryContainer,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(4.0));

    return Positioned(
      bottom: 8,
      child: GestureDetector(
        onTap: () {
          showSearch(
              context: context,
              delegate: SearchAffiliateDelegate(
                affiliates: affiliates,
              )).then((affiliate) {
            if (affiliate != null) openBottomSheet(context, affiliate);
          });
        },
        child: Container(
          decoration: boxDecoration,
          width: size.width * 0.60,
          height: 32,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 8,
                ),
                Text('Search'),
              ],
            ),
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
              style: textStyles.bodyMedium,
            ),
            Text(
              "Wellcome",
              style: textStyles.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

class _StateSelector extends StatelessWidget {
  const _StateSelector({
    required this.size,
    required this.colors,
    required this.onStatePicked,
  });

  final Size size;
  final ColorScheme colors;
  final void Function(String?) onStatePicked;

  @override
  Widget build(BuildContext context) {
    const boxShadow = BoxShadow(
        color: Colors.black26, blurRadius: 2.0, offset: Offset(0.0, 2.0));

    var boxDecoration = BoxDecoration(
        color: colors.onPrimary,
        boxShadow: const [boxShadow],
        borderRadius: BorderRadius.circular(4.0));
    return Positioned(
      top: 16,
      child: Container(
        height: 32,
        width: size.width * 0.6,
        decoration: boxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.edit_location_alt_outlined),
            CustomDropDown(
                onTap: (value) => onStatePicked(value), colors: colors),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? userPhotoUrl;
  final void Function() onAvatarTap;
  const _Avatar({
    required this.userPhotoUrl,
    required this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8.0,
      top: 4,
      child: GestureDetector(
        onTap: onAvatarTap,
        child: ClipOval(
          child: SizedBox(
            width: 56,
            child: FadeInImage(
              image: NetworkImage(userPhotoUrl ??
                  "https://th.bing.com/th/id/R.70539295fbd82cf866d02ccacaee6cba?rik=K%2f40F0IUYGEEHA&pid=ImgRaw&r=0"),
              fit: BoxFit.cover,
              width: 56,
              height: 56,
              placeholder:
                  const AssetImage('assets/images/profile_placeholder.png'),
              imageErrorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/images/profile_placeholder.png'),
            ),
          ),
        ),
      ),
    );
  }
}
