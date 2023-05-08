import 'package:car_assistance/src/ui/screens/map/map_view_model.dart';
import 'package:car_assistance/src/ui/screens/map/map_view_state.dart';
import 'package:car_assistance/src/ui/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/map_style.dart';

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
      appBar: AppBar(title: const Text("Map")),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
                target: const LatLng(20.2965, -75.2111), zoom: state.zoom),
            markers: state.listOfAffiliate
                .map((affiliate) => Marker(
                      infoWindow: InfoWindow(title: affiliate.name),
                      markerId: MarkerId(affiliate.id),
                      position: LatLng(affiliate.lat, affiliate.long),
                      onTap: () => _openBottomSheet(
                          context, state, affiliate.id, viewModel),
                    ))
                .toSet(),
            onMapCreated: (controller) {
              controller.setMapStyle(mapStyle);
            },
          ),
          if (state.isSearching)
            Positioned(
              top: 7,
              right: 8,
              child: ElevatedButton.icon(

                onPressed: () async {},
                icon: Icon(Icons.location_searching),
                label: Text(state.isSearching ? "searching" : ""),
              ),
            ),
        ],
      ),
    );
  }

  _openBottomSheet(BuildContext context, MapViewState state, String id,
      MapViewModel viewModel) {
    viewModel.getAffiliateById(id).then((affiliate) => showModalBottomSheet(
        context: context,
        builder: (context) => CustomBottomSheet(
              affiliate: affiliate,
            )));
  }
}
