class PokemonApi {
  PokemonApi._();

  static String getPokemons(int offset, int limit) {
    return 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset';
  }

  static String getByName(String name){
    return 'https://pokeapi.co/api/v2/pokemon/$name';
  }
}
