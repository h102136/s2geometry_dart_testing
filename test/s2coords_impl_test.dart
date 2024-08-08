import 'package:test/test.dart';
import 'package:s2geometry/src/s2coords_impl.dart';
void main() {
  test('kFaceUVWAxes values are correct', () {
    expect(kFaceUVWAxes[0], [
      [4.0, 1.0],
      [5.0, 2.0],
      [3.0, 0.0]
    ]);
    expect(kFaceUVWAxes[1], [
      [0.0, 3.0],
      [5.0, 2.0],
      [4.0, 1.0]
    ]);
    expect(kFaceUVWAxes[2], [
      [0.0, 3.0],
      [1.0, 4.0],
      [5.0, 2.0]
    ]);
    expect(kFaceUVWAxes[3], [
      [2.0, 5.0],
      [1.0, 4.0],
      [0.0, 3.0]
    ]);
    expect(kFaceUVWAxes[4], [
      [2.0, 5.0],
      [3.0, 0.0],
      [1.0, 4.0]
    ]);
    expect(kFaceUVWAxes[5], [
      [4.0, 1.0],
      [3.0, 0.0],
      [2.0, 5.0]
    ]);
  });

  test('kFaceUVWFaces values are correct', () {
    expect(kFaceUVWFaces[0], [
      [0, 1, 0],
      [0, 0, 1],
      [1, 0, 0]
    ]);
    expect(kFaceUVWFaces[1], [
      [-1, 0, 0],
      [0, 0, 1],
      [0, 1, 0]
    ]);
    expect(kFaceUVWFaces[2], [
      [-1, 0, 0],
      [0, -1, 0],
      [0, 0, 1]
    ]);
    expect(kFaceUVWFaces[3], [
      [0, 0, -1],
      [0, -1, 0],
      [-1, 0, 0]
    ]);
    expect(kFaceUVWFaces[4], [
      [0, 0, -1],
      [1, 0, 0],
      [0, -1, 0]
    ]);
    expect(kFaceUVWFaces[5], [
      [0, 1, 0],
      [1, 0, 0],
      [0, 0, -1]
    ]);
  });
}