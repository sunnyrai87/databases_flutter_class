import 'package:databases_flutter_class/Provider/Consumer/9th_pair_05-Dec-2023/note_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/note_model.dart';

class AddNotePage extends  StatelessWidget {
var titleController = TextEditingController();
var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Add notes")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('add noted'),
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: descController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () async {
                      if (titleController.text.isNotEmpty &&
                          descController.text.isNotEmpty) {
                        ///add note here
                        context.read<NoteProvider>().addNote((NoteModel(
                                  user_id: 0,
                                  note_id: 0,
                                  note_title: titleController.text.toString(),
                                  note_desc: descController.text.toString())));

                        // appDB.addNote(NoteModel(
                        //       user_id: uid!,
                        //       note_id: 0,
                        //       note_title: titleController.text.toString(),
                        //       note_desc: descController.text.toString()));
                        //   getAllNotes();
                          Navigator.pop(context);
                        }
                      },

                    child: Text('Add')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"))
              ],
            )
          ],
        )

        ],
      ),
    );

  }
}
