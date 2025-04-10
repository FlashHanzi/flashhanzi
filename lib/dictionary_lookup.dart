import 'package:flashhanzi/parse.dart';
import 'package:flashhanzi/stroke_order.dart';
import 'package:flutter/material.dart';
import 'package:flashhanzi/database/database.dart';
import 'package:flashhanzi/home_page.dart';

class DictionaryLookup extends StatefulWidget {
  const DictionaryLookup({super.key, required this.db});
  final AppDatabase db;

  @override
  State<DictionaryLookup> createState() => _DictionaryLookupState();
}

class _DictionaryLookupState extends State<DictionaryLookup> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<DictionaryEntry> results = [];
  int offset = 0;
  final int limit = 20;
  bool isLoading = false;
  bool hasMore = true;

  late Map<String, StrokeData> strokeMap;
  bool strokesLoaded = false;

  @override
  void initState() {
    super.initState();
    strokeMap = {};
    loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          !isLoading &&
          hasMore) {
        loadMore();
      }
    });
  }

  Future<void> loadData() async {
    print('initState fired');

    strokeMap = await loadStrokeData();
    print('Loaded strokes: ${strokeMap.length}');

    setState(() {
      strokesLoaded = true;
    });
  }

  Future<void> loadMore() async {
    final input = _searchController.text.trim();
    if (input.isEmpty) return;

    setState(() => isLoading = true);

    final newResults = await widget.db.searchDictionaryPaginated(
      input,
      limit,
      offset,
    );

    setState(() {
      results.addAll(newResults);
      offset += newResults.length;
      isLoading = false;
      hasMore = newResults.length == limit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          // Home Button + Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.home, size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(db: widget.db),
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  'Dictionary Lookup',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Search Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () async {
                final input = _searchController.text.trim();
                if (input.isEmpty) return;

                setState(() {
                  results = [];
                  offset = 0;
                  hasMore = true;
                });

                await loadMore();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB42F2B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Search Word', style: TextStyle(fontSize: 16)),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // No Results
          if (results.isEmpty && !isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'No results found',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),

          // Search Results
          ...results.map((entry) => buildResultCard(entry)),

          // Loading Indicator
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget buildResultCard(DictionaryEntry entry) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.simplified,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                children: [
                  Text(
                    entry.pinyin,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB42F2B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.volume_up,
                      size: 24,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      print("Playing audio for ${entry.simplified}");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                entry.definition,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              FutureBuilder<List<SentencePair>>(
                future: widget.db.findSentencesFor(entry.simplified),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Column(
                      children: [
                        Text('No example sentence found.'),

                        strokesLoaded && strokeMap.containsKey(entry.simplified)
                            ? ExpansionTile(
                              title: const Text("Stroke Animation"),
                              leading: const Icon(Icons.play_arrow),
                              children: [
                                Center(
                                  child:
                                      strokeMap.containsKey(entry.simplified)
                                          ? CharacterStrokeView(
                                            strokeData:
                                                strokeMap[entry.simplified]!,
                                          )
                                          : SizedBox.shrink(),
                                ),
                              ],
                            )
                            : const SizedBox.shrink(), // return nothing
                      ],
                    );
                  } else {
                    final sentence = snapshot.data!.first;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Sentence: ${sentence.chinese}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Pinyin: ${sentence.pinyin}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Translation: ${sentence.english}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        strokesLoaded && strokeMap.containsKey(entry.simplified)
                            ? ExpansionTile(
                              title: const Text("Stroke Animation"),
                              leading: const Icon(Icons.play_arrow),
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 200,
                                    child:
                                        strokeMap.containsKey(entry.simplified)
                                            ? CharacterStrokeView(
                                              strokeData:
                                                  strokeMap[entry.simplified]!,
                                            )
                                            : SizedBox.shrink(),
                                  ),
                                ),
                              ],
                            )
                            : const SizedBox.shrink(), // return nothing
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
