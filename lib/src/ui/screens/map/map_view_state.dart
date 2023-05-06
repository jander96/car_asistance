import 'package:equatable/equatable.dart';



import '../../../domain/model/affiliate_model.dart';

class MapViewState extends Equatable {
  final List<Affiliate> listOfAffiliate;
  final Affiliate? affiliateSelected;
  final bool isLoading;
  final double zoom;

  const MapViewState(
      {this.listOfAffiliate = const <Affiliate>[],
      this.affiliateSelected,
      this.isLoading = true,
      this.zoom = 9.0});

  MapViewState copyWith(
          {List<Affiliate>? listOfAffiliate, Affiliate? affiliateSelected, bool? isLoading, double? zoom}) =>
      MapViewState(
          listOfAffiliate: listOfAffiliate ?? this.listOfAffiliate,
          affiliateSelected: affiliateSelected ?? this.affiliateSelected,
          isLoading: isLoading ?? this.isLoading,
          zoom: zoom ?? this.zoom);

  @override
  List<Object?> get props => [listOfAffiliate, isLoading, zoom,affiliateSelected];
}
