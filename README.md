# Todo-Note App
---
Todo note app with local storage.

### Feature
- Create note by group note
- Note detail:
  -- Description
  -- Date
  -- File attachment
- Other: Check Done, Delete/Restore, Search,Share

### Library & Tech Stack
- Isar [local database]: easy to use, easy to config, strong in query, support listen when have data changed.
- Flutter_bloc [state management]: this is a powerful library, but for small projects like this one it doesn't show much of its power and seems unnecessary.
- Observable: use to separate logic crud, independent from any query execute.

### Screenshot
| | | | |
|:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:|
|![Image](/screenshot/home.png?raw=true)|![Image](/screenshot/add_group_note.png?raw=true)|![Image](/screenshot/add_note.png?raw=true)|![Image](/screenshot/calendar.png?raw=true)|


### Running App
1. clone
2. flutter pub get
3. flutter pub run build_runner build
4. flutter run lib/main.dart
