import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/affiliate_model.dart';
import 'bottom_sheet_view_model.dart';
import 'custom_bottom_sheet.dart';

class CustomCard extends StatelessWidget {
  final Affiliate affiliate;

  CustomCard({super.key, required this.affiliate});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
        create: (context) => SheetViewModel(affiliate),
        child: _CardView(
            colors: colors, affiliate: affiliate, textStyles: textStyles));
  }
}

class _CardView extends StatelessWidget {
  const _CardView({
    required this.colors,
    required this.affiliate,
    required this.textStyles,
  });

  final ColorScheme colors;
  final Affiliate affiliate;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SheetViewModel>().state;
    final viewModel = context.read<SheetViewModel>();
    return GestureDetector(
      onTap: () => _openBottomSheet(context, affiliate).then((_) {
        viewModel.isFavorite(affiliate.id);
      }),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 5, offset: Offset(0, 2))],
            borderRadius: BorderRadius.circular(4),
            color: colors.onPrimary),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Imagen
              SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: FadeInImage(

                    placeholderFit: BoxFit.contain,
              image: NetworkImage(affiliate.imageUrl),
              fit: BoxFit.cover,
              width: 56,
              height: 80,
              placeholder:
                  const AssetImage('assets/images/loading_gif.gif'),
              imageErrorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/images/loading_gif.gif'),
            ),
                ),
              ),

              const SizedBox(height: 5),

              //* Title
              SizedBox(
                width: 150,
                child: Text(
                  affiliate.name,
                  maxLines: 2,
                  style: textStyles.bodyLarge,
                ),
              ),
              const Spacer(),

              //* Address

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SizedBox(
                    height: 48,
                    child: Text(
                      affiliate.address,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bodySmall,
                    )),
              ),
              const Spacer(),

              //* Rating
              SizedBox(
                width: 150,
                child: Row(
                  children: [
                    Icon(Icons.star_half_outlined,
                        color: Colors.yellow.shade800),
                    const SizedBox(width: 3),
                    Text(affiliate.rating.toStringAsFixed(1),
                        style: textStyles.bodyMedium
                            ?.copyWith(color: Colors.yellow.shade800)),
                    const Spacer(),
                    if (state.isFavorite)
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    if (!state.isFavorite) const Icon(Icons.favorite_border)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openBottomSheet(BuildContext context, Affiliate affiliate) {
    return showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (context) => CustomBottomSheet(
              affiliate: affiliate,
            ));
  }
}
