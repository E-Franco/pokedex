import 'package:pokedex/common/core/enums/pokemon_type.dart';
import 'package:faker/faker.dart';

class FakePokemonTypeFactory{
  FakePokemonTypeFactory._();

  static PokemonType makeOne(){
    int length = PokemonType.values.length;
    int randomIndex = faker.randomGenerator.integer(length);

    return PokemonType.values[randomIndex];
  }
}