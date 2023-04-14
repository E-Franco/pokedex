
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/common/core/client/http_client.dart';
import 'package:pokedex/common/domain/errors/exceptions.dart';
import 'package:pokedex/features/external/datasources/pokemon_datasource_impl.dart';
import 'package:pokedex/features/infra/datasources/pokemon_datasource.dart';
import 'package:pokedex/features/infra/models/pokemon_model.dart';

import '../../../mocks/pokemon_json_mock.dart';
import '../../../mocks/pokemon_urls_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late PokemonDatasource datasource;
  late HttpClient client;
  late String pokemonsUrl;
  late String pokemonByNameUrl;
  late String pokemonName;

  setUp(
    () {
      client = HttpClientMock();
      datasource = PokemonDatasourceImpl(client: client);
      pokemonsUrl = 'https://pokeapi.co/api/v2/pokemon?limit=20&offset=0';
      pokemonByNameUrl = 'https://pokeapi.co/api/v2/pokemon/ditto';
      pokemonName = 'ditto';
    },
  );

  group(
    'Tests related to getPokemons method',
    () {
      test('Should call the get method with correct url', () async {
        // Arrange
        when(
          () => client.get(any()),
        ).thenAnswer((_) async => HttpResponse(data: pokemonUrlsMock, statusCode: 200));

        // Act
        await datasource.getPokemons(0);

        // Assert
        verify(() => client.get(pokemonsUrl)).called(1);
      });

      test(
        'Should return a list of url on success',
        () async {
          // Arrange
          when(
            () => client.get(any()),
          ).thenAnswer((_) async => HttpResponse(data: pokemonUrlsMock, statusCode: 200));

          // Act
          final result = await datasource.getPokemons(0);

          // Assert
          verify(() => client.get(any())).called(1);
          expect(result, isA<List<String>>());
          expect(result, isNotEmpty);
          expect(result, isNotNull);
        },
      );

      test(
        'Throw a ServerException on error',
        () {
          // Arrange
          when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: 'error', statusCode: 500));

          // Act
          final result = datasource.getPokemons(0);

          // Assert
          expect(() => result, throwsA(ServerException()));
        },
      );
    },
  );

  group(
    'Tests related to getPokemonByName method',
    () {
      test('Should call the get method with correct url', () async {
        // Arrange
        when(
          () => client.get(any()),
        ).thenAnswer((_) async => HttpResponse(data: pokemonJsonMock, statusCode: 200));

        // Act
        await datasource.getPokemonByName(pokemonName);

        // Assert
        verify(() => client.get(pokemonByNameUrl)).called(1);
      });

      test(
        'Should return a PokemonModel on success',
        () async {
          // Arrange
          when(
            () => client.get(any()),
          ).thenAnswer((_) async => HttpResponse(data: pokemonJsonMock, statusCode: 200));

          // Act
          final result = await datasource.getPokemonByName(pokemonName);

          // Assert
          verify(() => client.get(any())).called(1);
          expect(result, isA<PokemonModel>());
          expect(result, isNotNull);
        },
      );

      test(
        'Throw a ServerException on error',
        () {
          // Arrange
          when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: 'error', statusCode: 500));

          // Act
          final result = datasource.getPokemonByName(pokemonName);

          // Assert
          expect(() => result, throwsA(ServerException()));
        },
      );
    },
  );
}
