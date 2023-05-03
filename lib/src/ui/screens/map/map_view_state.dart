import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';

class MapViewState extends Equatable{
  final List<Marker> markers ;
  final bool isLoading;
  final double zoom;

  const MapViewState({
    this.markers = const <Marker>[],
    this.isLoading = true,
    this.zoom = 9.0 });

  MapViewState copyWith(
          {List<Marker>? markers, bool? isLoading, double? zoom}) =>
      MapViewState(
        markers: markers ?? this.markers,
        isLoading: isLoading ?? this.isLoading,
        zoom: zoom ?? this.zoom
        );
        
          @override
          List<Object?> get props => [markers,isLoading,zoom];
}
