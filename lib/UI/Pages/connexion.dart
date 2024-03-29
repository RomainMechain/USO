import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Center(
            child: Text(
              "USO!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 34,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Veuillez choisir votre nom !",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 80),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 300, maxHeight: 100),
                child: const TextField(
                  style: TextStyle(fontSize: 40),
                  decoration: InputDecoration(
                    hintText: 'Nom',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lorsque le bouton est pressé
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 50),
                ),
                child: const Text(
                  'Lancer la partie',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ));
  }
}
