import 'package:flutter/material.dart';

import '../models/character.dart';
import '../utils/constants.dart';

class CharDetail extends StatelessWidget {
  final Results characters;
  const CharDetail({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202428),
      appBar: AppBar(
        backgroundColor: const Color(0xFF202428),
        title: Text(
          characters.name,
          style: const TextStyle(
            fontFamily: "Product-Sans",
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: Navigator.of(context).pop),
        elevation: 0.0,
        // centerTitle: true,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width - 30,
            margin: const EdgeInsets.only(top: 110, left: 15.0),
            child: Card(
              color: const Color(0xFF3B3F43),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        characters.name.toUpperCase(),
                        style: detailName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FilterChip(
                        onSelected: (a) {},
                        label: Row(
                          children: <Widget>[
                            characters.status == "Alive" ? alive : dead,
                            const SizedBox(width: 6),
                            Text(
                              "${characters.status} - ${characters.species}",
                              style: bp24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: <Widget>[
                        Text("Gender: ", style: gp24),
                        Text(characters.gender, style: wp24),
                      ],
                    ),
                  ),
                  characters.origin.name.length > 28
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Origin: ", style: gp24),
                              Text(characters.origin.name, style: wp24),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 29.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Origin: ", style: gp24),
                              Text(characters.origin.name, style: wp24),
                            ],
                          ),
                        ),
                  characters.location.name.length > 25
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Location: ", style: gp24),
                              Text(characters.location.name, style: wp24),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Location: ", style: gp24),
                              Text(characters.location.name, style: wp24),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          Hero(
            tag: characters.image,
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 115),
              height: 200.0,
              width: 200.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(characters.image),
              ),
            ),
          ),
        ],
      );
}
