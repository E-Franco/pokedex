import 'package:faker/faker.dart';
import 'package:pokedex/common/core/enums/pokemon_type.dart';
import 'package:pokedex/common/domain/entities/pokemon.dart';
import 'package:pokedex/features/infra/models/pokemon_model.dart';

import 'fake_ability_factory.dart';
import 'fake_pokemon_type_factory.dart';
import 'fake_stat_factory.dart';

class FakePokemonFactory {
  FakePokemonFactory._();

  static PokemonEntity makeEntity() {
    final type = FakePokemonTypeFactory.makeOne();
    return PokemonEntity(
      height: faker.randomGenerator.decimal(),
      weight: faker.randomGenerator.decimal(),
      image: faker.image.image(width: 200, height: 200),
      name: faker.person.firstName(),
      id: faker.randomGenerator.integer(300),
      abilities: FakeAbilityFactory.makeMultiple(2),
      stats: FakeStatFactory.makeMultiple(6),
      types: List.generate(2, (index) => FakePokemonTypeFactory.makeOne()),
      typeColor: type.getColor(),
    );
  }

  static List<PokemonEntity> makeMultipleEntities(int length) {
    return List.generate(
      length,
      (_) => makeEntity(),
    );
  }

  static PokemonModel makeModel() {
    final type = FakePokemonTypeFactory.makeOne();
    return PokemonModel(
      height: faker.randomGenerator.decimal(),
      weight: faker.randomGenerator.decimal(),
      image: faker.image.image(width: 200, height: 200),
      name: faker.person.firstName(),
      id: faker.randomGenerator.integer(300),
      abilities: FakeAbilityFactory.makeMultiple(2),
      stats: FakeStatFactory.makeMultiple(6),
      types: List.generate(2, (index) => FakePokemonTypeFactory.makeOne()),
      typeColor: type.getColor(),
    );
  }

  static List<PokemonModel> makeMultipleModels(int length) {
    return List.generate(
      length,
      (_) => makeModel(),
    );
  }
}
