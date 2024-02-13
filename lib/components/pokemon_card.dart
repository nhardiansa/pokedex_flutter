import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(
      {super.key, required this.pokemonId, required this.pokemonName});

  final String pokemonId;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          // width: 104,
          height: 108,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 4,
            minWidth: MediaQuery.of(context).size.width / 4,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x00000000).withOpacity(0.19),
                  offset: const Offset(0, 1),
                  blurRadius: 3,
                  spreadRadius: 1,
                )
              ]),
        ),
        Container(
          width: 104,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xffefefef),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Column(
          children: [
            Container(
              // width: 104,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 4,
                minWidth: MediaQuery.of(context).size.width / 4,
              ),
              padding: const EdgeInsets.only(top: 16, right: 8),
              child: Text(
                pokemonId,
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 8,
                    color: const Color(0xff666666),
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
            Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                width: 72,
                height: 72),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 8, right: 8),
              child: Text(
                pokemonName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    height: 1.6,
                    fontSize: 10,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
          ],
        )
      ],
    );
  }
}
