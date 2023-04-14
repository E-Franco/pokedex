import 'package:flutter/material.dart';
import 'package:pokedex/common/domain/entities/pokemon.dart';
import 'package:pokedex/common/presentation/helpers/base_controller.dart';

abstract class HomeController implements BaseController {
  Future<void> fetchPokemons();
  abstract ValueNotifier<List<PokemonEntity>> pokemons;
}
