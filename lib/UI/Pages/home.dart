import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: Center(
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
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Connexion()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: Text('Jouer !', style: TextStyle(fontSize: 18),),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsque le bouton est pressé
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: Text('Voir le score', style: TextStyle(fontSize: 18),),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Regle()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: Text('Consulter les règles', style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      )
    );
  }
}