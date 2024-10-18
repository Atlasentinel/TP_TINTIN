import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/widgets/album_preview.dart';
import 'package:tintin/widgets/reading_list.dart';

class AlbumsMaster extends StatefulWidget {
  final AlbumService? albumService;
  final ReadingList? lstAlbum;
  const AlbumsMaster({this.albumService, this.lstAlbum, super.key});

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: AlbumService.generateAlbums(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 30, 25, 20),
            appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 255, 65, 65),
                foregroundColor: Colors.white,
                centerTitle: true,
                title: const Text(
                  "Albums",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                )),
            body: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final album = snapshot.data![index];
                return ListTile(
                  title: AlbumPreview(album: album),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Erreur lors du chargements des albums');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
