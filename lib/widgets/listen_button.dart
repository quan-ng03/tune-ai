import 'package:flutter/material.dart';

class ListenButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onTap;

  const ListenButton({
    super.key,
    required this.isListening,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isListening ? Colors.redAccent : Colors.deepPurple,
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.4),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            isListening ? Icons.stop : Icons.mic,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
