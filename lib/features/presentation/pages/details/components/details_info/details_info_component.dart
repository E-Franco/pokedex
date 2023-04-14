import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/core/contants/constants.dart';
import '../../../../../../common/core/extensions/extensions.dart';
import '../../../../../../common/domain/entities/ability.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailsInfoItem(
            info: Labels.weight,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: moves()
                  .map((e) => Text(
                        e.name.capitalize(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<AbilityEntity> moves() {
    // Function to display only 2 moves from pokémon
    List<AbilityEntity> moves = [];
    if (pokemon.abilities.length > 2) {
      moves = pokemon.abilities.sublist(0, 2);
    } else {
      moves = pokemon.abilities;
    }

    return moves;
  }
}
