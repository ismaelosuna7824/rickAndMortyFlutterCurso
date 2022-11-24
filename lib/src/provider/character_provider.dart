import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/character.dart';

const baseUrl = "https://rickandmortyapi.com/api/character";

class ApiCharacter {
  static Future<Character> getCharacter() async {
    var url = baseUrl;
    final response = await http.get(Uri.parse(url));
    final characterResponse = jsonDecode(response.body);
    return Character.fromJson(characterResponse);
  }
  // static Future createUser(User user) async {
  //   Map data = {"id": user.id, "name": user.name, "lastname": user.lastname};

  //   var url = baseUrl + "/save";
  //   return await http.post(Uri.parse(url),
  //       body: json.encode(data), headers: {"Content-Type": "application/json"});
  // }

  // static Future updateUser(User user) async {
  //   var url = baseUrl + "/update";
  //   Map data = {"id": user.id, "name": user.name, "lastname": user.lastname};
  //   return await http.put(Uri.parse(url),
  //       body: json.encode(data), headers: {"Content-Type": "application/json"});
  // }

  // static Future deleteUser(parametes) async {
  //   var url = baseUrl + "/delete";
  //   return await http.delete(Uri.parse(url),
  //       body: parametes, headers: {"Content-Type": "application/json"});
  // }
}
