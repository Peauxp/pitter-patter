import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gender_reveal/globals.dart';
import 'package:gender_reveal/providers/gender_provider.dart';

class CodeScreen extends ConsumerStatefulWidget {
  const CodeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CodeScreenState();
}

class _CodeScreenState extends ConsumerState<CodeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              boyColor,
              girlColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 200,
                child: TextFormField(
                  controller: _controller,
                  onChanged: (text) {
                    setState(() {
                      _isButtonVisible = text.length == 4;
                    });
                  },
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
                  onFieldSubmitted: (value) {
                    if (_isButtonVisible) {
                      ref
                          .read(currentGenderProvider.notifier)
                          .set(_controller.text);
                    } else {
                      globalSnackBar(message: 'Incomplete Code');
                    }
                  },
                ),
              ),
            ),
            if (_isButtonVisible)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      ref
                          .read(currentGenderProvider.notifier)
                          .set(_controller.text);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
