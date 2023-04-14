import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../common/domain/entities/pokemon.dart';
import '../../../common/presentation/helpers/ui_state.dart';
import '../../domain/usecases/get_pokemon_by_name_usecase.dart';
import '../../domain/usecases/get_pokemons_usecase.dart';
import '../pages/home/home_controller.dart';

class ValueNotifierHomeController implements HomeController {
  ValueNotifierHomeController({
    required this.getPokemons,
    required this.getPokemonByName,
  });

  final GetPokemonsUsecase getPokemons;
  final GetPokemonByNameUsecase getPokemonByName;

  @override
  late ValueNotifier<UIState> state;

  @override
  late ValueNotifier<List<PokemonEntity>> pokemons;

  late int offset;

  @override
  void init() {
    state = ValueNotifier(UIState.initial);
    pokemons = ValueNotifier([]);
    offset = 0;
    fetchPokemons();
  }

  @override
  Future<void> fetchPokemons() async {
    if (offset != 0) {
      state.value = UIState.loadingMore;
    } else {
      state.value = UIState.loading;
    }

    final params = GetPokemonsParams(offset: offset);
    final pokemonsEither = await getPokemons(params);
    if (pokemonsEither.isLeft()) {
      state.value = UIState.error;
      return;
    } else {
      final result = pokemonsEither.fold(id, id);

      List<Future> futures = [];
      for (String name in result as List<String>) {
        final future = getPokemonByName(name).then((r) {
          if (r.isLeft()) {
            state.value = UIState.error;
            return;
          } else {
            final pokemon = r.fold(id, id) as PokemonEntity;
            pokemons.value.add(pokemon);
          }
        });

        futures.add(future);
      }

      await Future.wait(futures);
      offset += pokemons.value.length;
      state.value = UIState.success;
    }
  }

  @override
  void dispose() {
    state.dispose();
    pokemons.dispose();
  }

  
}
