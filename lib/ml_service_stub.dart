// Stub implementation for platforms that don't support TensorFlow Lite
class MLService {
  static bool get isSupported => false;
  
  static dynamic createInterpreter(dynamic modelFile) {
    throw UnsupportedError('TensorFlow Lite not supported on this platform');
  }
}
