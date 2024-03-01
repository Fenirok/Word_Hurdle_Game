import 'package:flutter/material.dart';

const keysList = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
];

class KeyBoardView extends StatelessWidget {
  final List<String> excludedLetters;
  final Function(String) onPressed;
  const KeyBoardView({
    super.key,
    required this.excludedLetters,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            for (var i = 0; i < keysList.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: keysList[i]
                      .map((e) => VirtualKey(
                            letter: e,
                            excluded: excludedLetters.contains(e),
                            onPress: (value) {
                              onPressed(value);
                            },
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class VirtualKey extends StatelessWidget {
  final String letter;
  final bool excluded;
  final Function(String) onPress;
  const VirtualKey({
    super.key,
    required this.letter,
    required this.excluded,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: excluded ? Colors.red : Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          onPress(letter);
        },
        child: Text(letter),
      ),
    );
  }
}
