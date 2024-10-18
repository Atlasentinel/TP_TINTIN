import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/screens/albums_details.dart';
import 'package:tintin/widgets/reading_list.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({required this.album, super.key});

  @override
  Widget build(BuildContext context) {
    final readingList = Provider.of<ReadingList>(context);
    bool isInList = readingList.isInList(album);

    return Card(
      color: const Color.fromARGB(255, 19, 16, 12),
      elevation: 5.0,
      shadowColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.75),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(
          album.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          'Album No: ${album.numero}',
          style: const TextStyle(
            color: Color.fromARGB(255, 74, 107, 255),
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage("images/${album.image}"),
        ),
        trailing: RawMaterialButton(
          onPressed: () {
            readingList.toggleInList(album);
          },
          elevation: 0.5,
          fillColor: const Color.fromARGB(0, 255, 255, 255),
          shape: const CircleBorder(),
          child: Icon(
            isInList ? Icons.bookmark_remove_outlined : Icons.bookmark_add,
            color: !isInList
                ? const Color.fromARGB(255, 243, 33, 96)
                : const Color.fromARGB(255, 94, 94, 94),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetails(album: album),
            ),
          );
        },
      ),
    );
  }
}
