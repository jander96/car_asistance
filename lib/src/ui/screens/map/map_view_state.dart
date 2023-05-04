import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../domain/model/affiliate_model.dart';

class MapViewState extends Equatable {
  final List<Marker> markers;
  final Affiliate? affiliateSelected;
  final bool isLoading;
  final double zoom;

  const MapViewState(
      {this.markers = const <Marker>[],
      this.affiliateSelected,
      this.isLoading = true,
      this.zoom = 9.0});

  MapViewState copyWith(
          {List<Marker>? markers, Affiliate? affiliateSelected, bool? isLoading, double? zoom}) =>
      MapViewState(
          markers: markers ?? this.markers,
          affiliateSelected: affiliateSelected ?? this.affiliateSelected,
          isLoading: isLoading ?? this.isLoading,
          zoom: zoom ?? this.zoom);

  @override
  List<Object?> get props => [markers, isLoading, zoom,affiliateSelected];
}
