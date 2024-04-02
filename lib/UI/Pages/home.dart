import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_mobile/UI/Pages/score.dart';
import 'Regle.dart';
import 'connexion.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: const Center(
          child: Text("USO!",
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
            Image.asset(
              'Images/LeLogo.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Connexion()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: const Text('Jouer !', style: TextStyle(fontSize: 18),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => score()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: const Text('Voir le score', style: TextStyle(fontSize: 18),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Regle()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: const Text('Consulter les règles', style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      )
    );
  }
}