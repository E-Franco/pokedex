import 'package:faker/faker.dart';
import 'package:pokedex/common/domain/entities/ability.dart';

class FakeAbilityFactory {
  FakeAbilityFactory._();

  static AbilityEntity makeOne() => AbilityEntity(name: faker.lorem.word());

  static List<AbilityEntity> makeMultiple(int length) {
    return List.generate(
      length,
      (_) => makeOne(),
    );
  }
}
