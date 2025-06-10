import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:graduation_project/core/helpers/errors.dart';

class ChatBotRepo {
  static const String apiKey = 'AIzaSyBRDUU74iW35hCWqfDHu8HiBZTcZR_ykfk';

  Future<Either<Failure, String>> getText(String message) async {
    String result = '';
    try {
      final model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: apiKey);

      final content = [Content.text(message)];
      final response = await model.generateContent(content);

      result = response.text ?? '';
      return right(result);
    } catch (e) {
      log("Error is $e");
      return left(Failure(errorMessage: 'Check your internet connection'));
    }
  }
}
