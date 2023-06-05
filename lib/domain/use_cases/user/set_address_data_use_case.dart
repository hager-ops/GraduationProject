import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';
import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:ecosofe_app/domain/models/address_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetAddressUseCase {
  final user = FirebaseAuth.instance.currentUser;

  Future<bool> execute(context, AddressEntity addressEntity) async {
    try {
      DocumentReference usersRef = FirebaseFirestore.instance
          .collection(FireBaseUserKeys.userCollection)
          .doc(user?.email);
      await usersRef
          .collection(FireBaseUserKeys.address)
          .doc()
          .set(addressEntity.toMap(), SetOptions(merge: true));
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBars.error(context, title: e.code.replaceAll('-', ' '));
    } catch (e) {
      AppSnackBars.error(context, title: e.toString());
    }
    return false;
  }
}
