

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
        automaticallyImplyLeading: false,
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
                      var sortedData = List<Map>.from(snapshot.data ?? []);
                      sortedData.sort((a, b) => b['score'].compareTo(a['score']));
                      return DataTable(
                        columns: const [
                          DataColumn(label: Text('Nom')),
                          DataColumn(label: Text('Score')),
                          DataColumn(label: Text('Niveau')),
                        ],
                        rows: sortedData.map((row) => DataRow(cells: [
                          DataCell(Text(row['nom'].toString())),
                          DataCell(Text(row['score'].toString())),
                          DataCell(Text(row['niveau'].toString())),
                        ])).toList(),
                      );
                    } else {
                      return const CircularProgressIndicator();
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
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 50),
              ),
              child: const Text('Retour', style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}