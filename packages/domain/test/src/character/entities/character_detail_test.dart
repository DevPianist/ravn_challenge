import 'package:domain/domain.dart';
import 'package:test/test.dart';

const _detail = CharacterDetail(
  id: '1',
  name: 'test',
  eyeColor: 'Blue',
  hairColor: 'Blond',
  skinColor: 'Fair',
  birthYear: '19BBY',
  vehicles: [
    Vehicle(
      id: '1',
      name: 'Snowspeeder',
    ),
    Vehicle(
      id: '2',
      name: 'Imperial Speeder Bike',
    ),
  ],
);
void main() {
  test('character_detail => viewer to string', () {
    expect(
      '$_detail',
      'CharacterDetail(id: 1, name: test, '
          'eyeColor: Blue, hairColor: Blond, '
          'vehicles: ${_detail.vehicles}, skinColor: Fair, birthYear: 19BBY)',
    );
  });
  test('character_detail => props', () {
    expect(_detail.props, [
      '1',
      'test',
      'Blue',
      'Blond',
      _detail.vehicles,
      'Fair',
      '19BBY',
    ]);
  });
}
