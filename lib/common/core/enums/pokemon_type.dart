import 'package:flutter/painting.dart';
import 'package:pokedex/common/core/contants/constants.dart';

enum PokemonType {
  grass,
  fire,
  water,
  bug,
  eletric,
  ghost,
  normal,
  psychic,
  steel,
  poison,
  flying,
  rock,
  unknow,
}

extension PokemonTypeExt on PokemonType {
  static PokemonType getFromName(String name) {
    switch (name) {
      case 'grass':
        return PokemonType.grass;
      case 'fire':
        return PokemonType.fire;
      case 'water':
        return PokemonType.water;
      case 'bug':
        return PokemonType.bug;
      case 'eletric':
        return PokemonType.eletric;
      case 'ghost':
        return PokemonType.ghost;
      case 'normal':
        return PokemonType.normal;
      case 'psychic':
        return PokemonType.psychic;
      case 'steel':
        return PokemonType.steel;
      case 'rock':
        return PokemonType.rock;
      case 'flying':
        return PokemonType.flying;
      case 'poison':
        return PokemonType.poison;
      default:
        return PokemonType.unknow;
    }
  }

  Color getColor() {
    switch (this) {
      case PokemonType.grass:
        return const Color(0xFF74CB48);
      case PokemonType.fire:
        return const Color(0xFFF57D31);
      case PokemonType.water:
        return const Color(0xFF6493EB);
      case PokemonType.bug:
        return const Color(0xFFA7B723);
      case PokemonType.eletric:
        return const Color(0xFFF9CF30);
      case PokemonType.ghost:
        return const Color(0xFF70559B);
      case PokemonType.normal:
        return const Color(0xFFAAA67F);
      case PokemonType.psychic:
        return const Color(0xFFFB5584);
      case PokemonType.steel:
        return const Color(0xFFB7B9D0);
      case PokemonType.poison:
        return const Color(0xFFA43E9E);
      case PokemonType.flying:
        return const Color(0xFFA891EC);
      case PokemonType.rock:
        return const Color(0xFFB69E31);
      case PokemonType.unknow:
        return AppColors.primary;
    }
  }
}
