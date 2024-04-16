import 'package:flutter/material.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final isFilled = _controller.text.isNotEmpty;
      if (isFilled != _isButtonVisible) {
        // Update visibility only if the state changes
        setState(() {
          _isButtonVisible = isFilled;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Don't forget to dispose of the controller
    super.dispose();
  }

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
                ),
              ),
            ),
            if (_isButtonVisible)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
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
