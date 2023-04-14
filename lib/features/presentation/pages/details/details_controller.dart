import 'package:flutter/foundation.dart';
import 'package:pokedex/common/domain/entities/pokemon.dart';
import 'package:pokedex/common/presentation/helpers/base_controller.dart';

abstract class DetailsController implements BaseController{
  abstract ValueNotifier<PokemonEntity?> selectedPokemon;
  bool isLast();
  bool isFirst();
  void nextPokemon();
  void previousPokemon();
}