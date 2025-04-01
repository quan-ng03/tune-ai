import 'package:flutter/material.dart';

class TuneDisplay extends StatelessWidget {
  final String songTitle;
  final String artist;
  final bool isListening;

  const TuneDisplay({
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
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        if (artist.isNotEmpty)
          Text(
            artist,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
      ],
    );
  }
}
