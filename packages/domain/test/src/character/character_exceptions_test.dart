import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('CharacterDetailException to string', () {
    const exception = CharacterDetailException();
    expect('$exception', 'CharacterDetailException()');
  });
  test('CharacterListException to string', () {
    const exception = CharacterListException();
    expect('$exception', 'CharacterListException()');
  });
}
