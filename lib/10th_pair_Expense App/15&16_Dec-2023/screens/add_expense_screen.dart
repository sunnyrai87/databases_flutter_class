// import 'package:databases_flutter_class/10th_pair_Expense%20App/15&16_Dec-2023/app_constants/content_constants.dart';
// import 'package:flutter/material.dart';
//
// import '../app_constants/CstmButton.dart';
//
// class AddExpenseScreen extends StatefulWidget {
//   const AddExpenseScreen({super.key});
//
//   @override
//   State<AddExpenseScreen> createState() => _AddExpenseState();
// }
//
// class _AddExpenseState extends State<AddExpenseScreen> {
//   var titleController = TextEditingController();
//   var descController = TextEditingController();
//   var amtController = TextEditingController();
//   var transactiontype = ["Debit", "Credit"];
//   var selectedTransactionType = "Debit";
//   var selectedCatIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Add Expense"),
//           backgroundColor: Colors.blue,
//         ),
//         body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Container(
//               height: 35,
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: DropdownButton(
//                 value: selectedTransactionType,
//                 items: transactiontype
//                     .map((type) =>
//                         DropdownMenuItem(value: type, child: Text(type)))
//                     .toList(),
//                 onChanged: (value) {
//                   selectedTransactionType = value!;
//                   setState(() {});
//                 },
//               )),
//           CstmButton(
//             name: "Choose Expense",
//             mWidget: selectedCatIndex != -1
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         AppConstants.mCategory[selectedCatIndex].catImgPath,
//                         width: 25,
//                         height: 25,
//                       ),
//                       Text(
//                         "_ ${AppConstants.mCategory[selectedCatIndex].catTitle}",
//
//                       )
//                     ],
//                   )
//                 : null,
//             btnColor: Colors.white,
//             textColor: Colors.black,
//             onTap: () {
//               showModalBottomSheet(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 context: context,
//                 builder: (context) {
//                   return GridView.builder(
//                     itemCount: AppConstants.mCategory.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4),
//                     itemBuilder: (context, index) {
//                       var eachCat = AppConstants.mCategory[index];
//                       return InkWell(
//                         onTap: () {
//                           selectedCatIndex = index;
//                           setState(() {});
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(11),
//                           decoration: BoxDecoration(
//                             color: Colors.cyan.withOpacity(0.4),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(11),
//                             child: Image.asset(eachCat.catImgPath),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         SizedBox(height: 11),
//         CstmButton(
//             name: "ADD Expense",
//             btnColor: Colors.black,
//             textColor: Colors.white, onTap: () {  }),
//         ]));
//   }
// }
