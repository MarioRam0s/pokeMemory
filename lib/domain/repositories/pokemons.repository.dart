import 'package:pokememory/domain/entities/pokemon_list.entitiy.dart';

abstract class PokemonsRepository {
  Future<List<PokemonEntity>> getPokemonList({
    required int limit,
    required int offset,
  });

  Future<PokemonEntity> getPokemonDetail({required String url});
}
