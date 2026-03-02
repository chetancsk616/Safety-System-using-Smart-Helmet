import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playVoice(String command) async {
    try {
      String fileName;
      
      switch (command) {
        case 'turn_left':
          fileName = 'turn_left.wav';
          debugPrint('🗣️ "Turn left"');
          break;
        case 'turn_right':
          fileName = 'turn_right.wav';
          debugPrint('🗣️ "Turn right"');
          break;
        case 'go_straight':
          fileName = 'go_straight.wav';
          debugPrint('🗣️ "Go straight"');
          break;
        case 'arrived':
          fileName = 'arrived.wav';
          debugPrint('🗣️ "You have arrived"');
          break;
        default:
          fileName = 'go_straight.wav';
      }
      
      // Try to play the file (even if dummy)
      await _player.play(AssetSource('audio/$fileName'));
      
    } catch (e) {
      // If file missing, just show the message
      debugPrint('📢 Voice: $command (audio file not playing)');
    }
  }

  Future<void> stop() async {
    await _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}
