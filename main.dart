typedef ListOfString = List<String>;
typedef MapOfString = Map<String, String>;

class Dictionary {
  late Map<String, String> words;

  Dictionary() {
    words = {};
  }

  add(String term, String definition) {
    words[term] = definition;
  }

  get(String term) {
    return words[term];
  }

  delete(String term) {
    words.remove(term);
  }

  update(String term, String definition) {
    if (words.containsKey(term)) {
      words[term] = definition;
    }
  }

  showAll() {
    words.forEach((term, definition) {
      print('$term: $definition');
    });
  }

  int count() {
    return words.length;
  }

  upsert(String term, String definition) {
    words[term] = definition;
  }

  exists(String term) {
    print(words.containsKey(term));
  }

  bulkAdd(List<MapOfString> entries) {
    entries.forEach((entry) {
      final term = entry['term'];
      final definition = entry['definition'];
      if (term != null && definition != null) {
        add(term, definition);
      }
    });
  }

  bulkDelete(ListOfString terms) {
    terms.forEach(delete);
  }
}

void main() {
  Dictionary myDictionary = Dictionary();
  myDictionary.add('apple', '사과');
  myDictionary.add('banana', '바나나');
  myDictionary.add('cherry', '체리');

  print(myDictionary.get('apple'));

  myDictionary.update('apple', '맛있는 사과');
  myDictionary.upsert('banana', '노란 바나나');
  myDictionary.upsert('cat', '고양이');

  myDictionary.showAll();
  print(myDictionary.count());
  myDictionary.exists('appl');

  myDictionary.bulkAdd([
    {"term": "dog", "definition": "강아지"},
    {"term": "kimchi", "definition": "김치"},
  ]);
  myDictionary.showAll();
  myDictionary.bulkDelete([
    'apple',
    'cherry',
  ]);
  myDictionary.showAll();
}
