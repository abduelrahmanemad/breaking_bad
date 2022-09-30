import 'package:breaking_bad/data/api/characters_dio.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/repo/characters_repo.dart';
import 'package:breaking_bad/logic/characters_cubit.dart';
import 'package:breaking_bad/presentation/screens/characters_details.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'const/strings.dart';

class AppRouter{

  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter(){
    charactersRepository=CharactersRepository(CharactersDio());
    charactersCubit=CharactersCubit(charactersRepository);

  }

  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context)=>charactersCubit,
              child: const CharactersScreen(),
          ) ,
        );

      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharactersDetailsScreen(character: character ),
        );
    }
    return null;
  }
}