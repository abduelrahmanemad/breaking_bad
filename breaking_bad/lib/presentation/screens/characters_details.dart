// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:breaking_bad/const/my_colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget{
  final Character character;
  const CharactersDetailsScreen({super.key,required this.character});

  Widget buildSliverAppbar(){
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
            tag: character.charId,
            child: Image.network(character.img,fit: BoxFit.cover,)
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppbar(),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        characterInfo('Job : ', character.occupation.join(' / ')),
                        buildDivider(315),
                        characterInfo('Category : ', character.category),
                        buildDivider(250),
                        characterInfo('Seasons : ', character.appearance.join(' / ')),
                        buildDivider(280),
                        characterInfo('Status : ', character.status),
                        buildDivider(250),
                        character.better_call_saul_appearance.isEmpty?Container():characterInfo('Better call saul Seasons : ', character.better_call_saul_appearance.join(' / ')),
                        character.better_call_saul_appearance.isEmpty?Container():buildDivider(280),
                        characterInfo('Actor/Actress : ', character.portrayed),
                        buildDivider(250),
                      ],
                    ),
                  ),
                  const SizedBox(height: 500,)
                ]
              )
          ),
        ],
      ),
    );
  }
}