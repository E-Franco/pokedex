import 'package:equatable/equatable.dart';
import 'package:pokedex/common/core/enums/stat_type.dart';

class StatEntity extends Equatable {
  const StatEntity({
    required this.type,
    required this.value,
  });

  final StatType type;
  final num value;

  

  @override
  List<Object?> get props => [type, value];
}
