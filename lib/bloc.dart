import 'dart:async';

class AppBLoC {
  String _token;

  StreamController<String> _tokenController;

  AppBLoC(this._token) {
    _tokenController = StreamController<String>();
  }

  String get token => _token;
  bool get authed => _token.length > 0;

  Stream<String> get stream => _tokenController.stream;

  createSession (String token) {
    _tokenController.sink.add(token);
  }

  destorySession () {
    _tokenController.sink.add('');
  }
}
