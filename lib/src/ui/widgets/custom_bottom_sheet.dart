import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'bottom_sheet_view_model.dart';
import 'bottom_shett_view_state.dart';

class CustomBottomSheet extends StatelessWidget {
  final Affiliate affiliate;
  const CustomBottomSheet({super.key, required this.affiliate});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SheetViewModel(affiliate),
      child: _SheetView(affiliate: affiliate, size: size),
    );
  }
}

class _SheetView extends StatelessWidget {
  const _SheetView({
    required this.affiliate,
    required this.size,
  });

  final Affiliate affiliate;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SheetViewModel>().state;
    final viewModel = context.read<SheetViewModel>();
    return SingleChildScrollView(
      child: Column(children: [
        _affiliateImage(),
        _affiliateNameAndFavorite(state, viewModel, affiliate),
        _infoContact(size),
        _servicesAndRating(size),
      ]),
    );
  }

  Column _servicesAndRating(Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        const Text(
          "Services:",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
          child: Text(
            affiliate.services.join(", "),
            textAlign: TextAlign.justify,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
          child: Text(
            "Rating:",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            height: 5,
            width: size.width - 112,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.red)),
        RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            //TODO post new Rating
          },
        ),
      ],
    );
  }

  Column _infoContact(Size size) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(flex: 1, child: Icon(Icons.location_on_sharp)),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                      width: size.width * 0.40,
                      child: Text(
                        affiliate.address,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
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
                ? const Padding(
                    padding: EdgeInsets.only(left: 16.0),
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
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(affiliate.rating.toStringAsFixed(1))
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Row _affiliateNameAndFavorite(
      SheetViewState state, SheetViewModel viewModel, Affiliate affiliate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(affiliate.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            )),
        Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  viewModel.toogleFavorite(affiliate.id);
                },
                icon: state.isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border)))
      ],
    );
  }

  Padding _affiliateImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 160,
          width: double.infinity,
          child: Image.asset(
            "assets/images/taller.jpeg",
            fit: BoxFit.cover,
          )),
    );
  }
}
