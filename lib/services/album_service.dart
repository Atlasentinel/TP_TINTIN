import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tintin/models/album.dart';

class AlbumService {
  const AlbumService();

  static Future<List<Album>> generateAlbums() async {
    await Future.delayed(const Duration(seconds: 2));
    final String response =
        await rootBundle.loadString('data/albums-tintin.json');
    final List<dynamic> data = json.decode(response);

    List<Album> albums = data.map((json) => Album.fromJson(json)).toList();
    return albums;
  }

  static Future<List<Album>> fetchAlbums() async {
    final String response =
        await rootBundle.loadString('data/albums-tintin.json');
    final List<dynamic> data = json.decode(response);

    List<Album> albums = data.map((json) => Album.fromJson(json)).toList();
    return albums;
  }
}
