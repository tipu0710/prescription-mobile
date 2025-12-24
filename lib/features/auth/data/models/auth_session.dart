import 'package:objectbox/objectbox.dart';

@Entity()
class AuthSession {
  @Id()
  int id = 0;

  String? accessToken;
  String? refreshToken;

  AuthSession({this.accessToken, this.refreshToken});
}
