import '../models/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<List<String>> getPokemons(int offset, {int? limit});

  Future<PokemonModel> getPokemonByName(String name);
}
