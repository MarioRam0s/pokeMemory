import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pokememory/domain/entities/pokemon_list.entitiy.dart';

import 'package:pokememory/core/dependency_injection/providers.dart';
import 'package:pokememory/providers/filters.provider.dart';

final loading = StateProvider<bool>((ref) => false);

final pokemonListProvider =
    AsyncNotifierProvider<PokemonListNotifier, List<PokemonEntity>>(
      PokemonListNotifier.new,
    );

class PokemonListNotifier extends AsyncNotifier<List<PokemonEntity>> {
  int _page = 0;

  @override
  Future<List<PokemonEntity>> build() async {
    final useCase = ref.read(pokemonsUseCaseProvider);

    final filter = ref.watch(filterProvider).value!;
    final pokemons = await useCase.getPokemons(
      limit: filter.limit,
      offset: _page * filter.limit,
    );

    return pokemons;
  }

  Future<void> loadMorePokemons() async {
    final loadingMore = ref.read(loading.notifier);

    if (ref.read(loading)) return;

    loadingMore.state = true;
    _page++;
    final filter = ref.read(filterProvider).value;
    final useCase = ref.read(pokemonsUseCaseProvider);
    final pokemons = await useCase.getPokemons(
      limit: filter!.limit,
      offset: _page * filter.limit,
    );

    state = AsyncData([...state.value ?? [], ...pokemons]);
    loadingMore.state = false;
  }
}
