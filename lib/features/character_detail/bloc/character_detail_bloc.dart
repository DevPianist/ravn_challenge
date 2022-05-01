import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  CharacterDetailBloc({
    required CharacterRepository characterRepository,
  })  : _characterRepository = characterRepository,
        super(const CharacterDetailInitial()) {
    on<LoadCharacterDetail>(_onLoadCharacterDetail);
  }

  final CharacterRepository _characterRepository;

  Future<void> _onLoadCharacterDetail(
    LoadCharacterDetail event,
    Emitter<CharacterDetailState> emit,
  ) async {
    emit(const CharacterDetailLoading());
    try {
      final characterDetail = await _characterRepository.findById(event.id);
      emit(CharacterDetailLoaded(characterDetail: characterDetail));
    } catch (e) {
      emit(const CharacterDetailError());
    }
  }
}
