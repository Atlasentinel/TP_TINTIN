import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/widgets/reading_list.dart';


class AlbumDetails extends StatelessWidget {
  final Album album;

  const AlbumDetails({required this.album, super.key});

  @override
  Widget build(BuildContext context) {
    // Accéder à ReadingList via Provider
    final readingList = Provider.of<ReadingList>(context);
    bool isInList = readingList.isInList(album);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 16, 12),
      appBar: AppBar(
        title: Text(album.title + (isInList ? " est dans votre liste de lecture " : " n'est pas dans votre liste de lecture")),
        backgroundColor: const Color.fromARGB(255, 255, 65, 65),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Album: ${album.numero}',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(
              width: 950,
              child: Text(
                "Resume: ${album.resume}",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Text(
              'Année de parution: ${album.year}',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              'Année de parution en couleur: ${album.yearInColor}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            album.image.isNotEmpty
                ? Image.asset(
                    "images/${album.image}",
                    width: 170,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image_not_supported, color: Colors.white),
            Text(
              'Release Date: ${album.yearInColor}',
              style: const TextStyle(color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: () {
                if (isInList) {
                  readingList.removeAlbum(album);
                } else {
                  readingList.addAlbum(album);
                }
              },
              tooltip: readingList.isInList(album)
                  ? 'Retirer de la liste de lecture'
                  : 'Ajouter à la liste de lecture',
              backgroundColor: !isInList ?const Color.fromARGB(255, 243, 33, 96) : const Color.fromARGB(255, 94, 94, 94),
              foregroundColor: Colors.white,
              child: Icon(
                isInList
                    ? Icons.bookmark_remove_outlined
                    : Icons.bookmark_add_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
