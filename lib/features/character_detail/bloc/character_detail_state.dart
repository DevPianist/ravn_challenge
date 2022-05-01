part of 'character_detail_bloc.dart';

abstract class CharacterDetailState extends Equatable {
  const CharacterDetailState();

  @override
  List<Object> get props => [];
}

class CharacterDetailInitial extends CharacterDetailState {
  const CharacterDetailInitial();
}

class CharacterDetailLoading extends CharacterDetailState {
  const CharacterDetailLoading();
}

class CharacterDetailLoaded extends CharacterDetailState {
  const CharacterDetailLoaded({
    required this.characterDetail,
  });
  final CharacterDetail characterDetail;

  @override
  List<Object> get props => [characterDetail];
}

class CharacterDetailError extends CharacterDetailState {
  const CharacterDetailError();
}
