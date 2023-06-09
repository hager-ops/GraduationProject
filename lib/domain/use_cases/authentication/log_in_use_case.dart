import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInUseCase {
  Future<bool> execute(context,
      {required String email, required String password}) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      bool? isEmailVerified = result.user?.emailVerified;
      if (isEmailVerified == false) {
        await result.user?.sendEmailVerification();
      }
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBars.error(context, title: e.code.replaceAll('-', ' '));
    } catch (e) {
      AppSnackBars.error(context, title: e.toString());
    }
    return false;
  }
}
