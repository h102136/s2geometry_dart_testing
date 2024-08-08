import 'package:test/test.dart';
import 'package:s2geometry/src/s2point.dart';

void main() {
  group('S2Point', () {
    test('constructor and index operator', () {
      var point = S2Point(1.0, 2.0, 3.0);
      expect(point[0], equals(1.0));
      expect(point[1], equals(2.0));
      expect(point[2], equals(3.0));
    });

    test('abs method', () {
      var point = S2Point(-1.0, -2.0, -3.0);
      var absPoint = point.abs();
      expect(absPoint[0], equals(1.0));
      expect(absPoint[1], equals(2.0));
      expect(absPoint[2], equals(3.0));
    });

    test('largestAbsComponent method', () {
      var point = S2Point(-1.0, -3.0, -2.0);
      expect(point.largestAbsComponent(), equals(1));

      point = S2Point(4.0, -3.0, 2.0);
      expect(point.largestAbsComponent(), equals(0));

      point = S2Point(1.0, 2.0, 5.0);
      expect(point.largestAbsComponent(), equals(2));
    });

    test('invalid index', () {
      var point = S2Point(1.0, 2.0, 3.0);
      expect(() => point[3], throwsException);
    });
  });
}