/*
 * Created by Alfonso Cejudo, Wednesday, July 24th 2019.
 */

import 'package:fluster_redd/fluster.dart';

void main() {
  const currentZoom = 10;

  var markers = <MapMarker>[
    MapMarker(
        locationName: 'One',
        markerId: '9000001',
        latitude: 40.736291,
        longitude: -73.990243),
    MapMarker(
        locationName: 'Two',
        markerId: '9000002',
        latitude: 40.731349,
        longitude: -73.997723),
    MapMarker(
        locationName: 'Three',
        markerId: '9000003',
        latitude: 40.670274,
        longitude: -73.964054),
    MapMarker(
        locationName: 'Four',
        markerId: '9000004',
        latitude: 38.889974,
        longitude: -77.019908),
  ];

  var fluster = Fluster<MapMarker>(
      minZoom: 0,
      maxZoom: 21,
      radius: 150,
      extent: 2048,
      nodeSize: 64,
      points: markers,
      createCluster: (BaseCluster cluster, double longitude, double latitude) =>
          MapMarker(
              locationName: null,
              latitude: latitude,
              longitude: longitude,
              isCluster: true,
              clusterId: cluster.id,
              pointsSize: cluster.pointsSize,
              markerId: cluster.id.toString(),
              childMarkerId: cluster.childMarkerId));

  var clusters = fluster.clusters([-180, -85, 180, 85], currentZoom);

  print('Number of clusters at zoom $currentZoom: ${clusters.length}');
}

class MapMarker extends Clusterable {
  String? locationName;
  String? thumbnailSrc;
  void Function()? onMarkerTap;
  dynamic infoWindow;

  MapMarker(
      {this.locationName,
      latitude,
      longitude,
      this.thumbnailSrc,
      isCluster = false,
      clusterId,
      pointsSize,
      markerId,
      infoWindow,
      childMarkerId})
      : super(
            latitude: latitude,
            longitude: longitude,
            isCluster: isCluster,
            clusterId: clusterId,
            pointsSize: pointsSize,
            markerId: markerId,
            childMarkerId: childMarkerId,
            infoWindows: infoWindow);
}
