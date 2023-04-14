import 'package:pokedex/common/core/enums/stat_type.dart';
import 'package:pokedex/common/domain/entities/stat.dart';

class StatModel extends StatEntity {
  const StatModel({
    required super.type,
    required super.value,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      type: StatTypeExt.getFromName(json['stat']['name']),
      value: json['base_stat'],
    );
  }
}
