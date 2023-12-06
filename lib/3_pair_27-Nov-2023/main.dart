//
// import 'package:flutter/material.dart';
//
// import 'app_db.dart';
// import 'note_model.dart';
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   late AppDataBase appDB;
//   List<NoteModel> data =[];
//   @override
//   void initState() {
//
//     super.initState();
//     appDB = AppDataBase.instance;
//     getAllNotes();
//   }
//
//   void getAllNotes() async{
//
//     data = await appDB.fetchNotes();
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Notes"),
//         ),
//         body: ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               var currData = data[index];
//               return ListTile(
//                 leading: Text("${currData.note_id}"),
//                 title: Text(currData.note_title),
//                 subtitle: Text(currData.note_desc),
//               );
//             }),
//         floatingActionButton:
//             FloatingActionButton(onPressed: () {
//
//               // var appDB = AppDataBase.instance;
//               // appDB.addNote(NoteModel(note_id: 0,
//               //     note_title: "New Note",
//               //     note_desc: "Implement db in flutter app"));
//               // getAllNotes();
//
//
//             }, child: Icon(Icons.add)));
//   }
// }
