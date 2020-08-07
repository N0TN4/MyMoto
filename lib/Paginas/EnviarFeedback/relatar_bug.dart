import 'package:flutter/material.dart';

class RelatarBug extends StatefulWidget {
  @override
  _RelatarBugState createState() => _RelatarBugState();
}

class _RelatarBugState extends State<RelatarBug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              print("Enviar relato de bug");
              setState(() {});
            },
          ),
        ],
        title: Text(
          "Reporte um bug",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 24),
            TextField(
              maxLength: 50,
              maxLines: 1,
              decoration: InputDecoration(
                counterText: "",
                labelText: 'Título',
                labelStyle: TextStyle(height: 0.0, color: Colors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Relatar problema"),
            SizedBox(height: 8.0),
            TextField(
              maxLength: 900,
              maxLines: 10,
              decoration: InputDecoration(
                counterText: "",
                labelStyle: TextStyle(height: 0.0, color: Colors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
