import 'package:pokememory/domain/entities/pokemon_list.entitiy.dart';
import 'package:pokememory/domain/repositories/pokemons.repository.dart';

class PokemonsUseCase {
  final PokemonsRepository repository;

  PokemonsUseCase(this.repository);

  Future<List<PokemonEntity>> getPokemons({
    required int limit,
    required int offset,
  }) {
    return repository.getPokemonList(limit: limit, offset: offset);
  }
}
