import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Services/supabase_service.dart';


class Addcar extends StatefulWidget {
  const Addcar({super.key});

  @override
  State<Addcar> createState() {
    return StateAddcar();
  }
}

class StateAddcar extends State<Addcar> {
  final _Formkey = GlobalKey<FormState>();
  final nameControler = TextEditingController();
  final marqueControler = TextEditingController();
  final categorieControler = TextEditingController();
  final prixControler = TextEditingController();
  final imageControler = TextEditingController();



  Uint8List? _image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameControler.dispose();
    marqueControler.dispose();
    categorieControler.dispose();
    prixControler.dispose();
    imageControler.dispose();
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No images selected");
  }

  void SelectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add car",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 10,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _Formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Name of car",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "veuillez remplire correctement le champs";
                    } else {
                      return null;
                    }
                  },
                  controller: nameControler,
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Marque",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "veuillez remplire correctement le champs";
                    } else {
                      return null;
                    }
                  },
                  controller: marqueControler,
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Categorie",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "veuillez remplire correctement le champs";
                    } else {
                      return null;
                    }
                  },
                  controller: categorieControler,
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Prix",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "veuillez remplire correctement le champs";
                    } else {
                      return null;
                    }
                  },
                  controller: prixControler,
                ),
                const SizedBox(
                  height: 13,
                ),
                Stack(
                  children: [
                    if (_image != null)
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 69,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: MemoryImage(_image!),
                            fit: BoxFit.cover,
                          )),
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 69,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/474x/ab/05/b0/ab05b0308c3bc435384bff9d6338ba51.jpg'),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    Positioned(
                      bottom: -13,
                      left: 356,
                      child: IconButton(
                          onPressed: SelectImage,
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 30,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_Formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Soumission en cours ...")));
                          FocusScope.of(context).requestFocus(FocusNode());
                          await supabase.from('voiture').insert({
                            'nom': nameControler.text,
                            'catégorie': categorieControler.text,
                            'marque': marqueControler.text,
                            'prix': double.parse(prixControler.text),
                            'image': 'BMW'
                          });

                          insertCar( nameControler.text ,  categorieControler.text,   marqueControler.text,  int.parse(prixControler.text) );
                          uploadImage(_image);
                        }
                      },
                      child: const Text(
                        "Soumettre",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
