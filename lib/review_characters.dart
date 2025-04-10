import 'package:flashhanzi/database/database.dart';
import 'package:flashhanzi/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart'; // Add this import for FlipCard

class ReviewCharacters extends StatefulWidget {
  const ReviewCharacters({super.key, required this.db});

  final AppDatabase db; // Declare the database instance

  @override
  State<ReviewCharacters> createState() => _ReviewCharactersState();
}

class _ReviewCharactersState extends State<ReviewCharacters> {
  late AppDatabase db; // Declare the database instance
  late Future<List<CharacterCard>> _dueCards;
  late int _currentIndex;
  // late bool _flipped;

  @override
  void initState() {
    super.initState();
    db = AppDatabase(); // Initialize the database instance in initState
    _dueCards = db.getDueCards(); // Call the method without arguments
    _currentIndex = 0; // Initialize the current index to 0
    // bool _flipped = false; // Initialize the flipped state to false
    _dueCards.then((cards) {
      if (cards.isEmpty) {
        setState(() {
          _currentIndex = -1;
        });
      }
    });
  }

  void updateCard(int grade) async {
    //grades : 1 = Forgot, 2 = Hard, 3 = Good, 4 = Easy
    final cards = await db.getDueCards();

    if (cards.isNotEmpty) {
      if (_currentIndex > cards.length) {
        setState(() {
          _currentIndex = -1;
        });
      }

      // db.updateNextReview(cards[0].character, DateTime.now());

      // Reschedule for the specified number of days
      // Cycle through cards

      if (grade == 1) {
        // If "Forgot" button was pressed
        db.updateNextReview(
          cards[0].character,
          DateTime.now().add(Duration(days: 1)),
        ); // Reschedule for tomorrow
      } else if (grade == 2) {
        // If "Hard" button was pressed
        db.updateNextReview(
          cards[0].character,
          DateTime.now().add(Duration(days: 2)),
        ); // Reschedule for two days later
      } else if (grade == 3) {
        // If "Good" button was pressed
        db.updateNextReview(
          cards[0].character,
          DateTime.now().add(Duration(days: 3)),
        ); // Reschedule for three days later
      } else if (grade == 4) {
        // If "Easy" button was pressed
        db.updateNextReview(
          cards[0].character,
          DateTime.now().add(Duration(days: 4)),
        ); // Reschedule for a week later
      }

      setState(() {
        _currentIndex = _currentIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // or VERTICAL
      speed: 500, // in milliseconds
      front: Card(
        elevation: 4,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20), // Space at the top
              Stack(
                alignment: Alignment.center, // Center the text in the Stack
                children: [
                  Align(
                    alignment:
                        Alignment
                            .centerLeft, // Align the IconButton to the left
                    child: IconButton(
                      icon: const Icon(Icons.home, size: 30),
                      onPressed: () {
                        Navigator.pop(context); // Go back to the previous page
                      },
                    ),
                  ),
                  const Text(
                    'Review Characters',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 32), // Space before the review list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FutureBuilder<List<CharacterCard>>(
                  future: _dueCards,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 84,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          decoration: TextDecoration.none, // Remove underline
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Error loading data',
                        style: TextStyle(
                          fontSize: 116,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          decoration: TextDecoration.none, // Remove underline
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      try {
                        return Text(
                          snapshot.data![_currentIndex].character,
                          style: const TextStyle(
                            fontSize: 116,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            decoration: TextDecoration.none, // Remove underline
                          ),
                        );
                      } catch (e) {
                        //change this screen
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                'Done studying for today!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration:
                                      TextDecoration.none, // Remove underline
                                ),
                              ),
                              SizedBox(height: 40),

                              ElevatedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xFFB42F2B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(db: db),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    'Review All Cards',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(height: 28),
                            ],
                          ),
                        );
                      }
                    }
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            'Done studying for today!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration:
                                  TextDecoration.none, // Remove underline
                            ),
                          ),
                          SizedBox(height: 40),

                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFB42F2B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(db: db),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Review All Cards',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 28),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16), // Space before the review list
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'How well did you remember?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 110, 110, 110),
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),
              ),
              SizedBox(height: 16), // Space before the buttons
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  SizedBox(width: 40), // Space before the first button
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                        bottom: 4,
                      ), // Vertical padding for the button
                      child: ElevatedButton.icon(
                        onPressed: () {
                          updateCard(1);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ), // Icon on the left
                        label: const Text('Forgot'), // Button text
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Button color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Space between the buttons
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          updateCard(2); // Update the card with "Hard" grade
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Button color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // Keep the button compact
                          children: const [
                            Text(
                              '🙁', // Upside-down smiley emoji
                              style: TextStyle(fontSize: 20), // Emoji size
                            ),
                            SizedBox(width: 8), // Space between emoji and text
                            Text('Hard'), // Button text
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40), // Space between the buttons
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  SizedBox(width: 40), // Space before the first button
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          updateCard(3); // Update the card with "Good" grade
                        },
                        icon: const Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ), // Icon on the left
                        label: const Text('Good'), // Button text
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Button color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Space between the buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        updateCard(4); // Update the card with "Easy" grade
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Button color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Keep the button compact
                        children: const [
                          Text(
                            '😎', // Upside-down smiley emoji
                            style: TextStyle(fontSize: 20), // Emoji size
                          ),
                          SizedBox(width: 8), // Space between emoji and text
                          Text('Easy'), // Button text
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40), // Space between the buttons
                ],
              ),
              SizedBox(height: 24), // Space before the next review character
              Text(
                '[ Tap to flip ]', // Instruction for tapping to flip
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600], // Lighter color for instruction
                ),
              ),
              SizedBox(height: 24), // Space before the next review character
              ExpansionTile(
                title: const Text("Personal Notes"),
                leading: const Icon(Icons.play_arrow),
                trailing: const Icon(Icons.arrow_drop_down),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 150, // or any size you want
                    color: Colors.grey[100],
                    child: Center(child: Text("Add notes here")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      back: Card(
        elevation: 4,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20), // Space at the top
              Stack(
                alignment: Alignment.center, // Center the text in the Stack
                children: [
                  Align(
                    alignment:
                        Alignment
                            .centerLeft, // Align the IconButton to the left
                    child: IconButton(
                      icon: const Icon(Icons.home, size: 30),
                      onPressed: () {
                        Navigator.pop(context); // Go back to the previous page
                      },
                    ),
                  ),
                  const Text(
                    'Review Characters',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8), // Space before the review list
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ), // Add padding inside the container
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Underline color
                        width: 1, // Underline thickness
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 52),
                      Text(
                        '好',
                        style: TextStyle(
                          fontSize: 76,
                          color: Colors.black87,
                          decoration: TextDecoration.none, // Remove underline
                        ),
                      ),
                      SizedBox(width: 28), // Space between characters
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              '[hao]',
                              style: const TextStyle(
                                fontSize: 48,
                                color: Colors.black87,
                                decoration:
                                    TextDecoration.none, // Remove underline
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up,
                              size: 24,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Add functionality to play audio here
                              doNothing();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4), // Space before the review list

              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ), // Add padding inside the container
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // Underline color
                        width: 1, // Underline thickness
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Meaning: Good; well',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFFB42F2B),
                              fontWeight: FontWeight.bold,
                              decoration:
                                  TextDecoration.none, // Remove underline
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8), // Space between meaning and example
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Example: 她是一个好人',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              decoration:
                                  TextDecoration.none, // Remove underline
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Pinyin: Tā shì yí gè hǎo rén',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              decoration:
                                  TextDecoration.none, // Remove underline
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Translation: He's studying Chinese",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              decoration:
                                  TextDecoration.none, // Remove underline
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ExpansionTile(
                title: const Text("Stroke Order Animation"),
                leading: const Icon(Icons.play_arrow),
                trailing: const Icon(Icons.arrow_drop_down),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 150, // or any size you want
                    color: Colors.grey[100],
                    child: Center(
                      child: Text("← Insert stroke animation widget here →"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16), // Space before the next review character

              SizedBox(height: 16), // Space before the notes input
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'How well did you remember?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 59, 59, 59),
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),
              ),
              SizedBox(height: 4), // Space before the buttons
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  SizedBox(width: 40), // Space before the first button
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                        bottom: 4,
                      ), // Vertical padding for the button
                      child: ElevatedButton.icon(
                        onPressed: () {
                          doNothing();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ), // Icon on the left
                        label: const Text('Forgot'), // Button text
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Button color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Space between the buttons
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          doNothing();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Button color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // Keep the button compact
                          children: const [
                            Text(
                              '🙁', // Upside-down smiley emoji
                              style: TextStyle(fontSize: 20), // Emoji size
                            ),
                            SizedBox(width: 8), // Space between emoji and text
                            Text('Hard'), // Button text
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40), // Space between the buttons
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  SizedBox(width: 40), // Space before the first button
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          doNothing();
                        },
                        icon: const Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ), // Icon on the left
                        label: const Text('Good'), // Button text
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Button color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Space between the buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        doNothing();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Button color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Keep the button compact
                        children: const [
                          Text(
                            '😎', // Upside-down smiley emoji
                            style: TextStyle(fontSize: 20), // Emoji size
                          ),
                          SizedBox(width: 8), // Space between emoji and text
                          Text('Easy'), // Button text
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40), // Space between the buttons
                ],
              ),
              SizedBox(height: 16), // Space before the next review character
              Text(
                '[ Tap to flip ]', // Instruction for tapping to flip
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600], // Lighter color for instruction
                ),
              ),
              SizedBox(height: 16), // Space before the next review character
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing() {
  // Placeholder function for button actions
}
