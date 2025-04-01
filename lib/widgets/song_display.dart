import 'package:flutter/material.dart';

class SongDisplay extends StatelessWidget {
  final String songTitle;
  final String artist;
  final bool isListening;

  const SongDisplay({
    super.key,
    required this.songTitle,
    required this.artist,
    required this.isListening,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isListening ? 'Listening...' : songTitle,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (artist.isNotEmpty)
          Text(
            artist,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
      ],
    );
  }
}
