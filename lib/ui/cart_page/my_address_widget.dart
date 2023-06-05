import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_loader.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/models/address_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAddressCardWidget extends StatefulWidget {
  const MyAddressCardWidget({
    Key? key,
    required this.onchange,
  }) : super(key: key);
  final void Function(AddressEntity?) onchange;

  @override
  State<MyAddressCardWidget> createState() => _MyAddressCardWidgetState();
}

class _MyAddressCardWidgetState extends State<MyAddressCardWidget> {
  final _address = FirebaseFirestore.instance
      .collection(FireBaseUserKeys.userCollection)
      .doc(FirebaseAuth.instance.currentUser?.email)
      .collection(FireBaseUserKeys.address);

  String? addressValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _address.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            'Fail To load',
            style: TextStyles.bold(),
          ));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoader();
        }
        if (snapshot.hasData && snapshot.data != null) {
          if (snapshot.data?.docs != null) {
            List<AddressEntity> addressList = snapshot.data!.docs
                .map((e) => AddressEntity.convert(e))
                .toList();
            return SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  AddressEntity addressEntity = addressList[index];
                  return GestureDetector(
                    onTap: () {
                      addressValue = addressEntity.addressId;
                      setState(() {});
                      // widget.onchange(addressEntity);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            style: BorderStyle.solid,
                            color: AppColors.forthColor),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                addressEntity.city.toUpperCase(),
                                style: TextStyles.bold(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Street ${addressEntity.street}',
                                style: TextStyles.medium(),
                              ),
                            ],
                          ),
                          Radio<String?>(
                            value: addressEntity.addressId,
                            groupValue: addressValue,
                            activeColor: AppColors.primaryColor,
                            onChanged: (value) {
                              addressValue = value;
                              // widget.onchange(value);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: addressList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                "No Address , Try to add new address",
                style: TextStyles.bold(fontSize: 18),
              ),
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
