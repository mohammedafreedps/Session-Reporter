import 'package:clipboard/clipboard.dart';

void copyToClipBoard(String content) {
  FlutterClipboard.copy(content).then((value) => print('copied'));
}
