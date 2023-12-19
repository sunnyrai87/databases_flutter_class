// import 'package:databases_flutter_class/5_pair_29-Nov-2023/user_onboarding/sign_up_page.dart';
// import 'package:databases_flutter_class/6_pair_30-Nov-2023/user_onboarding/login_page.dart';
// import 'package:databases_flutter_class/Provider/Consumer/9th_pair_05-Dec-2023/add_note_page.dart';
// import 'package:databases_flutter_class/Provider/Consumer/9th_pair_05-Dec-2023/note_provider.dart';
// import 'package:databases_flutter_class/Provider/Consumer/9th_pair_05-Dec-2023/user_onboarding/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'app_db.dart';
// import 'model/note_model.dart';
//
// import 'user_onboarding/sign_up_page.dart';
//
// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => NoteProvider(db: AppDataBase.instance),
//     child: const MyApp(),
//   ));
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
//       home: LoginPage(),
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
//   // late AppDataBase appDB;
//   // int? uid = 0;
//   // List<NoteModel> data = [];
//   var titleController = TextEditingController();
//   var descController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     /// to get all notes when app opens
//     context.read<NoteProvider>().getAllNotes();
//     // appDB = AppDataBase.instance;
//     // getUID();
//   }
//
//   // void getUID() async {
//   //   var prefs = await SharedPreferences.getInstance();
//   //   uid = prefs.getInt(AppDataBase.LOGIN_UID);
//   //   getAllNotes();
//   // }
//
//   // void getAllNotes() async {
//   //   data = await appDB.fetchNotes(uid!);
//   //   setState(() {});
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Notes"),
//         ),
//         body: Consumer<NoteProvider>(builder: (ctx, provider, child){
//           var notes = provider.getNotes();
//           return notes.isNotEmpty ?
//           ListView.builder(
//               itemCount: notes.length,
//               itemBuilder: (context, index) {
//                 var currData = notes[index];
//                 return ListTile(
//                   leading: Text("${index + 1}"),
//                   title: Text(currData.note_title),
//                   subtitle: Text(currData.note_desc),
//                   trailing: SizedBox(
//                     width: 100,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         InkWell(
//                             onTap: () {
//                               //update the data
//                               // callMyBottomSheet(
//                               //     isUpdate: true,
//                               //     uId: currData.user_id,
//                               //     noteId: currData.note_id,
//                               //     title: currData.note_title,
//                               //     desc: currData.note_desc);
//                             },
//                             child: Icon(Icons.edit, color: Colors.blue)),
//                         InkWell(
//                             onTap: () {
//                               //delete the data
//                               showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                       title: Text("delete"),
//                                       content:
//                                       Text("are you sure you want to delete"),
//                                       actions: [
//                                         TextButton(
//                                             onPressed: () {
//                                               //delete operations here
//                                               // appDB.deleteNotes(currData.note_id);
//                                               // getAllNotes();
//                                               Navigator.pop(context);
//                                             },
//                                             child: Text("yes")),
//                                         TextButton(
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                             child: Text("no"))
//                                       ],
//                                     );
//                                   });
//                             },
//                             child: Icon(Icons.delete, color: Colors.red))
//                       ],
//                     ),
//                   ),
//                 );
//               }) : Container();
//         }),
//         floatingActionButton: FloatingActionButton(
//             onPressed: () {
//              // callMyBottomSheet();
//               //for adding notes
//               Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage()));
//             },
//             child: Icon(Icons.add)));
//   }
//
//   // void callMyBottomSheet(
//   //     {bool isUpdate = false,
//   //     int uId = 0,
//   //     int noteId = 0,
//   //     String title = "",
//   //     String desc = ""}) {
//   //   if (isUpdate) {
//   //     titleController.text = title;
//   //     descController.text = desc;
//   //   } else {
//   //     titleController.text = "";
//   //     descController.text = "";
//   //   }
//   //
//   //   showModalBottomSheet(
//   //       context: context,
//   //       builder: (context) => Container(
//   //             height: 550,
//   //             padding: EdgeInsets.all(16),
//   //             child: Column(
//   //               mainAxisAlignment: MainAxisAlignment.start,
//   //               children: [
//   //                 Text(isUpdate ? 'update note' : 'add noted'),
//   //                 TextField(
//   //                   controller: titleController,
//   //                 ),
//   //                 TextField(
//   //                   controller: descController,
//   //                 ),
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //                   children: [
//   //                     TextButton(
//   //                         onPressed: () async {
//   //                           if (titleController.text.isNotEmpty &&
//   //                               descController.text.isNotEmpty) {
//   //                             if (isUpdate) {
//   //                               //update notes here
//   //                               appDB.updateNote(NoteModel(
//   //                                   user_id: uId,
//   //                                   note_id: noteId,
//   //                                   note_title: titleController.text.toString(),
//   //                                   note_desc: descController.text.toString()));
//   //
//   //                               Navigator.pop(context);
//   //                             } else {
//   //                               //update notes here
//   //                               await appDB.addNote(NoteModel(
//   //                                   user_id: uid!,
//   //                                   note_id: 0,
//   //                                   note_title: titleController.text.toString(),
//   //                                   note_desc: descController.text.toString()));
//   //
//   //                               Navigator.pop(context);
//   //                             }
//   //                           }
//   //                         },
//   //                         child: Text(isUpdate ? 'update' : 'Add')),
//   //                     TextButton(
//   //                         onPressed: () {
//   //                           Navigator.pop(context);
//   //                         },
//   //                         child: Text("Cancel"))
//   //                   ],
//   //                 )
//   //               ],
//   //             ),
//   //           ));
//   // }
// }
