import 'package:flutter/material.dart';

import '../../../../../common/core/enums/pokemon_type.dart';
import '../../../../../common/core/extensions/extensions.dart';

class DetailsPokemonTypePill extends StatelessWidget {
  const DetailsPokemonTypePill({
    super.key,
    required this.type,
  });

  final PokemonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: type.getColor(),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Text(
        type.name.capitalize(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
