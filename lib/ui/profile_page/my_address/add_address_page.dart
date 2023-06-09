// ignore_for_file: use_build_context_synchronously

import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_snackbars.dart';
import 'package:ecosofe_app/common/utils/app_text_form_field.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/models/address_entity.dart';
import 'package:ecosofe_app/domain/use_cases/user/set_address_data_use_case.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
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
      body: const _MyAddressPageBody(),
    );
  }
}

class _MyAddressPageBody extends StatefulWidget {
  const _MyAddressPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_MyAddressPageBody> createState() => _MyAddressPageBodyState();
}

class _MyAddressPageBodyState extends State<_MyAddressPageBody> {
  final SetAddressUseCase _setUserDataUseCase = SetAddressUseCase();
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _areaController = TextEditingController();
  final _zoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _buildingNoController = TextEditingController();
  final _apartmentNoController = TextEditingController();
  final _floorNoController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            width: 1, style: BorderStyle.solid, color: AppColors.forthColor),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "New Address",
                  style: TextStyles.bold(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextFormField(
                  controller: _cityController,
                  hint: "City",
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  controller: _areaController,
                  hint: "Area",
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  controller: _zoneController,
                  hint: "Zone",
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  borderColor: AppColors.borderColor,
                  controller: _streetController,
                  hint: "Street",
                  keyboardType: TextInputType.streetAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: _buildingNoController,
                          hint: "Building No",
                          keyboardType: TextInputType.number,
                          maxLength: 5,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppTextFormField(
                          borderColor: AppColors.borderColor,
                          controller: _apartmentNoController,
                          hint: "Apartment No",
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          borderColor: AppColors.borderColor,
                          controller: _floorNoController,
                          maxLength: 5,
                          hint: " Floor No",
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton.primaryButton(
                          title: "CANCEL",
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          borderColor: AppColors.primaryColor,
                          textColor: AppColors.textPrimaryColor,
                          color: AppColors.forthColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppButton.primaryButton(
                            color: AppColors.primaryColor,
                            title: "SAVE",
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            borderColor: AppColors.primaryColor,
                            textColor: AppColors.forthColor,
                            isLoading: _isLoading,
                            onPressed: _onAdd),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onAdd() async {
    if (_formKey.currentState!.validate()) {
      _isLoading = true;
      setState(() {});
      AddressEntity addressEntity = AddressEntity(
        apartment: _apartmentNoController.text,
        area: _areaController.text,
        buildingNumber: _buildingNoController.text,
        city: _cityController.text,
        floorNumber: _floorNoController.text,
        street: _streetController.text,
        zone: _zoneController.text,
      );
      final result = await _setUserDataUseCase.execute(context, addressEntity);
      if (result) {
        Navigator.of(context).pop();
        AppSnackBars.success(context, title: 'Address Added Success');
      }
      _isLoading = false;
      setState(() {});
    }
  }
}
