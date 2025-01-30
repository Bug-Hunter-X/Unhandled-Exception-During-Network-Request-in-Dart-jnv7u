```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart'; //Add logging library

final _log = Logger('fetchData'); // Logger instance

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // ... use jsonData ...
      _log.info('Data fetched successfully');
    } else {
      _log.severe('Failed to load data. Status code: ${response.statusCode}', response.body);
      // Consider throwing a custom exception for better error handling elsewhere
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e, stacktrace) {
    _log.shout('Error fetching data: $e', stacktrace); // Log with stacktrace for debugging
    // In a real app, you'd likely want to display a user-friendly error message
    // and potentially retry the request after a delay
  }
}
void main() async {
  Logger.root.level = Level.ALL; // set logging level
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  await fetchData();
}
```