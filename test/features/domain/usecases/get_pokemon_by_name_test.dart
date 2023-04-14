import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/common/domain/errors/failures.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/domain/usecases/get_pokemon_by_name_usecase.dart';

import '../../../mocks/fake_pokemon_factory.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository{}

void main(){
  late GetPokemonByNameUsecase usecase;
  late PokemonRepository repository;
  late String pokemonName;

  setUp((){
    repository = PokemonRepositoryMock();
    usecase = GetPokemonByNameUsecase(repository: repository);
    pokemonName = 'ditto';
  });

  test(
    'Should get a PokemonEntity on success',
    () async {
      // Arrange
      final response = FakePokemonFactory.makeEntity();

      when(
        () => repository.getPokemonByName(any()),
      ).thenAnswer(
        (_) async => Right(response),
      );

      // Act
      final result = await usecase(pokemonName);

      // Assert
      verify(
        () => repository.getPokemonByName(any()),
      ).called(1);
      expect(result.isRight(), equals(true));
      expect(result.fold(id, id), response);
    },
  );

  test(
    'Should return a Failure on error',
    () async {
      // Arrange
      final response = ServerFailure();
      when(
        () => repository.getPokemonByName(any()),
      ).thenAnswer(
        (_) async => Left(response),
      );

      // Act
      final result = await usecase(pokemonName);

      // Assert
      verify(
        () => repository.getPokemonByName(any()),
      ).called(1);
      expect(result.isLeft(), equals(true));
      expect(result.fold(id, id), response);
    },
  );
}