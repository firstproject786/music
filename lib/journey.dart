import 'package:flutter/material.dart';

class Journy extends StatefulWidget {
  const Journy({super.key});

  @override
  State<Journy> createState() => _JournyState();
}

class _JournyState extends State<Journy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Text(
                  "RECOMMENDED FOR YOU",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
