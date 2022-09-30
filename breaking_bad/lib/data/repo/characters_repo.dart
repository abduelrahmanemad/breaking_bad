
import 'package:breaking_bad/data/api/characters_dio.dart';
import 'package:breaking_bad/data/models/characters.dart';

class CharactersRepository {
  final CharactersDio charactersDio;
  CharactersRepository(this.charactersDio);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersDio.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}