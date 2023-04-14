import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/common/core/extensions/extensions.dart';

import '../../../../../../common/core/contants/constants.dart';
import '../../../../../../common/domain/entities/pokemon.dart';
import 'details_info_item.dart';

class DetailsInfoComponent extends StatelessWidget {
  const DetailsInfoComponent({
    super.key,
    required this.pokemon,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailsInfoItem(
            info: Labels.weight,
            content: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.weight,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 12),
                Text(
                  '${pokemon.weight}kg',
                  // style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Theme.of(context).dividerColor),
          DetailsInfoItem(
            info: Labels.height,
            content: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.height,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 12),
                Text(
                  '${pokemon.height}',
                  // style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Theme.of(context).dividerColor),
          DetailsInfoItem(
            info: Labels.moves,
            content: Column(
              children: pokemon.abilities.map((e) => Text(e.name.capitalize())).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
