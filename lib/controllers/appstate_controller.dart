import 'package:rxdart/rxdart.dart';

class AppEvent {}

class InitialEvent extends AppEvent {}

class LoginEvent extends AppEvent {
  String user;

  LoginEvent({
    required this.user,
  });
}

class LogoutEvent extends AppEvent {}

class NoConnectionEvent extends AppEvent {}

class AppStateController {
  final _appStateController = BehaviorSubject<AppEvent>.seeded(InitialEvent());

  Stream<AppEvent> get appState$ => _appStateController.stream;
  AppEvent get currentState => _appStateController.value;

  AppStateController();

  void setInitState() {
    _appStateController.add(InitialEvent());
  }

  void setLoginState(String user) {
    _appStateController.add(LoginEvent(user: user));
  }

  void setLogoutState() {
    _appStateController.add(LogoutEvent());
  }

  void setNoConnectionState() {
    _appStateController.add(NoConnectionEvent());
  }
}