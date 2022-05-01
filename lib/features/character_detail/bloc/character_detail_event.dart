part of 'character_detail_bloc.dart';

abstract class CharacterDetailEvent {
  const CharacterDetailEvent();
}

class LoadCharacterDetail extends CharacterDetailEvent {
  const LoadCharacterDetail({
    required this.id,
  });
  final String id;
}
