import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:ecosofe_app/domain/models/user_data.dart';
import 'package:ecosofe_app/domain/use_cases/user/set_user_info_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUseCase {
  final SetUserInfoUseCase _setUserInfoUseCase = SetUserInfoUseCase();
  Future<bool> execute(context, UserData userData) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData.emailAddress,
        password: userData.password,
      );
      await credential.user?.sendEmailVerification();
      await _setUserInfoUseCase.execute(context, userData);
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBars.error(context, title: e.code.replaceAll('-', ' '));
    } catch (e) {
      AppSnackBars.error(context, title: e.toString());
    }
    return false;
  }
}
