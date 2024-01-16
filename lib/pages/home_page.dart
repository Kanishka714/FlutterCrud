import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//firestore
  final FireStoreService fireStoreService = FireStoreService();

// Text controller
  final TextEditingController textController = TextEditingController();

//Open a dialog vox to add a note
  void openNoteBox({String? docID}) {
    //null safety
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //button to save the note

          ElevatedButton(
            onPressed: () {
              //add a new note
              if (docID == null) {
                fireStoreService.addNote(textController.text);
              }

              //update an existing note
              else {
                fireStoreService.updateNote(docID, textController.text);
              }

              //clear the text controller
              textController.clear();

              //close the box
              Navigator.pop(context);
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NOTES")),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreService.getNotesStream(),
        builder: (context, snapshot) {
          //if we have data,get all the docs
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            //display as a list
            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                //get each individual doc
                DocumentSnapshot document = noteList[index];
                String docID = document.id;

                //get note from each doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                //Display a list as a title
                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //update button
                      IconButton(
                        onPressed: () => openNoteBox(docID: docID),
                        icon: const Icon(Icons.settings),
                      ),

                      //delete buttoon
                      IconButton(
                        onPressed: () => fireStoreService.deleteNote(docID),
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                );
              },
            );
          }

          //if there is no data, return nothing
          else {
            return const Text("Notes");
          }
        },
      ),
    );
  }
}
