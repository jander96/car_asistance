
import 'package:car_assistance/src/ui/screens/map/map_view_model.dart';
import 'package:car_assistance/src/ui/screens/map/map_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapViewModel(),
      child: const _MapView(),
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapViewModel>().state;
    final viewModel = context.read<MapViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: Stack(
        children: [map(state)],
      ),
    );
  }

  FlutterMap map(MapViewState state) {
    final tileLayer = TileLayer(
      userAgentPackageName: "com.technicalassistance.car_assistance",
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    );
    var markerClusterLayerOptions = MarkerClusterLayerOptions(
      maxClusterRadius: 45,
      size: const Size(40, 40),
      anchor: AnchorPos.align(AnchorAlign.center),
      fitBoundsOptions: const FitBoundsOptions(
        padding: EdgeInsets.all(50),
        maxZoom: 15,
      ),
      markers: state.markers,onClusterTap:(p0) => debugPrint("Este es un mensaje de depuración"),
      onMarkerTap: (p0) => debugPrint("Este es un mensaje de depuración"),
      builder: (context, markers) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.red),
          child: Center(
            child: Text(
              markers.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );

    // este me permite agrupar varios markers, aumenta la  eficiencia y belleza de los mismos
    var markerClusterLayerWidget =
        MarkerClusterLayerWidget(options: markerClusterLayerOptions);

    return FlutterMap(
      options: MapOptions(
        center: LatLng(20.1182, -75.1217),
        zoom: state.zoom,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: ' OpenStreetMap contributors',
          onSourceTapped: () {},
        )
      ],
      children: [
        
        tileLayer,
      markerClusterLayerWidget
        
        
      ],
    );
  }
}
