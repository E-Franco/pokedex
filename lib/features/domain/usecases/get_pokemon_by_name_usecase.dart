import 'package:dartz/dartz.dart';

import '../../../common/domain/entities/pokemon.dart';
import '../../../common/domain/errors/failures.dart';
import '../../../common/domain/usecases/usecase.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonByNameUsecase implements Usecase<PokemonEntity, String> {
  GetPokemonByNameUsecase({
    required this.repository,
  });

  final PokemonRepository repository;

  @override
  Future<Either<Failure, PokemonEntity>> call(String name) async {
    return await repository.getPokemonByName(name);
  }

}
