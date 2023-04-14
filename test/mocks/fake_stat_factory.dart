import 'package:faker/faker.dart';
import 'package:pokedex/common/domain/entities/stat.dart';

import 'fake_stat_type_factory.dart';

class FakeStatFactory {
  FakeStatFactory._();

  static StatEntity makeOne() {
    return StatEntity(
      type: FakeStatTypeFactory.makeOne(),
      value: faker.randomGenerator.integer(100),
    );
  }

  static List<StatEntity> makeMultiple(int length) {
    return List.generate(
      length,
      (_) => makeOne(),
    );
  }
}
