

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
final FlutterTts _flutterTts = FlutterTts();


  Future<void> speak(String text) async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  Future<void> pause() async {
    await _flutterTts.pause();
  }

  // Future resume() async {
  //   await _flutterTts.resume();
  // }

  Future<void> setLanguage(String language) async {
    await _flutterTts.setLanguage(language);
  }

  Future<void> setPitch(double pitch) async {
    await _flutterTts.setPitch(pitch);
  }

  Future<void> setSpeechRate(double rate) async {
    await _flutterTts.setSpeechRate(rate);
  }

  // Future<List<dynamic>> getLanguages() async {
  //   return await _flutterTts.getLanguages;
  // }

  // Future<List<dynamic>> getVoices() async {
  //   return await _flutterTts.getVoices;
  // }

   Future<List<DropdownMenuItem<String>>> getLanguageDropDownMenuItems(
      ) async {
        final dynamic languages = await _flutterTts.getLanguages;
    final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];
    for (final dynamic type in languages as Iterable<dynamic>) {
      items.add(DropdownMenuItem<String>(
          value: type as String?, child: Text(type ?? '')));
    }
    return items;
  }

  // Future<bool> isSpeaking() async {
  //   return await _flutterTts.isSpeaking();
  // }

  Future<void> setVolume(double volume) async {
    await _flutterTts.setVolume(volume);
  }
}
