import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/common/core/extensions/string_extension.dart';

void main() {
  late String sentence;
  late String capitalizedSentence;

  late String word;
  late String capitalizedWord;

  setUp(() {
    sentence = 'lorem ipsum dolor sit amet, consectetur adipiscing elit.';
    capitalizedSentence = 'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit.';

    word = 'pokédex';
    capitalizedWord = 'Pokédex';
  });

  test(
    'Test capitalize method',
    () {
      String result = word.capitalize();
      expect(result, isA<String>());
      expect(result, capitalizedWord);
    },
  );

  test(
    'Test capitalize method with empty String',
    () {
      String result = ''.capitalize();
      expect(result, isA<String>());
      expect(result, isEmpty);
    },
  );

  test(
    'Test capitalize method with a single character',
    () {
      String result = 'a'.capitalize();
      expect(result, isA<String>());
      expect(result.length, 1);
      expect(result, 'A');
    },
  );

  test(
    'Test capitalize method with symbols',
    () {
      String symbols = '`/~--++';
      String result = symbols.capitalize();
      expect(result, isA<String>());
      expect(result, symbols);
    },
  );

  test(
    'Test upperCaseWords',
    () {
      String result = sentence.upperCaseWords();
      expect(result, isA<String>());
      expect(result, capitalizedSentence);
    },
  );

  test(
    'Test upperCaseWords with empty String',
    () {
      String result = ''.upperCaseWords();
      expect(result, isA<String>());
      expect(result, '');
    },
  );

  test(
    'Test upperCaseWords with single word',
    () {
      String result = word.upperCaseWords();
      expect(result, isA<String>());
      expect(result, capitalizedWord);
    },
  );
}
