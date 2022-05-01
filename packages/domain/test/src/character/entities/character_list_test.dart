import 'package:domain/domain.dart';
import 'package:test/test.dart';

const _list = CharacterList(
  afterCode: 'xyz',
  characters: [
    Character(
      id: '1',
      name: 'test',
      species: 'Droid',
      homeworld: 'Tatooine',
    ),
  ],
  hasNextPage: true,
);
void main() {
  test('character_list => viewer to string', () {
    expect(
      '$_list',
      'CharacterList(characters: ${_list.characters}, '
          'hasNextPage: true, afterCode: xyz)',
    );
  });
  test('character_list => props', () {
    expect(_list.props, [
      _list.characters,
      _list.hasNextPage,
      _list.afterCode,
    ]);
  });
}
