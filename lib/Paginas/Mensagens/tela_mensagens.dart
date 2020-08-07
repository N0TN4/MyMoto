// import 'package:flutter/material.dart';

// class TelaMensagens extends StatefulWidget {
//   @override
//   _TelaMensagensState createState() => _TelaMensagensState();
// }

// class _TelaMensagensState extends State<TelaMensagens> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Mensagens",
//         ),
//         backgroundColor: Color.fromRGBO(186, 27, 29, 1),
//         actions: <Widget>[
//           InkWell(
//             child: SizedBox(width: 80, child: Icon(Icons.search)),
//           ),
//         ],
//       ),
//       body: Center(
//         child: StreamBuilder(
//             stream: Firestore.instance.collection('usuarios').snapshots(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.hasError) {
//                 return new Text('Error: ${snapshot.error}');
//               }
//               switch (snapshot.connectionState) {
//                 case ConnectionState.waiting:
//                   return LinearProgressIndicator();
//                   break;
//                 default:
//                   return Center(
//                     child: ListView(
//                         children: snapshot.data.documents
//                             .map<Widget>((DocumentSnapshot doc) {
//                       return ListTile(
//                         title: Text(doc.data['login'].toString()),
//                       );
//                     }).toList()),
//                   );
//               }
//             }),
//       ),
//     );
//   }
// }
