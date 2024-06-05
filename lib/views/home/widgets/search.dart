import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBarr extends StatefulWidget {
  final Function(String) onUpdateSearchTerm;
  String searchTerm;
  SearchBarr(this.searchTerm,{super.key, required this.onUpdateSearchTerm, });

  @override
  State<SearchBarr> createState() => _SearchBarrState();
}

class _SearchBarrState extends State<SearchBarr> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() => widget.searchTerm = value);
                widget.onUpdateSearchTerm(value);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search places',
              ),
            ),
          ),
          const Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }
}
