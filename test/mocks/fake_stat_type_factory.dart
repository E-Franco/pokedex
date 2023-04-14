import 'package:pokedex/common/core/enums/stat_type.dart';
import 'package:faker/faker.dart';

class FakeStatTypeFactory{
  FakeStatTypeFactory._();

  static StatType makeOne(){
    int length = StatType.values.length;
    int randomIndex = faker.randomGenerator.integer(length);

    return StatType.values[randomIndex];
  }
}