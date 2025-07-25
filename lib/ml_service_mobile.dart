// Mobile implementation with TensorFlow Lite support
import 'package:tflite_flutter/tflite_flutter.dart';

class MLService {
  static bool get isSupported => true;
  
  static Interpreter createInterpreter(dynamic modelFile) {
    return Interpreter.fromFile(modelFile);
  }
}
