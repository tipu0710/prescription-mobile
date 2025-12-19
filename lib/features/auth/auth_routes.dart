import 'package:go_router/go_router.dart';
import 'presentation/pages/sign_in_page.dart';
import 'presentation/pages/sign_up_page.dart';

class AuthRoutes {
  static const String signin = '/signin';
  static const String signup = '/signup';

  static List<GoRoute> get routes => [
    GoRoute(path: signin, builder: (context, state) => const SignInPage()),
    GoRoute(path: signup, builder: (context, state) => const SignUpPage()),
  ];
}
