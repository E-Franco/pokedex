import 'package:dartz/dartz.dart';
import 'package:pokedex/common/domain/entities/pokemon.dart';

import '../../../common/domain/errors/failures.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<String>>> getPokemons(int offset, {int limit});

  Future<Either<Failure, PokemonEntity>> getPokemonByName(String name);
}
