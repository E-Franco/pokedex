import 'package:flutter/material.dart';
import 'package:pokedex/common/core/contants/colors.dart';
import 'package:pokedex/common/domain/entities/pokemon.dart';

class DetailsStatBarsComponent extends StatelessWidget {
  const DetailsStatBarsComponent({
    super.key,
    required this.pokemon,
  });
  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: pokemon.stats
            .map((e) => SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Text(
                          e.type.name.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: pokemon.typeColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        color: AppColors.mediumGray,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Text(e.value.toString().padLeft(3, '0')),
                      const SizedBox(width: 12),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: (e.value / 2) / 100,
                          minHeight: 6,
                          valueColor: AlwaysStoppedAnimation<Color>(pokemon.typeColor),
                          backgroundColor: pokemon.typeColor.withOpacity(.2),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
