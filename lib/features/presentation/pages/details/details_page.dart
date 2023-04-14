import 'package:flutter/material.dart';

import '../../../../../common/core/contants/constants.dart';
import 'components/details_app_bar.dart';
import 'components/details_info/details_info_component.dart';
import 'components/details_pokeball_component.dart';
import 'components/details_pokemon_type_pill.dart';
import 'components/details_portrait_component.dart';
import 'components/details_stat_bars_component.dart';
import 'details_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.controller,
  });

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.selectedPokemon,
      builder: (context, value, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: DetailsAppBar(pokemon: value!),
          backgroundColor: controller.selectedPokemon.value!.typeColor,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8 + MediaQuery.of(context).viewPadding.top,
                      right: 8,
                    ),
                    child: const DetailsPokeballComponent(),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: value.types.map<Widget>((e) => DetailsPokemonTypePill(type: e)).toList(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          Labels.about,
                          style: TextStyle(
                            color: value.typeColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        DetailsInfoComponent(pokemon: value),
                        const SizedBox(height: 20),
                        Text(
                          Labels.baseStats,
                          style: TextStyle(
                            color: value.typeColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        DetailsStatBarsComponent(pokemon: value),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.6,
                child: DetailsPortraitComponent(
                  pokemon: value,
                  onNextPressed: controller.nextPokemon,
                  onPreviousPressed: controller.previousPokemon,
                  isFirst: controller.isFirst(),
                  isLast: controller.isLast(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
