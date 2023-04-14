import 'package:flutter/material.dart';

import '../../../../../../common/core/contants/constants.dart';
import '../../../../../common/presentation/helpers/helpers.dart';
import '../../../../../service_locator.dart';
import '../home_controller.dart';
import 'home_loading_widget.dart';
import 'home_pokemon_card.dart';
import 'home_try_again_component.dart';

class HomePokemonList extends StatefulWidget {
  const HomePokemonList({super.key});

  @override
  State<HomePokemonList> createState() => _HomePokemonListState();
}

class _HomePokemonListState extends State<HomePokemonList> {
  late ScrollController scrollController;
  final homeController = serviceLocator.get<HomeController>();

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      final position = scrollController.position;
      if (position.atEdge && position.pixels != 0) {
        homeController.fetchPokemons();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ValueListenableBuilder(
        valueListenable: homeController.state,
        builder: (context, value, child) {
          if (value == UIState.success || value == UIState.loadingMore) {
            final pokemons = homeController.pokemons.value;
            bool isLoadingMore = value == UIState.loadingMore;

            return GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: pokemons.length + (isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                // Check if need a loading widget
                if (index == pokemons.length) {
                  return const HomeLoadingComponent();
                }

                return HomePokemonCard(pokemon: pokemons[index]);
              },
            );
          } else if (value == UIState.error) {
            return const HomeTryAgainComponent();
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
    );
  }
}
