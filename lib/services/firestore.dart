import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreService {
  //get collectioin of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

//CREATE: Add a new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //READ: Read a note
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  //UPDATE: Update docs when doc id is given
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE: Delete a note
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
