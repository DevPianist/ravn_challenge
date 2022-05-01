import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ravn_challenge/app/app.dart';
import 'package:ravn_challenge/features/character_detail/character_detail.dart';
import 'package:ravn_challenge/features/characters/characters.dart';
import 'package:ravn_challenge/l10n/l10n.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.charactersAppBarTitle),
        centerTitle: !kIsWeb,
      ),
      body: BlocProvider(
        create: (context) => CharactersBloc(
          characterRepository: context.read<CharacterRepository>(),
        )..add(LoadCharacters(lastUpdated: DateTime.now())),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLarge = constraints.maxWidth > 900;
            return isLarge
                ? BlocProvider(
                    create: (context) => CharacterDetailBloc(
                      characterRepository: context.read<CharacterRepository>(),
                    ),
                    child: const CharactersLargeBody(),
                  )
                : BlocListener<CharactersBloc, CharactersState>(
                    listener: (context, state) async {
                      final bloc = context.read<CharactersBloc>();
                      if (state is ShowingCharacterDetail) {
                        await CharacterDetailView.navigate(
                          context,
                          id: state.character.id,
                          title: state.character.name,
                        );
                        bloc.add(const ReturnToList());
                      }
                    },
                    child: const CharactersBody(),
                  );
          },
        ),
      ),
    );
  }
}

class CharactersLargeBody extends StatelessWidget {
  const CharactersLargeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersBloc, CharactersState>(
      listener: (context, state) {
        if (state is ShowingCharacterDetail) {
          context.read<CharacterDetailBloc>().add(
                LoadCharacterDetail(id: state.character.id),
              );
        }
      },
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 350,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                ),
                child: const CharactersBody(),
              ),
            ),
            Expanded(
              child: state is ShowingCharacterDetail
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1200,
                        ),
                        child: const CharacterDetailBody(),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        );
      },
    );
  }
}

class CharactersBody extends StatefulWidget {
  const CharactersBody({Key? key}) : super(key: key);

  @override
  State<CharactersBody> createState() => _CharactersBodyState();
}

class _CharactersBodyState extends State<CharactersBody> {
  late final scrollController = ScrollController()..addListener(scrollListener);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<CharactersBloc, CharactersState>(
      listener: charactersBlocListener,
      builder: (context, state) {
        final characterList = state.characterList;
        final characters = characterList?.characters;
        return RefreshIndicator(
          onRefresh: () async {
            context
                .read<CharactersBloc>()
                .add(LoadCharacters(lastUpdated: DateTime.now()));
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            controller: scrollController,
            slivers: [
              SliverList(
                key: Key(state.lastUpdated.toString()),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final character = characters![index];
                    return CharacterTile(
                      key: Key('CharacterTile-$index'),
                      title: character.name,
                      subtitle: character.description,
                      onTap: () {
                        context
                            .read<CharactersBloc>()
                            .add(ShowCharacterDetail(character: character));
                      },
                    );
                  },
                  childCount: characters?.length ?? 0,
                ),
              ),
              if (state is CharactersLoading)
                const SliverToBoxAdapter(
                  child: LoadingIndicator(),
                ),
              if (state is CharactersError)
                SliverToBoxAdapter(
                  child: ErrorText(l10n.failedLoadData),
                ),
            ],
          ),
        );
      },
    );
  }

  void scrollListener() {
    final bloc = context.read<CharactersBloc>();
    if (scrollController.remainingHeight < 10) {
      bloc.add(const LoadNextCharacters());
    }
  }

  Future<void> charactersBlocListener(
    BuildContext context,
    CharactersState state,
  ) async {
    if (state is CharactersLoaded) {
      scrollListener();
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }
}
