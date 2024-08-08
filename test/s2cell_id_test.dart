import 'package:test/test.dart';
import 'package:s2geometry/src/s2cell_id.dart';
import 'package:s2geometry/src/s2point.dart';
import 'package:s2geometry/src/s2latlng.dart';

void main() {
  group('S2CellId Tests', () {
    test('Constructor fromPoint', () {
      S2Point point = S2Point(1.0, 0.0, 0.0);
      S2CellId cellId = S2CellId.fromPoint(point);
      expect(cellId.id, isNotNull);
    });

    test('Constructor fromFace', () {
      S2CellId cellId = S2CellId.fromFace(0);
      expect(cellId.id, isNotNull);
    });

    test('Constructor fromLatLng', () {
      S2LatLng latLng = S2LatLng.fromDegrees(37.7749, -122.4194);
      S2CellId cellId = S2CellId.fromLatLng(latLng);
      expect(cellId.id, isNotNull);
    });

    test('Constructor fromFaceIJ', () {
      S2CellId cellId = S2CellId.fromFaceIJ(0, 0, 0);
      expect(cellId.id, isNotNull);
    });

    test('toToken', () {
      S2CellId cellId = S2CellId.fromFace(0);
      String token = cellId.toToken();
      expect(token, isNotEmpty);
    });

    test('parent', () {
      S2CellId cellId = S2CellId.fromFace(0);
      S2CellId parentCellId = cellId.parent();
      expect(parentCellId.id, isNotNull);
    });

    test('immediateParent', () {
      S2CellId cellId = S2CellId.fromFace(0);
      S2CellId immediateParentCellId = cellId.immediateParent();
      expect(immediateParentCellId.id, isNotNull);
    });

    test('isFace', () {
      S2CellId cellId = S2CellId.fromFace(0);
      expect(cellId.isFace(), isTrue);
    });

    test('lsb', () {
      S2CellId cellId = S2CellId.fromFace(0);
      expect(cellId.lsb(), isNotNull);
    });

    test('level', () {
      S2CellId cellId = S2CellId.fromFace(0);
      expect(cellId.level, equals(0));
    });

    test('hashCode', () {
      S2CellId cellId = S2CellId.fromFace(0);
      expect(cellId.hashCode, equals(cellId.id));
    });

    test('operator ==', () {
      S2CellId cellId1 = S2CellId.fromFace(0);
      S2CellId cellId2 = S2CellId.fromFace(0);
      expect(cellId1 == cellId2, isTrue);
    });

    test('operator <', () {
      S2CellId cellId1 = S2CellId.fromFace(0);
      S2CellId cellId2 = S2CellId.fromFace(1);
      expect(cellId1 < cellId2, isTrue);
    });

    test('operator >', () {
      S2CellId cellId1 = S2CellId.fromFace(1);
      S2CellId cellId2 = S2CellId.fromFace(0);
      expect(cellId1 > cellId2, isTrue);
    });
  });
}