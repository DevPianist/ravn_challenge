import 'package:domain/domain.dart';
import 'package:test/test.dart';

const _character = Character(
  id: '1',
  name: 'test',
  homeworld: 'Tatooine',
  species: 'Droid',
);
const _characterWithSpeciesNull = Character(
  id: '1',
  name: 'test',
  homeworld: 'Tatooine',
  species: null,
);
void main() {
  test('character => viewer to string', () {
    expect(
      '$_character',
      'Character(id: 1, name: test, species: Droid, '
          'homeworld: Tatooine)',
    );
  });

  group(
    'character => description',
    () {
      test(
        'should return the correct description when the species is null',
        () {
          expect(
            _characterWithSpeciesNull.description,
            'Human from Tatooine',
          );
        },
      );
      test(
        'should return the correct description when the species is not null',
        () {
          expect(
            _character.description,
            'Droid from Tatooine',
          );
        },
      );
    },
  );
}
