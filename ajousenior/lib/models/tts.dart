import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static initTTS() async {
    print(await tts.getLanguages);

    tts.setLanguage("en_US"); //ko-KR한국어 사용 경우
    tts.setPitch(1.0); //피치설정
    tts.setSpeechRate(0.4); //말하는 속도
    tts.setVolume(0.5);
  }

  static speak(String text) async {
    tts.setStartHandler(() {
      print("TTS IS STARTED");
    });

    tts.setCompletionHandler(() {
      print("COMPLETED");
    });

    tts.setErrorHandler((message) {
      print(message);
    });

    await tts.awaitSpeakCompletion(true);

    tts.speak(text);
  }
}
