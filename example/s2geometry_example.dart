import 'package:s2geometry/s2geometry.dart';

main() {
  S2LatLng latLng = new S2LatLng.fromDegrees(-12.412412, 130.936307);
  S2CellId cellId = new S2CellId.fromLatLng(latLng);
  print(cellId.toToken());
}
