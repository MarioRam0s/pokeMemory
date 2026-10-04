import 'package:pokememory/data/datasources/pokemons.datasource.dart';
import 'package:pokememory/domain/entities/pokemon_list.entitiy.dart';
import 'package:pokememory/domain/repositories/pokemons.repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({required this.datasource});

  @override
  Future<List<PokemonEntity>> getPokemonList({
    required int limit,
    required int offset,
  }) async {
    final listPokemonsData = await datasource.getPokemons(
      limit: limit,
      offset: offset,
    );

    final List<PokemonEntity> listPokemons = await Future.wait(
      listPokemonsData.results.map((item) async {
        final pokemonDetail = await getPokemonDetail(url: item.url);
        return PokemonEntity(
          id: pokemonDetail.id,
          name: pokemonDetail.name,
          image: pokemonDetail.image,
          types: pokemonDetail.types,
          height: pokemonDetail.height,
          weight: pokemonDetail.weight,
        );
      }),
    );

    return listPokemons;
  }

  @override
  Future<PokemonEntity> getPokemonDetail({required String url}) async {
    final pokemon = await datasource.getPokemonDetail(url: url);

    final pokemonDetail = PokemonEntity(
      id: pokemon.id,
      name: pokemon.name,
      image: pokemon.sprites.other?.officialArtwork.frontDefault,
      types:
          pokemon.types
              .map(
                (type) => Type(
                  slot: type.slot,
                  type: Species(name: type.type.name, url: type.type.url),
                ),
              )
              .toList(),
      height: pokemon.height,
      weight: pokemon.weight,
    );
    return pokemonDetail;
  }
}
