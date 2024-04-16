import 'package:flutter/material.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3980D0),
              Color(0xFFF490BB),
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 100,
            width: 200,
            child: TextFormField(
              maxLength: 4,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'CODE',
              ),
              textCapitalization: TextCapitalization.characters,
            ),
          ),
        ),
      ),
    );
  }
}
