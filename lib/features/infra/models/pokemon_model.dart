import 'package:pokedex/common/domain/entities/pokemon.dart';
import 'package:pokedex/features/infra/models/ability_model.dart';
import 'package:pokedex/features/infra/models/stat_model.dart';

import '../../../common/core/enums/pokemon_type.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.image,
    required super.abilities,
    required super.stats,
    required super.height,
    required super.weight,
    required super.types,
    required super.typeColor,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<PokemonType> types = json['types'].map<PokemonType>((e) => PokemonTypeExt.getFromName(e['type']['name'])).toList();

    return PokemonModel(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['other']['official-artwork']['front_default'],
      abilities: json['abilities'].map<AbilityModel>((e) => AbilityModel.fromJson(e)).toList(),
      stats: json['stats'].map<StatModel>((e) => StatModel.fromJson(e)).toList(),
      height: (json['height'] / 10),
      weight: json['weight'] / 10,
      types: types,
      typeColor: types.first.getColor(),
    );
  }
}
