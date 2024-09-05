import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cardsell/parts/Arrival.dart';
import 'package:cardsell/parts/buttonprofil.dart';
import 'package:cardsell/parts/ButtonRound.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("CarSell"),
        ),
        elevation: 10,
        actions: [
          ButtonProfile(
            imageUrl:
                "https://previews.123rf.com/images/jemastock/jemastock1712/jemastock171207459/91868647-profil-de-jeune-femme-dessin-anim%C3%A9-ic%C3%B4ne-vector-illustration-graphisme.jpg",
            onTap: () {
              if (kDebugMode) {
                print('Cercle cliqué !');
              }
            },
            width: 40.0,
            height: 40.0,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
              labelText: 'Recherche',
              hintText: 'Recherchez vos voitures ',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50.0, left: 20.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop by category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                Chopcategory(),
                SizedBox(height: 30),
                Text(
                  'Newest Arrival',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 30),
                NewArrival(),
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        elevation: 30,
        child: ListView(
          children: [
            const DrawerHeader(
                child: Text(
              "Menu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            )),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add car",style: TextStyle( fontSize: 20)),
              onTap: () {
                Navigator.pushNamed(context, '/AddCar');
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(destinations: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/MaketPlace');
            },
            icon: const Icon(Icons.shop)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.supervised_user_circle)),
      ]),
    );
  }
}

class Chopcategory extends StatelessWidget {
  const Chopcategory({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> categorys = {
      "SuperCar":
          "https://img.freepik.com/vecteurs-libre/voiture-sport-bleue-isolee-vecteur-blanc_53876-67354.jpg",
      "SUV": "https://www.cargo.fr/Content/images/cars/citadine.png",
      "Berlin":
          "https://e7.pngegg.com/pngimages/291/917/png-clipart-car-car-white.png",
      "Van":
          "https://w7.pngwing.com/pngs/66/808/png-transparent-compact-van-mercedes-benz-car-mercedes-thumbnail.png"
    };
    return Row(
      children: categorys.entries.map((category) {
        return Expanded(
            child: Column(
          children: [
            ButtonRound(
              imageUrl: category.value,
              onTap: () {
                if (kDebugMode) {
                  print('Cercle cliqué !');
                }
              },
              width: 60.0,
              height: 60.0,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              category.key,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 30),
          ],
        ));
      }).toList(),
    );
  }
}

class NewArrival extends StatefulWidget {
  const NewArrival({super.key});

  @override
  State<NewArrival> createState() {
    return NewArrivalState();
  }
}

class NewArrivalState extends State<NewArrival> {
  List<Arrival> arrivals = [
    Arrival(
        nom: "Benz",
        prix: "\$120.00",
        etoile: 3,
        image:
            "https://w7.pngwing.com/pngs/201/492/png-transparent-mercedes-benz-a-class-car-mercedes-benz-c-class-mercedes-benz-e-class-mercedes-a180-compact-car-sedan-car.png"),
    Arrival(
        nom: "Bugatti",
        prix: "\$250.00",
        etoile: 3,
        image:
            "https://w7.pngwing.com/pngs/98/910/png-transparent-2011-bugatti-veyron-bugatti-eb-110-bugatti-chiron-bugatti-computer-wallpaper-car-performance-car.png"),
    Arrival(
        nom: "Toyota",
        prix: "\$120.00",
        etoile: 3,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaW0G8Vts8cD1ngevVNL7Pjzbdg_w-IkdwEg&s"),
    Arrival(
        nom: "Range Rover",
        prix: "\$120.00",
        etoile: 3,
        image:
            "https://w7.pngwing.com/pngs/228/771/png-transparent-range-rover-sport-land-rover-car-range-rover-evoque-rover-company-land-rover-vehicle-transport-range-rover-autobiography.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Nombre de colonnes
        mainAxisSpacing: 10, // Espacement vertical entre les éléments
        crossAxisSpacing: 10, // Espacement horizontal entre les éléments
      ),
      itemCount: arrivals.length,
      itemBuilder: (context, index) {
        return arrivals[index];
      },
    );
  }

  /* Row(
  children: arrivals.map((arrival){
  return arrival;
  }).toList(),
  );
*/
}
