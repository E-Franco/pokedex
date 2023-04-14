import 'package:dartz/dartz.dart';

import '../../../common/domain/entities/pokemon.dart';
import '../../../common/domain/errors/exceptions.dart';
import '../../../common/domain/errors/failures.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required this.datasource,
  });

  final PokemonDatasource datasource;

  @override
  Future<Either<Failure, List<String>>> getPokemons(int offset, {int? limit}) async {
    try {
      final response = await datasource.getPokemons(offset, limit: limit);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonByName(String name) async {
    try {
      final response = await datasource.getPokemonByName(name);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
