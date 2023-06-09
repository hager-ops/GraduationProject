import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutUseCase {
  Future<bool> execute(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBars.error(context, title: e.code.replaceAll('-', ' '));
    } catch (e) {
      AppSnackBars.error(context, title: e.toString());
    }
    return false;
  }
}
