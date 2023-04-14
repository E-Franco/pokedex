enum StatType {
  hp,
  atk,
  def,
  satk,
  sdef,
  spd,
  unknow,
}

extension StatTypeExt on StatType {
  static StatType getFromName(String name) {
    switch (name) {
      case 'hp':
        return StatType.hp;
      case 'attack':
        return StatType.atk;
      case 'defense':
        return StatType.def;
      case 'special-attack':
        return StatType.satk;
      case 'special-defense':
        return StatType.sdef;
      case 'speed':
        return StatType.spd;
      default:
        return StatType.unknow;
    }
  }
}
