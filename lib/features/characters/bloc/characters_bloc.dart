import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({
    required CharacterRepository characterRepository,
  })  : _characterRepository = characterRepository,
        super(const CharactersInitial()) {
    on<LoadCharacters>(_onLoadCharacters);
    on<LoadNextCharacters>(_onLoadNextCharacters);
    on<ShowCharacterDetail>(_onShowCharacterDetail);
    on<ReturnToList>(_onReturnToList);
  }

  final CharacterRepository _characterRepository;

  CharactersState get _errorState => const CharactersError();

  Future<void> _onLoadCharacters(
    LoadCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    try {
      emit(const CharactersLoading());
      final characterList =
          await _characterRepository.fetch(limit: 5, afterCode: null);
      emit(
        CharactersLoaded(
          characterList: characterList,
          lastUpdated: event.lastUpdated,
        ),
      );
    } catch (e) {
      emit(_errorState);
    }
  }

  Future<void> _onLoadNextCharacters(
    LoadNextCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    if (state is CharactersLoaded && state.characterList!.hasNextPage) {
      try {
        emit(
          CharactersLoading(
            characterList: state.characterList,
            lastUpdated: state.lastUpdated,
          ),
        );
        final newCharacterList = await _characterRepository.fetch(
          limit: 5,
          afterCode: state.characterList!.afterCode,
        );
        emit(
          CharactersLoaded(
            characterList: CharacterList(
              afterCode: newCharacterList.afterCode,
              characters: [
                ...state.characterList!.characters,
                ...newCharacterList.characters
              ],
              hasNextPage: newCharacterList.hasNextPage,
            ),
            lastUpdated: state.lastUpdated!,
          ),
        );
      } catch (e) {
        emit(_errorState);
      }
    }
  }

  void _onShowCharacterDetail(
    ShowCharacterDetail event,
    Emitter<CharactersState> emit,
  ) {
    if (state.characterList != null && state.lastUpdated != null) {
      emit(
        ShowingCharacterDetail(
          character: event.character,
          characterList: state.characterList!,
          lastUpdated: state.lastUpdated!,
        ),
      );
    }
  }

  void _onReturnToList(
    ReturnToList event,
    Emitter<CharactersState> emit,
  ) {
    if (state is ShowingCharacterDetail) {
      emit(
        CharactersLoaded(
          characterList: state.characterList!,
          lastUpdated: state.lastUpdated!,
        ),
      );
    }
  }
}
