import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ravn_challenge/app/app.dart';
import 'package:ravn_challenge/features/character_detail/character_detail.dart';
import 'package:ravn_challenge/l10n/l10n.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);
  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => CharacterDetailBloc(
          characterRepository: context.read<CharacterRepository>(),
        )..add(LoadCharacterDetail(id: id)),
        child: const CharacterDetailBody(),
      ),
    );
  }

  static Future<void> navigate(
    BuildContext context, {
    required String id,
    required String title,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        settings: RouteSettings(name: '/character-detail/$id'),
        builder: (context) => CharacterDetailView(id: id, title: title),
      ),
    );
  }
}

class CharacterDetailBody extends StatelessWidget {
  const CharacterDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<CharacterDetailBloc>().state;
    if (state is CharacterDetailLoaded) {
      final characterDetail = state.characterDetail;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: extraLargeSpacing),
            Padding(
              padding: const EdgeInsets.only(left: mediumSpacing),
              child: Text(
                l10n.generalInformation,
                style: context.primaryTextTheme.h2,
              ),
            ),
            const SizedBox(height: smallSpacing),
            CharacterDetailTile(
              key: const Key('eye-color'),
              info: l10n.eyeColor,
              detail: characterDetail.eyeColor,
            ),
            CharacterDetailTile(
              key: const Key('hair-color'),
              info: l10n.hairColor,
              detail: characterDetail.hairColor,
            ),
            CharacterDetailTile(
              key: const Key('skin-color'),
              info: l10n.skinColor,
              detail: characterDetail.skinColor,
            ),
            CharacterDetailTile(
              key: const Key('birth-year'),
              info: l10n.birthYear,
              detail: characterDetail.birthYear,
            ),
            const SizedBox(height: extraLargeSpacing),
            Padding(
              padding: const EdgeInsets.only(left: mediumSpacing),
              child: Text(
                l10n.vehicles,
                style: context.primaryTextTheme.h2,
              ),
            ),
            const SizedBox(height: smallSpacing),
            if (characterDetail.vehicles.isNotEmpty)
              ...characterDetail.vehicles.map(
                (vehicle) => CharacterDetailTile(
                  key: Key('vehicle-${vehicle.id}'),
                  info: vehicle.name,
                ),
              )
            else
              Center(
                child: Text(
                  l10n.noVehicles,
                  style: context.primaryTextTheme.p1Light,
                ),
              ),
          ],
        ),
      );
    } else if (state is CharacterDetailError) {
      return ErrorText(l10n.failedLoadData);
    } else {
      return const LoadingIndicator();
    }
  }
}
