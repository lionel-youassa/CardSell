import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cardsell/parts/Arrival.dart';
import 'package:cardsell/Modele/commande.dart';

class MaketPlace extends StatefulWidget {
  const MaketPlace({super.key});

  @override
  State<MaketPlace> createState() {
    return MaketPlaceState();
  }
}

class MaketPlaceState extends State<MaketPlace> {
  List<ArrivalRow> arrivals = [
    ArrivalRow(
        nom: "Benz",
        prix: "\$120.00",
        etoile: 3,
        image:
        "https://w7.pngwing.com/pngs/201/492/png-transparent-mercedes-benz-a-class-car-mercedes-benz-c-class-mercedes-benz-e-class-mercedes-a180-compact-car-sedan-car.png"),
    ArrivalRow(
        nom: "Bugatti",
        prix: "\$250.00",
        etoile: 3,
        image:
        "https://w7.pngwing.com/pngs/98/910/png-transparent-2011-bugatti-veyron-bugatti-eb-110-bugatti-chiron-bugatti-computer-wallpaper-car-performance-car.png"),
    ArrivalRow(
        nom: "Toyota",
        prix: "\$120.00",
        etoile: 3,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaW0G8Vts8cD1ngevVNL7Pjzbdg_w-IkdwEg&s"),
    ArrivalRow(
        nom: "Range Rover",
        prix: "\$120.00",
        etoile: 3,
        image:
        "https://w7.pngwing.com/pngs/228/771/png-transparent-range-rover-sport-land-rover-car-range-rover-evoque-rover-company-land-rover-vehicle-transport-range-rover-autobiography.png"),
  ];

  List<Commande> commandes =[
    Commande("Benz"),
    Commande("Bugatti"),
    Commande("Toyota"),
    Commande("Range Rover"),
  ];

  @override
  Widget build(BuildContext context) {
    int nombre = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Shopping car", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: arrivals.length,
        itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            arrivals[index],
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 240,),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if(commandes[index].getNombre()> 0) {
                          commandes[index].setNombre(
                              commandes[index].getNombre() - 1);
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(1),
                      backgroundColor: const Color(-320017167),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            3.0), // Définir le rayon des coins
                      ),
                    ),
                    child: const Icon(Icons.remove, size: 20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("${commandes[index].getNombre()}", style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          commandes[index].setNombre( commandes[index].getNombre() + 1);
                          print(commandes[index].getNombre());

                        });
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(1),
                        backgroundColor: const Color(-48128),
                        iconColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            3.0,
                          ), // Définir le rayon des coins
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
          ],
        );
      },

      ),
    );
  }
}
