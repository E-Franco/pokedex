import 'package:equatable/equatable.dart';
import 'package:flutter/painting.dart';

import '../../core/enums/pokemon_type.dart';
import 'ability.dart';
import 'stat.dart';

class PokemonEntity extends Equatable {
  const PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.abilities,
    required this.stats,
    required this.height,
    required this.weight,
    required this.types,
    required this.typeColor,
  });

  final int id;
  final String name;
  final String image;
  final List<AbilityEntity> abilities;
  final List<StatEntity> stats;
  final num height;
  final num weight;
  final List<PokemonType> types;
  final Color typeColor;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        abilities,
        stats,
        height,
        weight,
        types,
        typeColor,
      ];
}
