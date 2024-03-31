import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'score.dart';



class PageCercle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Uso'),
        ),
        body: Center(
          child: CercleWidget(),
        ),
      ),
    );
  }
}

class CercleWidget extends StatefulWidget {
  @override
  _CercleWidgetState createState() => _CercleWidgetState();
}

class _CercleWidgetState extends State<CercleWidget> {
  final random = Random();
  Offset _circlePosition = Offset(10, 10);
  late int randomisation;
  late Timer _timer;
  int _start = 30; // Réduit le temps pour tester plus rapidement
  bool _gameStarted = false;
  int _score = 0;
  int _scorefinal = 0;
  int _scoreAAtteindre = 100;

  @override
  void initState() {
    super.initState();
    randomisation = random.nextInt(100) + 30;
  }

  void startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
          (Timer timer) {
        if (!mounted) {
          return;
        }
        if (_start == 0) {
          setState(() {
            timer.cancel();});
          if (_score >= _scoreAAtteindre) {

            _scorefinal += _score;
            _WinGameOverDialog();
            _start = 30;
            _scoreAAtteindre = (_scoreAAtteindre * 1.2).toInt();
            _gameStarted = false;
            _score = 0;
          } else {
            setState(() {
              _scorefinal += _score;
              timer.cancel();
              _showGameOverDialog(); // Affiche le dialog "Game Over"
            });
          }
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _moveCircle(TapUpDetails details) {
    if (_start == 0 && _score < _scoreAAtteindre) {
      return; // Si le temps est écoulé, ne faites rien
    }

    if (!_gameStarted) {
      _gameStarted = true;
      startTimer(); // Démarre le chronomètre uniquement si le jeu a commencé
    }

    setState(() {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
      final circleRadius = randomisation;
      final double navigationBarHeight = 50; // Remplacez par la hauteur réelle de votre barre de navigation
      final double y = random.nextDouble() * (screenHeight - circleRadius * 2.5 - navigationBarHeight);
      final double x = random.nextDouble() * (screenWidth - circleRadius * 2);
      _circlePosition = Offset(x, y);
      randomisation = random.nextInt(100) + 30;
      _score += (150 - randomisation) ~/ 10; // Augmente le score en fonction de la taille du cercle


    });
  }

  // Affiche un AlertDialog "Game Over" personnalisé
  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Game over !',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Votre score est de $_scorefinal points.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),

          actions: [
            TextButton(
              onPressed: () {
                // recommence le jeu
                _start = 30;
                _scoreAAtteindre = 100;
                _gameStarted = false;
                _score = 0;
                _scorefinal = 0;
                Navigator.of(context).pop(); // Ferme le dialog
                setState(() {}); // Force le widget à se reconstruire
              },
              child: const Text(
                'recommence',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                // arrete le jeu et retourne à la page des regles
                _timer.cancel();
                Navigator.of(context).pop(); // Ferme le dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => score()),
                );
              },
              child: const Text(
                'arretez le jeu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  // Affiche un AlertDialog "Vous avez gagné !" personnalisé
  void _WinGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Vous avez gagné !',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Votre avez atteint le score de $_scorefinal points.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le dialog
              },
              child: const Text(
                'Passer au niveau suivant',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (!_gameStarted) {
      _circlePosition = Offset(screenWidth / 2, screenHeight / 2);
    }
    return GestureDetector(
      onTapUp: _moveCircle,
      child: Stack(
        children: [
          Positioned(
            left: _circlePosition.dx,
            top: _circlePosition.dy,
            child: Container(
              width: randomisation.toDouble(),
              height: randomisation.toDouble(),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child: !_gameStarted
                  ? const Text('Start', style: TextStyle(color: Colors.white, fontSize: 20))
                  : null,
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: IgnorePointer(
              child: GestureDetector(
                onTap: () {
                  if (_timer.isActive) {
                    _timer.cancel();
                  }
                  startTimer();
                },
                child: Text('Timer: $_start', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 50,
            child: IgnorePointer(
              child: Text('Score: $_score', style: TextStyle(fontSize: 18)),
            ),
          ),
          Positioned(
            top: 110,
            left: 50,
            child: IgnorePointer(
              child: Text('Score a atteindre: $_scoreAAtteindre', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
