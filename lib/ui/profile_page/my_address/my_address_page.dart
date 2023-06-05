import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';
import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_loader.dart';
import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/common/utils/fail_widget.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/models/address_entity.dart';
import 'package:ecosofe_app/domain/use_cases/user/delete_address_use_case.dart';
import 'package:ecosofe_app/ui/profile_page/my_address/add_address_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  final _address = FirebaseFirestore.instance
      .collection(FireBaseUserKeys.userCollection)
      .doc(FirebaseAuth.instance.currentUser?.email)
      .collection(FireBaseUserKeys.address);

  final DeleteAddressUseCase _deleteAddressUseCase = DeleteAddressUseCase();

  int? _deleteIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "My Address",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _address.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const FailWidget();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoader();
          }
          if (snapshot.hasData && snapshot.data != null) {
            if (snapshot.data?.docs != null) {
              List<AddressEntity> addressList = snapshot.data!.docs
                  .map((e) => AddressEntity.convert(e))
                  .toList();
              return ListView.builder(
                itemBuilder: (context, index) {
                  AddressEntity addressEntity = addressList[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.forthColor),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                addressEntity.city.toUpperCase(),
                                style: TextStyles.bold(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Street ${addressEntity.street}',
                                style: TextStyles.bold(fontSize: 15),
                              ),
                              Text(
                                'Area ${addressEntity.area} , Zone ${addressEntity.zone}',
                                style: TextStyles.regular(),
                              ),
                              Text(
                                "Floor ${addressEntity.floorNumber} , Flat ${addressEntity.apartment}",
                                style: TextStyles.regular(),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (addressList.length > 1) {
                                _deleteAddress(addressEntity.addressId, index);
                              } else {
                                AppSnackBars.hint(context,
                                    title:
                                        'Oops , You must have at least on address');
                              }
                            },
                            padding: EdgeInsets.zero,
                            icon: _deleteIndex == index
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ))
                                : const Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ))
                      ],
                    ),
                  );
                },
                itemCount: addressList.length,
              );
            } else {
              return Center(
                child: Text(
                  "No Result Found",
                  style: TextStyles.bold(fontSize: 18),
                ),
              );
            }
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: AppButton.primaryButton(
          color: AppColors.forthColor,
          title: "ADD NEW ADDRESS",
          verticalPadding: 10,
          horizontalPadding: 0,
          borderColor: AppColors.primaryColor,
          textColor: AppColors.primaryColor,
          onPressed: () {
            pushMaterialPage(context, const AddAddressPage());
          },
        ),
      ),
    );
  }

  void _deleteAddress(String id, int index) async {
    _deleteIndex = index;
    setState(() {});
    final result = await _deleteAddressUseCase.execute(context, id);
    if (result) {}
    _deleteIndex = null;
    setState(() {});
  }
}
