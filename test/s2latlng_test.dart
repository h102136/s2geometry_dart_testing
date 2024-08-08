import 'package:test/test.dart';
import 'package:s2geometry/src/s1angle.dart';
import 'package:s2geometry/src/s2latlng.dart';
import 'package:s2geometry/src/s2point.dart';
import 'package:s2geometry/src/r2point.dart';
import 'dart:math';
void main() {
  group('S2LatLng', () {
    test('constructor and getters', () {
      var lat = S1Angle.fromDegrees(45.0);
      var lng = S1Angle.fromDegrees(90.0);
      var latLng = S2LatLng(lat, lng);
      expect(latLng.lat.radians, equals(lat.radians));
      expect(latLng.lng.radians, equals(lng.radians));
    });

    test('invalid constructor', () {
      var latLng = S2LatLng.invalid();
      expect(latLng.lat.radians, equals(pi));
      expect(latLng.lng.radians, equals(2.0 * pi));
    });

    test('zero constructor', () {
      var latLng = S2LatLng.zero();
      expect(latLng.lat.radians, equals(0.0));
      expect(latLng.lng.radians, equals(0.0));
    });

    test('fromRadians constructor', () {
      var latLng = S2LatLng.fromRadians(pi / 4, pi / 2);
      expect(latLng.lat.radians, equals(pi / 4));
      expect(latLng.lng.radians, equals(pi / 2));
    });

    test('fromDegrees constructor', () {
      var latLng = S2LatLng.fromDegrees(45.0, 90.0);
      expect(latLng.lat.degrees, equals(45.0));
      expect(latLng.lng.degrees, equals(90.0));
    });

    test('isValid getter', () {
      var latLng = S2LatLng.fromDegrees(45.0, 90.0);
      expect(latLng.isValid, isTrue);

      latLng = S2LatLng.fromDegrees(200.0, 90.0);
      expect(latLng.isValid, isFalse);
    });

    test('toPoint method', () {
      var latLng = S2LatLng.fromDegrees(45.0, 90.0);
      var point = latLng.toPoint();
      expect(point.x, closeTo(0.0, 1e-10));
      expect(point.y, closeTo(0.70710678118, 1e-10));
      expect(point.z, closeTo(0.70710678118, 1e-10));
    });
  });
}