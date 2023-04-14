import 'package:flutter/material.dart';
import 'package:pokedex/common/core/extensions/extensions.dart';

import '../../../../../common/domain/entities/pokemon.dart';

class DetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  const DetailsAppBar({
    super.key,
    required this.pokemon,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        pokemon.name.capitalize(),
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          alignment: FractionalOffset.center,
          child: Text(
            '#${pokemon.id.toString().padLeft(3, '0')}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
