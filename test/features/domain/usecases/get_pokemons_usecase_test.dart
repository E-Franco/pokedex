import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/common/domain/errors/failures.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/domain/usecases/get_pokemons_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';


class PokemonRepositoryMock extends Mock implements PokemonRepository {}

void main() {
  late GetPokemonsUsecase usecase;
  late PokemonRepository repository;
  late GetPokemonsParams params;

  setUp(() {
    repository = PokemonRepositoryMock();
    usecase = GetPokemonsUsecase(repository: repository);
    params = const GetPokemonsParams();
  });

  test(
    'Should get a names list on success',
    () async {
      // Arrange
      final response = List.generate(20, (index) => faker.person.firstName());

      when(
        () => repository.getPokemons(any(), limit: any(named: 'limit')),
      ).thenAnswer(
        (_) async => Right(response),
      );

      // Act
      final result = await usecase(params);

      // Assert
      verify(
        () => repository.getPokemons(any(), limit: any(named: 'limit')),
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
        () => repository.getPokemons(any(), limit: any(named: 'limit')),
      ).thenAnswer(
        (_) async => Left(response),
      );

      // Act
      final result = await usecase(params);

      // Assert
      verify(
        () => repository.getPokemons(any(), limit: any(named: 'limit')),
      ).called(1);
      expect(result.isLeft(), equals(true));
      expect(result.fold(id, id), response);
    },
  );
}
