# Module 4 - Activity 3 - Styling the Dex (Flutter)

[![Made with Claude](https://img.shields.io/badge/Made_with-Claude-D97757?logo=anthropic&logoColor=white)](https://tjakoen.github.io/notes/ten-times-zero)
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)

A real app has a look. Give each monster type its own colour and build a small
coloured **type badge** you will reuse on every card.

## Build this

Open `lib/type_style.dart` and build two things:

1. **`Color colorForType(String type)`** returning:
   - `fire` -> a reddish colour, `water` -> a bluish colour,
     `grass` -> a greenish colour, and anything else -> a default (e.g. grey).
   - The three type colours must all be different.
2. **`TypeBadge`** - a `Container` with a `BoxDecoration` coloured with
   `colorForType(type)` (rounded corners look good), showing the type name in
   **UPPER CASE** in **white** `Text`.

## Run and check

```bash
flutter pub get
flutter run
flutter test
```

The grader photographs your three badges - aim for a clean, readable pill.

## Submit

Fill in `student.json`, commit, and push.
