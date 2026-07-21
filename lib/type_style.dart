import 'package:flutter/material.dart';

/// Module 4 - Activity 3 - Styling the Dex
///
/// Give each monster type its own look. You will build two things:
///
/// 1. `Color colorForType(String type)` - returns a colour for a type:
///      * 'fire'  -> a reddish colour
///      * 'water' -> a bluish colour
///      * 'grass' -> a greenish colour
///      * anything else -> a sensible default (for example grey)
///    The three type colours must all be different.
///
/// 2. `TypeBadge` - a small "pill" that shows a type. It should be a
///    `Container` with a `BoxDecoration` whose `color` is `colorForType(type)`
///    (rounded corners look nice), containing the type name in UPPER CASE in a
///    white `Text` (so it reads on the colour).
///
/// Concepts to research:
///   - the `Color` class and `Colors` (e.g. Colors.red)
///   - `Container`, `BoxDecoration`, `BorderRadius`
///   - `TextStyle` and `String.toUpperCase()`

/// TODO: return a colour for each type (and a default for unknown types).
Color colorForType(String type) {
  return Colors.grey;
}

class TypeBadge extends StatelessWidget {
  final String type;

  const TypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    // TODO: a coloured, rounded Container with the UPPERCASE type in white text.
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(type),
    );
  }
}
