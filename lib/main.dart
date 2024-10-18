import 'package:flutter/material.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/screens/albums_master.dart';
import 'package:tintin/widgets/reading_list.dart';
import 'package:provider/provider.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final readingList = ReadingList();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: readingList),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ma Collection d\'Albums', 
      home: AlbumsMaster(albumService: AlbumService()),
    );
  }
}
