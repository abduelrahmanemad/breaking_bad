import 'package:breaking_bad/const/my_colors.dart';
import 'package:flutter/material.dart';

import '../../const/strings.dart';
import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget{
  final Character character ;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, charactersDetailsScreen,arguments: character);
        },
        child: GridTile(
          footer: Hero(
            tag: character.charId,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                 style: const TextStyle(
                   height: 1.3,
                   fontSize: 16,
                   color: MyColors.myWhite,
                   fontWeight: FontWeight.bold
                 ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: character.img!='' ?
            FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: 'assets/images/loading.gif',
                image: character.img
            ) :
            Container(
              color: MyColors.myGrey,
            ) ,
          ),
        ),
      ),
    );
  }

}