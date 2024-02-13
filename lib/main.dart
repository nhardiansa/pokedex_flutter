import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_flutter/components/pokemon_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // textTheme: GoogleFonts.poppinsTextTheme()
      ),
      home: const MyHomePage(
        title: 'Hello World',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  List<Widget> generateDummyList(int length, Widget component) =>
      List.generate(length, (index) => component);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffDC0A2D),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/pokeball.svg',
                              semanticsLabel: 'Pokedex Icon',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              'Pokédex',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 1.1,
                                  minWidth:
                                      MediaQuery.of(context).size.width / 1.1),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: TextField(
                                onSubmitted: (value) {
                                  log(value);
                                },
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 11.0),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 12),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 1,
                        minWidth: MediaQuery.of(context).size.width / 1),
                    // color: Colors.white,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: GridView.count(
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      childAspectRatio: 1 / 1,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: generateDummyList(
                          12,
                          const PokemonCard(
                              pokemonId: '#123', pokemonName: 'Bulbasaur')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
