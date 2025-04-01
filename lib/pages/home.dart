import 'package:flutter/material.dart';
import '../widgets/wave_ring.dart';
import '../widgets/song_display.dart';
import '../widgets/tune.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isListening = false; // Temp for demo

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center, // ✅ Vertical centering
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    // Main tune display (centered focus)
                    TuneDisplay(
                        songTitle: "Waiting to detect...",
                        artist: "",
                        isListening: isListening,
                    ),
                    // Song info area
                    SongDisplay(
                        songTitle: "No song detected",
                        artist: "",
                        isListening: false,
                    ),
                    // Circle waveform around button
                    WaveRing(
                        isListening: isListening,
                        onTap: () {
                            // TODO: trigger listening
                        },
                    ),
                ],
            ),
        )
      ),
    );
  }
}
