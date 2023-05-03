import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late List<Marker> markers;

  @override
  void initState() {
    markers = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(53.3498, -6.2603),
        builder: (ctx) => const Icon(
            size: 34.0,
            Icons.pin_drop), // Aqui es donde se modifica el tamaño del marker
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: Stack(
        children: [map()],
      ),
    );
  }

  FlutterMap map() {
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
            markers: markers,
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
    var markerClusterLayerWidget = MarkerClusterLayerWidget(options: markerClusterLayerOptions);

    return FlutterMap(
      options: MapOptions(
        center: LatLng(53.3498, -6.2603),
        zoom: 9.2,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: ' OpenStreetMap contributors',
          onSourceTapped: () {},
        )
      ],
      children: [
        tileLayer,
        markerClusterLayerWidget,
      ],
    );
  }
}
