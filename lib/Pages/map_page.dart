import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../Model/termin.dart';

class MapPage extends StatelessWidget {
  final List<Termin> termini;

  MapPage({required this.termini});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Locations'),
      ),
      body: SfMaps(
        layers: <MapLayer>[
          MapShapeLayer(
            source: MapShapeSource.asset(
              'assets/australia.json',
              shapeDataField: 'STATE_NAME',
              dataCount: termini.length,
              primaryValueMapper: (int index) => termini[index].predmet,
            ),
            initialMarkersCount: termini.length,
            markerBuilder: (BuildContext context, int index) {
              return MapMarker(
                latitude: termini[index].latitude,
                longitude: termini[index].longitude,
                iconColor: Colors.blue,
              );
            },
          ),
        ],
      ),
    );
  }
}