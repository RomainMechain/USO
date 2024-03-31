

import 'package:flutter/material.dart';

import '../Database/database.dart';
import 'home.dart';

class score extends StatefulWidget {
  @override
  _scoreState createState() => _scoreState();
}

class _scoreState extends State<score> {
  @override
  Widget build(BuildContext context) {
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
              "Vos scores !",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 34,
              ),
            ),
            const SizedBox(height: 80),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<List<Map>>(
                  future: DatabaseHelper.instance.queryAllRows(),
                  builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
                    if (snapshot.hasData) {
                      return DataTable(
                        columns: const [
                          DataColumn(label: Text('Nom')),
                          DataColumn(label: Text('Score')),
                          DataColumn(label: Text('Niveau')),
                        ],
                        rows: snapshot.data!.map((row) => DataRow(cells: [
                          DataCell(Text(row['nom'].toString())),
                          DataCell(Text(row['score'].toString())),
                          DataCell(Text(row['niveau'].toString())),
                        ])).toList(),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: Text('Retour', style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}