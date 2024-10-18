import 'gps.dart';

class Album {
  final String title;
  final int numero;
  final int year;
  final int? yearInColor;
  final String image;
  final String resume;
  final Gps gps;
  final String location;

  Album({
    required this.title,
    required this.numero,
    required this.year,
    this.yearInColor,
    required this.image,
    required this.resume,
    required this.gps,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'titre': title,
      'numero': numero,
      'resume': resume,
      'parution': year,
      'parutionEnCouleur': yearInColor,
      'gps': '${gps.latitude},${gps.longitude}',
      'image': image,
      'lieu': location,
    };
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    final gpsString = json['gps']?.toString() ?? '';
    final coordinates = gpsString.isNotEmpty ? gpsString.split(',') : ['0', '0'];

    return Album(
      title: json['titre'] ?? 'Unknown Title',
      numero: json['numero'] ?? 0,
      year: json['parution'] ?? 0,
      yearInColor: json['parutionEnCouleur'],
      image: json['image'] ?? '',
      resume: json['resume'] ?? '',
      gps: Gps(
        coordinates.length == 2 ? double.parse(coordinates[0]) : 0.0,
        coordinates.length == 2 ? double.parse(coordinates[1]) : 0.0,
      ),
      location: json['lieu'] ?? '',
    );
  }
}
