import 'package:flutter_test/flutter_test.dart';
import 'package:dictionary_frontend/src/models/dictionary_models.dart';

void main() {
  test('DictionaryEntry.listFromJson parses valid response', () {
    const sample = '''
    [
      {
        "word": "ocean",
        "phonetic": "/ˈəʊʃ(ə)n/",
        "phonetics": [{"text": "/ˈəʊʃ(ə)n/", "audio": ""}],
        "meanings": [
          {
            "partOfSpeech": "noun",
            "definitions": [
              {"definition": "A very large expanse of sea.", "example": "the Atlantic Ocean"}
            ]
          }
        ]
      }
    ]
    ''';

    final entries = DictionaryEntry.listFromJson(sample);
    expect(entries.length, 1);
    final e = entries.first;
    expect(e.word, 'ocean');
    expect(e.phonetic, isNotNull);
    expect(e.phonetics.length, 1);
    expect(e.meanings.length, 1);
    expect(e.meanings.first.partOfSpeech, 'noun');
    expect(e.meanings.first.definitions.first.definition, isNotEmpty);
    expect(e.meanings.first.definitions.first.example, isNotNull);
  });

  test('DictionaryEntry.listFromJson handles empty list', () {
    const sample = '[]';
    final entries = DictionaryEntry.listFromJson(sample);
    expect(entries, isEmpty);
  });
}
