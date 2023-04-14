import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/common/core/enums/pokemon_type.dart';
import 'package:pokedex/common/domain/entities/pokemon.dart';
import 'package:pokedex/features/infra/models/ability_model.dart';
import 'package:pokedex/features/infra/models/pokemon_model.dart';
import 'package:pokedex/features/infra/models/stat_model.dart';

import '../../../mocks/fake_pokemon_factory.dart';
import '../../../mocks/pokemon_json_mock.dart';

void main() {
  late PokemonModel model;

  setUp(() {
    model = FakePokemonFactory.makeModel();
  });

  test(
    'Should be a subclass of PokemonEntity',
    () {
      expect(model, isA<PokemonEntity>());
    },
  );

  test(
    'Should return a valid model',
    () {
      // Arrange
      final json = jsonDecode(pokemonJsonMock);

      // Act
      final model = PokemonModel.fromJson(json);

      // Assert
      expect(model, isA<PokemonModel>());

      expect(model.abilities, isA<List<AbilityModel>>());
      expect(model.abilities.length, greaterThan(0));

      expect(model.height, isA<num>());
      expect(model.height, isNotNull);

      expect(model.weight, isA<num>());
      expect(model.weight, isNotNull);

      expect(model.id, isA<int>());
      expect(model.id, isNotNull);

      expect(model.image, isA<String>());
      expect(model.image, isNotNull);
      expect(model.image, isNotNull);

      expect(model.name, isA<String>());
      expect(model.name, isNotNull);
      expect(model.name, isNotEmpty);

      expect(model.stats, isA<List<StatModel>>());
      expect(model.stats.length, greaterThan(0));

      expect(model.types, isA<PokemonType>());
      expect(model.types, isNotNull);
    },
  );
}
