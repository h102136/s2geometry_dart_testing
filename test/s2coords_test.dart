import 'package:test/test.dart';
import 'package:s2geometry/src/r2point.dart';
import 'package:s2geometry/src/s2point.dart';
import 'package:s2geometry/src/s2coords.dart';
import 'dart:math';

void main() {
  group('S2Coords Tests', () {
    test('stToUV', () {
      expect(stToUV(0.0), equals(-1.0));
      expect(stToUV(0.5), equals(0.0));
      expect(stToUV(1.0), equals(1.0));
    });

    test('uvToST', () {
      expect(uvToST(0.0), equals(0.5));
      expect(uvToST(1.0), equals(0.5 * sqrt(4.0)));
      expect(uvToST(-1.0), equals(1 - 0.5 * sqrt(4.0)));
    });

    test('ijToSTMin', () {
      expect(ijToSTMin(0), equals(0.0));
      expect(ijToSTMin(kLimitIJ), equals(1.0));
    });

    test('stToIJ', () {
      expect(stToIJ(0.0), equals(0));
      expect(stToIJ(0.5), equals(kLimitIJ ~/ 2));
      expect(stToIJ(1.0), equals(kLimitIJ - 1));
    });

    test('siTiToST', () {
      expect(siTiToST(0), equals(0.0));
      expect(siTiToST(kMaxSiTi), equals(1.0));
    });

    test('stToSiTi', () {
      expect(stToSiTi(0.0), equals(0));
      expect(stToSiTi(1.0), equals(kMaxSiTi));
    });

    test('faceUVToXYZ', () {
      expect(faceUVToXYZ(0, R2Point(0.0, 0.0)), equals(S2Point(1.0, 0.0, 0.0)));
      expect(faceUVToXYZ(1, R2Point(0.0, 0.0)), equals(S2Point(0.0, 1.0, 0.0)));
    });

    test('validFaceXYZToUV', () {
      expect(validFaceXYZToUV(0, S2Point(1.0, 1.0, 1.0)), equals(R2Point(1.0, 1.0)));
    });

    test('getFace', () {
      expect(getFace(S2Point(1.0, 0.0, 0.0)), equals(0));
      expect(getFace(S2Point(0.0, 1.0, 0.0)), equals(1));
    });

    test('xyzToFaceUV', () {
      S2FaceUV faceUV = xyzToFaceUV(S2Point(1.0, 0.0, 0.0));
      expect(faceUV.face, equals(0));
      expect(faceUV.uv, equals(R2Point(0.0, 0.0)));
    });

    test('faceXYZtoUV', () {
      expect(faceXYZtoUV(0, S2Point(1.0, 0.0, 0.0)), equals(R2Point(0.0, 0.0)));
    });

    test('getUNorm', () {
      expect(getUNorm(0, 0.0), equals(S2Point(0.0, -1.0, 0.0)));
    });

    test('getVNorm', () {
      expect(getVNorm(0, 0.0), equals(S2Point(0.0, 0.0, 1.0)));
    });

    test('getNorm', () {
      expect(getNorm(0), equals(S2Point(1.0, 0.0, 0.0)));
    });

    test('getUAxis', () {
      expect(getUAxis(0), equals(S2Point(1.0, 0.0, 0.0)));
      expect(() => getUAxis(-1), throwsRangeError);
      expect(() => getUAxis(6), throwsRangeError);
    });

    test('getVAxis', () {
      expect(getVAxis(0), equals(S2Point(0.0, 1.0, 0.0)));
      expect(() => getVAxis(-1), throwsRangeError);
      expect(() => getVAxis(6), throwsRangeError);
    });

    test('getUVWFace', () {
      expect(getUVWFace(0, 0, 0), equals(0));
    });
  });
}