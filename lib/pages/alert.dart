import 'package:mj_assistant/background/controlApp.dart';

class AlertParameter {
  static const List<String> TITLE_LIST = [
    '状態をリセットします',
    '状態がリセットされます',
    '次局に進みますか',
  ];

  static const List<String> CONTENT_LIST = [
    '途中経過は削除されます.',
    'その後，起家を選択してください．',
    '',
  ];

  static const List<String> ACTION_LIST = [
    'はい',
    '起家を選択',
    '次局へ',
  ];

  final String _title;
  final String _content;
  final String _yesButton;
  final String _noButton = 'いいえ';
  final String _extraButton = '連荘';
  final int _alertType;

  AlertParameter(this._alertType):
        _yesButton = ACTION_LIST[_alertType],
        _title = TITLE_LIST[_alertType],
        _content = CONTENT_LIST[_alertType];

  String get yesButton => _yesButton;
  String get noButton => _noButton;
  String get extraButton => _extraButton;
  String get title => _title;
  String get content => _content;

  ControlApp resultInOK(ControlApp controlApp) {
    switch(_alertType) {
      case 1: {
        controlApp = ControlApp(controlApp.playerNum);
        controlApp.preSetStarter();
        return controlApp;
      }
      case 2: {
        controlApp.nextRound();
        return controlApp;
      }
      default: {
        return ControlApp(controlApp.playerNum);
      }
    }
  }
}