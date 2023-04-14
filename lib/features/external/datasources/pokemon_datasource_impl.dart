import 'dart:convert';

import 'package:pokedex/common/domain/errors/exceptions.dart';
import 'package:pokedex/features/infra/models/pokemon_model.dart';

import '../../../common/core/client/http_client.dart';
import '../../infra/datasources/pokemon_datasource.dart';
import '../endpoints/pokemon_api_endpoints.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  PokemonDatasourceImpl({
    required this.client,
  });

  final HttpClient client;

  @override
  Future<List<String>> getPokemons(int offset, {int? limit = 20}) async {
    final response = await client.get(PokemonApi.getPokemons(offset, limit!));
    if (response.statusCode == 200) {
      final results = jsonDecode(response.data);
      return results['results'].map<String>((e) => e['name'] as String).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) async {
    final response = await client.get(PokemonApi.getByName(name));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.data);
      return PokemonModel.fromJson(result);
    } else {
      throw ServerException();
    }
  }
}
