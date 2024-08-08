import 'package:test/test.dart';
import 'dart:math';
import 'package:s2geometry/src/s1angle.dart'; 

void main() {
  group('S1Angle', () {
    // ensure S1Angle() is zero radians at initialization
    test('Default constructor initializes to zero radians', () {
      final angle = S1Angle();
      expect(angle.radians, equals(0.0));
    });
    // ensure S1Angle.fromRadians(pi) is pi radians
    test('fromRadians constructor initializes correctly', () {
      final angle = S1Angle.fromRadians(pi);
      expect(angle.radians, equals(pi));
    });
    // ensure S1Angle.fromDegrees(180.0) is pi radians
    test('fromDegrees constructor initializes correctly', () {
      final angle = S1Angle.fromDegrees(180.0);
      expect(angle.radians, closeTo(pi, 1e-10));
    });
    
    test('degrees getter returns correct value', () {
      final angle = S1Angle.fromRadians(pi);
      expect(angle.degrees, closeTo(180.0, 1e-10));
    });
    
    test('infinity returns an angle with infinite radians', () {
      final angle = S1Angle.infinity;
      expect(angle.radians, equals(double.infinity));
    });
    
    test('zero returns an angle with zero radians', () {
      final angle = S1Angle.zero;
      expect(angle.radians, equals(0.0));
    });
    
    test('hashCode returns correct value', () {
      final angle = S1Angle.fromRadians(pi);
      expect(angle.hashCode, equals(pi.hashCode));
    });
    
    test('equality operator works correctly', () {
      final angle1 = S1Angle.fromRadians(pi);
      final angle2 = S1Angle.fromRadians(pi);
      final angle3 = S1Angle.fromRadians(2 * pi);
      expect(angle1 == angle2, isTrue);
      expect(angle1 == angle3, isFalse);
    });
    
    test('less than operator works correctly', () {
      final angle1 = S1Angle.fromRadians(pi);
      final angle2 = S1Angle.fromRadians(2 * pi);
      expect(angle1 < angle2, isTrue);
      expect(angle2 < angle1, isFalse);
    });
    
    test('greater than operator works correctly', () {
      final angle1 = S1Angle.fromRadians(pi);
      final angle2 = S1Angle.fromRadians(2 * pi);
      expect(angle2 > angle1, isTrue);
      expect(angle1 > angle2, isFalse);
    });
  });
}