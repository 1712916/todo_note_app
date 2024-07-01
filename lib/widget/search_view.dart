import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.dividerColor,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.search),
            const SizedBox(width: 8),
            Text(
              'Search...',
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
