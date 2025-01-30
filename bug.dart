```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data successfully
      final jsonData = jsonDecode(response.body);
      // ... use jsonData ...
    } else {
      // Handle error responses
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during the API call
    print('Error fetching data: $e');
    // In real applications, consider more robust error handling and logging
    // e.g., using a logging library like 'logging'
  }
}
```