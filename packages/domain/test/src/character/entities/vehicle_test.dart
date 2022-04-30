import 'package:domain/domain.dart';
import 'package:test/test.dart';

const _vehicle = Vehicle(
  id: '1',
  name: 'Snowspeeder',
);
void main() {
  test('vehicle => viewer to string', () {
    expect(
      '$_vehicle',
      'Vehicle(id: 1, name: Snowspeeder)',
    );
  });
}
