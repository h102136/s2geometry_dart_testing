import 'package:test/test.dart';
import 'package:s2geometry/src/r2point.dart';

void main() {
  group('R2Point', () {
    test('Constructor initializes correctly', () {
      var point = R2Point(1.0, 2.0);
      expect(point.x, equals(1.0));
      expect(point.y, equals(2.0));
    });

    test('Zero constructor initializes to (0.0, 0.0)', () {
      var point = R2Point.zero();
      expect(point.x, equals(0.0));
      expect(point.y, equals(0.0));
    });

    test('Operator [] returns correct values', () {
      var point = R2Point(3.0, 4.0);
      expect(point[0], equals(3.0));
      expect(point[1], equals(4.0));
      expect(() => point[2], throwsException);
    });

    test('Getters u and v return correct values', () {
      var point = R2Point(5.0, 6.0);
      expect(point.u, equals(5.0));
      expect(point.v, equals(6.0));
    });
  });
}