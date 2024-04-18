import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gender_reveal/globals.dart';
import 'package:gender_reveal/main.dart';
import 'package:gender_reveal/providers/gender_provider.dart';
import 'package:gender_reveal/screens/code_screen.dart';

class RevealScreen extends ConsumerStatefulWidget {
  const RevealScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RevealScreenState();
}

class _RevealScreenState extends ConsumerState<RevealScreen> {
  final GlobalKey _buttonKey = GlobalKey();

  double buttonWidth = 200;
  double buttonHeight = 50;

  int tapCount = 0;
  int tapLimit = 300;

  double top =
      ((MediaQuery.of(rootNavigatorKey.currentContext!).size.height / 2) - 25)
          .toDouble();
  double left =
      ((MediaQuery.of(rootNavigatorKey.currentContext!).size.width / 2) - 100)
          .toDouble();

  @override
  void initState() {
    super.initState();
  }

  increaseTapCount() {
    if (tapCount < tapLimit) {
      setState(() {
        if (kDebugMode) {
          tapCount = tapCount + 50;
        } else {
          tapCount++;
        }
      });
      if (tapCount == tapLimit) {
        globalSnackBar(message: 'Congrats on lots of taps!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Gender genderProvider = ref.watch(currentGenderProvider);
    switch (genderProvider) {
      case Gender.unset:
        return const CodeScreen();
      default:
        double opacityPercentage = 1 - (tapCount / tapLimit);
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
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white.withOpacity(opacityPercentage),
                ),
                if (tapCount >= tapLimit)
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: genderProvider == Gender.boy ? boyColor : girlColor,
                  ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '$tapCount / $tapLimit taps',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      'It\'s a ...',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                if (tapCount >= tapLimit)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Text(
                        genderProvider == Gender.boy ? 'BOY' : 'GIRL',
                        style: const TextStyle(fontSize: 100),
                      ),
                    ),
                  ),
                Center(
                  child: SizedBox(
                    height: buttonHeight,
                    width: buttonWidth,
                    child: ElevatedButton(
                      key: _buttonKey,
                      onPressed: () {
                        increaseTapCount();
                      },
                      child: const Text(
                        'TAP ME!',
                        style: TextStyle(fontSize: 24),
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
}
