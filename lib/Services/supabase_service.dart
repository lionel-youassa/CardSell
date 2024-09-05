

// Get a reference your Supabase client
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;



void uploadImage(File) async {
  final file = File; // Ton fichier local
  final fullPath = await supabase.storage.from('images').upload(
    'images/voitures',
    file,
    fileOptions: const FileOptions(
      cacheControl: '3600', // Contrôle du cache
      upsert: false, // Si le fichier existe déjà, ne pas le mettre à jour
    ),
  );
}
   
void insertCar(String nameControler, String categorieControler, String marqueControler, int prixControler) async {
  try {
    await supabase.from('voiture').insert({
      'nom': nameControler,
      'catégorie': categorieControler,
      'marque': marqueControler,
      'prix': prixControler,
      'image': 'BMW'
    });
    print('Voiture insérée avec succès !');
  } catch (e) {
    print('Erreur lors de l\'insertion de la voiture : $e');
    // Gérez l'erreur ici (par exemple, affichez un message à l'utilisateur)
  }
}

