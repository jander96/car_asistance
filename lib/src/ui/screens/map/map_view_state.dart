import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/model/affiliate_model.dart';

class MapViewState extends Equatable {
  final List<Affiliate> listOfAffiliate;
  final Affiliate? affiliateSelected;
  final bool isLoading;
  final bool isSearching;
  final double zoom;
  final LatLng? currentPosition;
  final Exception? error;

  const MapViewState(
      {this.listOfAffiliate = const <Affiliate>[],
      this.affiliateSelected,
      this.isLoading = true,
      this.isSearching = true,
      this.zoom = 9.0,
      this.currentPosition,
      this.error});

  MapViewState copyWith(
          {List<Affiliate>? listOfAffiliate,
          Affiliate? affiliateSelected,
          bool? isLoading,
          bool? isSearching,
          double? zoom,
          LatLng? currentPosition,
          Exception? error}) =>
      MapViewState(
          listOfAffiliate: listOfAffiliate ?? this.listOfAffiliate,
          affiliateSelected: affiliateSelected ?? this.affiliateSelected,
          isLoading: isLoading ?? this.isLoading,
          isSearching: isSearching ?? this.isSearching,
          zoom: zoom ?? this.zoom,
          currentPosition: currentPosition ?? this.currentPosition,
          error: error ?? this.error);

  @override
  List<Object?> get props => [
        listOfAffiliate,
        isLoading,
        zoom,
        affiliateSelected,
        currentPosition,
        error,
        isSearching
      ];
}
