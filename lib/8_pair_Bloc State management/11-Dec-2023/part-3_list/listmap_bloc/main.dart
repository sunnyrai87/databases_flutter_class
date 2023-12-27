// import 'package:databases_flutter_class/7_pair_Provider/cubit/without%20database/12th-pair_09-Dec-2023/list_state.dart';
// import 'package:databases_flutter_class/8_pair_Bloc%20State%20management/11-Dec-2023/part-3_list/listmap_bloc/list_bloc.dart';
// import 'package:databases_flutter_class/8_pair_Bloc%20State%20management/11-Dec-2023/part-3_list/listmap_bloc/list_event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: BlocProvider(
//         create: (context) => ListBloc(),
//         child: HomePage(),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: BlocBuilder<ListBloc, ListState>(builder: (_, state) {
//         List<Map<String, dynamic>> mapData = state.mData;
//         return ListView.builder(
//             itemCount: mapData.length,
//             itemBuilder: (_, index) {
//               var eachMap= mapData[index];
//               return ListTile(
//                 title: Text("${eachMap["title"]}"),
//                   subtitle: Text("${eachMap["Desc"]}")
//               );
//             });
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.read<ListBloc>().add(AddMapEvent(newMap: {
//             "title": "Hello",
//             "Desc": "Practice"}));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
