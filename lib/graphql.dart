import 'dart:io';

HttpClient http = HttpClient();

final client = http.openUrl('POST', Uri.parse('https://demo.com'));

test() {
  // http.authenticate
}
