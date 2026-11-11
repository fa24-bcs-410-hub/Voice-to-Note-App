import 'package:flutter/material.dart';
import '../models/note.dart';

Widget notesScreen({
  required List<Note> notes,
  required String search,
  required ValueChanged<String> onSearch,
  required VoidCallback goHome,
  required Widget Function(Note) noteCard,
}) {
  final filtered = notes.where((n) {
    return n.title.toLowerCase().contains(search.toLowerCase()) ||
        n.text.toLowerCase().contains(search.toLowerCase());
  }).toList();

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Notes',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: goHome,
              icon: const Icon(Icons.home_outlined),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          onChanged: onSearch,
          decoration: InputDecoration(
            hintText: 'Search notes...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: const Color(0xFFEAF2FC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),

      const SizedBox(height: 12),

      Expanded(
        child: filtered.isEmpty
            ? const Center(child: Text('No notes found'))
            : ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: filtered.map((n) => noteCard(n)).toList(),
        ),
      ),
    ],
  );
}
