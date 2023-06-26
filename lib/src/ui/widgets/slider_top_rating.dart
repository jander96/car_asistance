import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../domain/model/affiliate_model.dart';
import '../../utils/bottom_shower.dart';


class SliderAffiliates extends StatelessWidget {
  final List<Affiliate> affiliate;

  const SliderAffiliates({super.key, required this.affiliate});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 136,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: affiliate.length,
        itemBuilder: (context, index) => _Slide(affiliate: affiliate[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Affiliate affiliate;

  const _Slide({required this.affiliate});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    final decoration =
        BoxDecoration(borderRadius: BorderRadius.circular(4), boxShadow: const [
      BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
    ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
               
                children: [
                  FadeInImage(

                    placeholderFit: BoxFit.contain,
              image: NetworkImage(affiliate.imageUrl),
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder:
                  const AssetImage('assets/images/loading_gif.gif'),
              imageErrorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/images/taller.jpeg'),
            ),
                  _ActionWidget(colors: colors, textStyles: textStyles,affiliate: affiliate,),
                  Text(affiliate.name,style: textStyles.titleMedium!.copyWith(color: colors.onPrimary),)
                ],
              ))),
    );
  }
}

class _ActionWidget extends StatelessWidget {
  const _ActionWidget({
    required this.colors,
    required this.textStyles, required this.affiliate,
  });

  final ColorScheme colors;
  final TextTheme textStyles;
  final Affiliate affiliate;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      left: 32,
      child: Container( 
        height: 36,
        width: 220,
        decoration: BoxDecoration(
          color: colors.primary,
            borderRadius: BorderRadius.circular(4),
            ),
            child: GestureDetector(
              onTap: ()=> openBottomSheet(context,affiliate),
              child: Row(children: [
                Expanded(
                  child: Column(
                    children: [
                      Flexible(child: Text('Start Your Maintenance',style: textStyles.bodyMedium!.copyWith(fontWeight: FontWeight.bold))),
                      Flexible(child: Text('All kind of Arrangements', style: textStyles.bodySmall,)),
                
                      ],),
                ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colors.secondary
                        ),
                        child: const Icon(Icons.arrow_forward)
                        ),
                    )
              ]),
            ),
      ),
    );
    
  }

}
