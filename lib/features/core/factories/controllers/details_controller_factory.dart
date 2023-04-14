import '../../../../common/domain/entities/pokemon.dart';
import '../../../presentation/controllers/value_notifier_details_controller.dart';
import '../../../presentation/pages/details/details_controller.dart';

DetailsController makeDetailsController(
  List<PokemonEntity> pokemons,
  PokemonEntity selectedPokemon,
) {
  final controller = ValueNotifierDetailsController(pokemons);
  controller.init();
  controller.selectedPokemon.value = selectedPokemon;
  return controller;
}
