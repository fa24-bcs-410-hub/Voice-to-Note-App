import 'package:flutter/material.dart';

const blue = Color(0xFF1769F5);
const navy = Color(0xFF092B66);

Widget homeScreen({
  required VoidCallback startRecording,
  required VoidCallback openNotes,
  required VoidCallback openProfile,
  required List<Widget> recentNotes,
}) {
  return ListView(
    padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.mic, color: blue, size: 35),
          IconButton(
            onPressed: openProfile,
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      const SizedBox(height: 8),
      const Text(
        'Voice Notes',
        style: TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Speak  •  Convert  •  Save',
        style: TextStyle(fontSize: 16, color: navy),
      ),
      const SizedBox(height: 25),

      Row(
        children: [
          Expanded(
            child: actionCard(
              Icons.mic,
              'Record Voice',
              blue,
              startRecording,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: actionCard(
              Icons.description,
              'My Notes',
              const Color(0xFF8B5CF6),
              openNotes,
            ),
          ),
        ],
      ),

      const SizedBox(height: 28),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Notes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: openNotes,
            child: const Text('View All'),
          ),
        ],
      ),

      ...recentNotes,
    ],
  );
}

Widget actionCard(
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
    ) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(18),
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
