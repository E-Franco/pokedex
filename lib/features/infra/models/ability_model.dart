import 'package:pokedex/common/domain/entities/ability.dart';

class AbilityModel extends AbilityEntity{
  const AbilityModel({required super.name});

  factory AbilityModel.fromJson(Map<String, dynamic> json){
    return AbilityModel(name: json['ability']['name']);
  }
}