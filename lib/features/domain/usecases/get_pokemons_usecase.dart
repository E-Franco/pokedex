import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../common/domain/errors/failures.dart';
import '../../../common/domain/usecases/usecase.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonsUsecase implements Usecase<List<String>, GetPokemonsParams> {
  GetPokemonsUsecase({
    required this.repository,
  });

  final PokemonRepository repository;

  @override
  Future<Either<Failure, List<String>>> call(GetPokemonsParams params) async {
    return await repository.getPokemons(params.offset, limit: params.limit);
  }
}

class GetPokemonsParams extends Equatable {
  final int limit;
  final int offset;

  const GetPokemonsParams({
    this.offset = 0,
    this.limit = 20,
  });

  @override
  List<Object?> get props => [limit, offset];
}
