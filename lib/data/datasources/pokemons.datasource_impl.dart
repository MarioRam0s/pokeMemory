import 'package:dio/dio.dart';
import 'package:pokememory/data/datasources/pokemons.datasource.dart';
import 'package:pokememory/data/models/pokemon.model.dart';
import 'package:pokememory/data/models/pokemon_list.model.dart';

class PokemonsDatasourceImpl implements PokemonsDatasource {
  final Dio dio;

  PokemonsDatasourceImpl({required this.dio});

  @override
  Future<PokemonListModel> getPokemons({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await dio.get(
        '/pokemon',
        queryParameters: {'limit': limit, 'offset': offset},
      );

      final PokemonListModel listPokemon = PokemonListModel.fromJson(
        response.data,
      );

      return listPokemon;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<PokemonModel> getPokemonDetail({required String url}) async {
    final response = await dio.get(url);

    return PokemonModel.fromJson(response.data);
  }
}
