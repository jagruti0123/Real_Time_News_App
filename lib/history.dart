import 'package:flutter/material.dart';
import 'package:news_api_task/NewsHistoryManager.dart';


class History extends StatefulWidget {
  final HistoryStore historyStore;

  History({required this.historyStore});
  @override
  State<History> createState() => _HistoriesPageState();
}

class _HistoriesPageState extends State<History> {
  final HistoryStore historyStore = HistoryStore();
  @override
  void initState() {
    super.initState();
    widget.historyStore.loadHistory();
  }

  void _clearHistory() {
    setState(() {
      widget.historyStore.clearHistory();
    });
  }

  final defaultImageUrl =
      'https://yt3.ggpht.com/-L8AxmJwZuy8/AAAAAAAAAAI/AAAAAAAAAAA/eZRzS7tRVX0/s900-c-k-no/photo.jpg';

  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 50,
        backgroundColor: Color(0xffef5252),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "History",
          style: TextStyle(color: Colors.white,),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Show confirmation dialog before clearing history
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Clear History'),
                  content: Text('Are you sure you want to delete all History?'),
                  actions: [
                    TextButton(
                      child: Text('Cancel',style: TextStyle(color: Color(0xffef5252)),),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text('Clear',style: TextStyle(color: Color(0xffef5252)),),
                      onPressed: () {
                        _clearHistory();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: widget.historyStore.history.isEmpty
          ? Center(
        child: Text(
          'No items in history.',
          style: TextStyle(fontSize: 16),
        ),
      ): Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: widget.historyStore.history.length,
          itemBuilder: (context, index) {
            final item =  widget.historyStore.history.elementAt(index);
            final expanded = index == _expandedIndex; // Track expanded state

            return Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ExpansionTile(
                  key: ValueKey(index), // Ensure unique keys for ExpansionTile
                  title: Text(
                    item.title,
                    maxLines: expanded ? (item.title.length / 15).ceil() + 1  : 3, // Adjust maxLines dynamically
                    overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                  ),
                  leading: Container(
                    width: 90,
                    child: Image.network(
                      item.img != null && item.img.isNotEmpty ? item.img : defaultImageUrl,
                      fit: BoxFit.cover,
                    ),),
                  trailing: Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,color: Color(0xff757575),
                  ),
                  children: expanded
                      ? [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(item.description),
                    ),
                  ]
                      : [],
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _expandedIndex = expanded ? index : -1; // Update expanded state
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WatchedItem {
  String title;
  String img;
  String description;
  bool isUnique = true;
  // Add other fields as needed

  WatchedItem({required this.title, required this.img, required this
      .description});

  Map<String, dynamic> toJson() => {
    'title': title,
    'img': img,
    'description': description,
  };

  static WatchedItem fromJson(Map<String, dynamic> json) => WatchedItem(
    title: json['title'] as String,
    img: json['img'] as String,
    description: json['description'] as String,
  );
}