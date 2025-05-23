import 'package:flashhanzi/database/database.dart';
import 'package:flashhanzi/dictionary_lookup.dart';
import 'package:flutter/material.dart';

class WordGrid extends StatefulWidget {
  final Set<String> wordSet; //aka recognizedList Set
  final Set<String> finalWordSet;
  final void Function(Set<String>) onSelectionChanged;
  final AppDatabase db;

  const WordGrid({
    super.key,
    required this.wordSet,
    required this.finalWordSet,
    required this.onSelectionChanged,
    required this.db,
  });

  @override
  // ignore: library_private_types_in_public_api
  _WordGridState createState() => _WordGridState();
}

class _WordGridState extends State<WordGrid> {
  late List<String> words;
  // late Set<String> selectedWords;
  late void Function(Set<String>) onSelectionChanged;
  @override
  void initState() {
    super.initState();
    // Convert the Set into a List to display in the GridView
    words = widget.wordSet.toList();
  }

  void _showWordOptions(BuildContext context, String word) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search "$word"'),
              onTap: () {
                Navigator.pop(context); // Close the modal
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DictionaryLookup(
                          db: widget.db,
                          prefillSearch: word,
                        ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 28),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: words.length,
      itemBuilder: (context, index) {
        final word = words[index];
        final isSelected = widget.finalWordSet.contains(word);
        return GestureDetector(
          onTap: () {
            final newSelection = Set<String>.from(
              widget.finalWordSet,
            ); //create new set of selected words
            isSelected ? newSelection.remove(word) : newSelection.add(word);

            widget.onSelectionChanged(newSelection); // SEND BACK here
          },
          onLongPress: () {
            _showWordOptions(context, word);
          },

          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? Colors.blue
                      : const Color.fromARGB(
                        240,
                        247,
                        245,
                        245,
                      ), // Light grey background
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // Subtle shadow
                  blurRadius: 2,
                  offset: Offset(2, 2), // Shadow position
                ),
              ],
            ),
            child: Center(
              child: Text(
                words[index],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
