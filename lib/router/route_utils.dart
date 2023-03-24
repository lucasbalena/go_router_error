enum APP_PAGE {
  home,
  login,
  singup,
}

extension AppPageExtension on APP_PAGE {
  String get toPath {
    switch (this) {
      case APP_PAGE.home:
        return '/';
      case APP_PAGE.login:
        return '/login';
      case APP_PAGE.singup:
        return '/singup';
    }
  }

  String get toName {
    switch (this) {
      case APP_PAGE.home:
        return 'home';
      case APP_PAGE.login:
        return 'login';
      case APP_PAGE.singup:
        return 'singup';
    }
  }

  String get toTitle {
    switch (this) {
      case APP_PAGE.home:
        return 'Inicio';
      case APP_PAGE.login:
        return 'Entrar';
      case APP_PAGE.singup:
        return 'Cadastro';
    }
  }
}
