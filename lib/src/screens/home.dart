import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/provider/character_provider.dart';

import '../models/character.dart';
import '../utils/constants.dart';
import 'character_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Character characters;
  late bool _isLoading = true;
  _getCharacter() async {
    characters = await ApiCharacter.getCharacter();
    _isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    _isLoading = true;
    _getCharacter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(backgroundColor: Colors.blue))
            : ListView.builder(
                itemCount: characters.results.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharDetail(
                              characters: characters.results[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 150.0,
                            margin: const EdgeInsets.only(left: 46.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B3F43),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(
                                  105.0, 16.0, 16.0, 16.0),
                              constraints: const BoxConstraints.expand(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    characters.results[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: "Product-Sans",
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      characters.results[index].status ==
                                              "Alive"
                                          ? Container(
                                              height: 12,
                                              width: 12,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            )
                                          : Container(
                                              height: 12,
                                              width: 12,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                      const SizedBox(width: 5),
                                      Text(
                                          "${characters.results[index].status} - ${characters.results[index].species}",
                                          style: wp14),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text("Origin:", style: originText),
                                  const SizedBox(height: 5.0),
                                  Expanded(
                                    child: Text(
                                        characters.results[index].origin.name,
                                        style: originName),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: FractionalOffset.centerLeft,
                            child: Hero(
                              tag: characters.results[index].image,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                  characters.results[index].image,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
