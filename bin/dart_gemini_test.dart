import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

const apiKey = "AIzaSyCp_dF5msD6O-9Gws1U_xGzQ54TupFJCUI";

void main() async {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final chat = model.startChat();
  print("Enter 'stop' to stop chat\n");
  print("prompt > ");
  while (true) {
    String? input = stdin.readLineSync();
    if (input == "stop") {
      break;
    }
    final response = await chat.sendMessage(Content.text(input!));
    print("AI :${response.text}");
    print("prompt > ");
  }
}
