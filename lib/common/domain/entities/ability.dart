import 'package:equatable/equatable.dart';

class AbilityEntity extends Equatable{
  const AbilityEntity({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [name];
}
