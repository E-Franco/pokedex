import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/common/domain/errors/exceptions.dart';
import 'package:pokedex/common/domain/errors/failures.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/infra/datasources/pokemon_datasource.dart';
import 'package:pokedex/features/infra/repositories/pokemon_repository_impl.dart';
import 'package:faker/faker.dart';

import '../../../mocks/fake_pokemon_factory.dart';

class PokemonDatasourceMock extends Mock implements PokemonDatasource {}

void main() {
  late PokemonRepository repository;
  late PokemonDatasource datasource;
  late String pokemonName;

  setUp(() {
    datasource = PokemonDatasourceMock();
    repository = PokemonRepositoryImpl(datasource: datasource);
    pokemonName = 'ditto';
  });

  group(
    'Tests related to getPokemons method',
    () {
      test(
        'Should return a names list when calls the datasource',
        () async {
          // Arrange
          final response = List.generate(20, (index) => faker.person.firstName());

          when(
            () => datasource.getPokemons(any(), limit: any(named: 'limit')),
          ).thenAnswer(
            (_) async => response,
          );

          // Act
          final result = await repository.getPokemons(0);

          // Assert
          verify(
            () => datasource.getPokemons(any(), limit: any(named: 'limit')),
          ).called(1);
          expect(result, isA<Right>());
          expect(result.fold(id, id), response);
        },
      );

      test(
        'Should return a Failure on error',
        () async {
          // Arrange
          when(
            () => datasource.getPokemons(any(), limit: any(named: 'limit')),
          ).thenThrow(ServerException());

          // Act
          final result = await repository.getPokemons(0);

          // Assert
          verify(
            () => datasource.getPokemons(any(), limit: any(named: 'limit')),
          ).called(1);
          expect(result.isLeft(), equals(true));
          expect(result.fold(id, id), isA<ServerFailure>());
        },
      );
    },
  );

  group(
    'Tests related to getPokemonByName method',
    () {
      test(
        'Should return a PokemonModel when calls the datasource',
        () async {
          // Arrange
          final response = FakePokemonFactory.makeModel();

          when(
            () => datasource.getPokemonByName(any()),
          ).thenAnswer(
            (_) async => response,
          );

          // Act
          final result = await repository.getPokemonByName(pokemonName);

          // Assert
          verify(
            () => datasource.getPokemonByName(any()),
          ).called(1);
          expect(result, isA<Right>());
          expect(result.fold(id, id), response);
        },
      );

      test(
        'Should return a Failure on error',
        () async {
          // Arrange
          when(
            () => datasource.getPokemonByName(any()),
          ).thenThrow(ServerException());

          // Act
          final result = await repository.getPokemonByName(pokemonName);

          // Assert
          verify(
            () => datasource.getPokemonByName(any()),
          ).called(1);
          expect(result.isLeft(), equals(true));
          expect(result.fold(id, id), isA<ServerFailure>());
        },
      );
    },
  );
}
