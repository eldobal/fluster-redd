/*
 * Created by Alfonso Cejudo, Sunday, July 21st 2019.
 */
import 'package:google_maps/google_maps.dart';

class BaseCluster {
  double? x;
  double? y;
  int? zoom;
  int? pointsSize;
  int? parentId;
  int? index;
  int? id;
  bool isCluster = false;

  /// For PointCluster instances that are standalone (i.e. not cluster) items.
  String? markerId;

  /// For clusters that wish to display one representation of its children.
  String? childMarkerId;

  InfoWindow? infoWindow;
}
