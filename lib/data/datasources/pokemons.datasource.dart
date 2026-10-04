import 'package:pokememory/data/models/pokemon_list.model.dart';

import '../models/pokemon.model.dart';

abstract class PokemonsDatasource {
  Future<PokemonListModel> getPokemons({
    required int limit,
    required int offset,
  });

  Future<PokemonModel> getPokemonDetail({required String url});
}
