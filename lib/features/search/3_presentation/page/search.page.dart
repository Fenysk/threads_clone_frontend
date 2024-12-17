import 'package:flutter/material.dart';
import 'package:threads_clone/features/search/3_presentation/widget/search-bar.widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: themeData.textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          SearchBarWidget(
            'Search',
            context: context,
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
