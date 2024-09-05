import 'package:flutter/material.dart';
import 'package:cardsell/Modele/commande.dart';

class Arrival extends StatelessWidget {
  late String nom;
  late String prix;
  late int etoile;
  late String image;

  Arrival(
      {super.key,
      required this.nom,
      required this.prix,
      required this.etoile,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Part1(image),
        const SizedBox(
          height: 2,
        ),
        Part2(
          nom: nom,
          prix: prix,
          etoile: etoile,
        ),
      ],
    ));
  }
}

class Part1 extends StatelessWidget {
  late String image;
  Part1(this.image, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 130,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image)),
      ),
    );
  }
}

class Part2 extends StatelessWidget {
  late String nom;
  late String prix;
  late int etoile;

  Part2({
    super.key,
    required this.nom,
    required this.prix,
    required this.etoile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(etoile, (index) {
            return const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 30,
            );
          }),
        ),
        Text(nom,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(prix,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red,
            )),
      ],
    );
  }
}

class ArrivalRow extends StatefulWidget {
  late String nom;
  late String prix;
  late int etoile;
  late String image;

  ArrivalRow(
      {super.key,
      required this.nom,
      required this.prix,
      required this.etoile,
      required this.image});

  @override
  State<ArrivalRow> createState() => _ArrivalRowState();
}

class _ArrivalRowState extends State<ArrivalRow> {
  @override
  Widget build(BuildContext context) {

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 30,
          ),
          Part1(widget.image),
          const SizedBox(
            width: 0,
          ),
          Part2(
            nom: widget.nom,
            prix: widget.prix,
            etoile: widget.etoile,
          ),
          const SizedBox(
            width: 30,
          ),
        ],
    );
  }
}
