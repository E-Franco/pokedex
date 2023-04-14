import 'package:flutter/foundation.dart';

import '../../../common/domain/entities/pokemon.dart';
import '../../../common/presentation/helpers/ui_state.dart';
import '../pages/details/details_controller.dart';

class ValueNotifierDetailsController implements DetailsController {
  ValueNotifierDetailsController(this.pokemons);

  final List<PokemonEntity> pokemons;

  @override
  late ValueNotifier<PokemonEntity?> selectedPokemon;

  @override
  late ValueNotifier<UIState> state;

  @override
  void init() {
    state = ValueNotifier(UIState.initial);
    selectedPokemon = ValueNotifier(null);
  }

  @override
  bool isLast() {
    return pokemons.last == selectedPokemon.value;
  }

  @override
  bool isFirst() {
    return pokemons.first == selectedPokemon.value;
  }

  @override
  void nextPokemon() {
    int index = pokemons.indexOf(selectedPokemon.value!);
    selectedPokemon.value = pokemons[index + 1];
  }

  @override
  void previousPokemon() {
    int index = pokemons.indexOf(selectedPokemon.value!);
    selectedPokemon.value = pokemons[index - 1];
  }

  @override
  void dispose() {
    selectedPokemon.dispose();
    state.dispose();
  }
}
