import 'dart:io';

import 'package:dart_chatbot/env/env.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: Env.apiKey);
  final chat = model.startChat();
  stdout.writeln("Enter 'stop' to stop chat");
  stdout.write("prompt > ");
  while (true) {
    String? input = stdin.readLineSync();
    if (input == "stop") {
      break;
    }
    final response = await chat.sendMessage(Content.text(input!));
    stdout.writeln("AI: ${response.text}");
    stdout.write("prompt > ");
  }
}
