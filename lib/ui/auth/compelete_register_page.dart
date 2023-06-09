// ignore_for_file: use_build_context_synchronously

import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/app_text_form_field.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/domain/models/address_entity.dart';
import 'package:ecosofe_app/domain/use_cases/user/set_address_data_use_case.dart';
import 'package:ecosofe_app/ui/host_page.dart';
import 'package:flutter/material.dart';

class CompleteRegisterPage extends StatelessWidget {
  const CompleteRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/common/appLogo.png",
                scale: 3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .1,
              ),
              const _CompleteRegisterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompleteRegisterFormWidget extends StatefulWidget {
  const _CompleteRegisterFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_CompleteRegisterFormWidget> createState() =>
      _CompleteRegisterFormWidgetState();
}

class _CompleteRegisterFormWidgetState
    extends State<_CompleteRegisterFormWidget> {
  final SetAddressUseCase _setUserDataUseCase = SetAddressUseCase();
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _areaController = TextEditingController();
  final _zoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _buildingController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _floorController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _cityController.dispose();
    _areaController.dispose();
    _zoneController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _apartmentController.dispose();
    _floorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: AppColors.forthColor),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: _cityController,
                      hint: "City",
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextFormField(
                      controller: _areaController,
                      hint: "Area",
                      keyboardType: TextInputType.streetAddress,
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
                      controller: _streetController,
                      hint: "Street",
                      keyboardType: TextInputType.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppTextFormField(
                              controller: _buildingController,
                              hint: "Building No",
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AppTextFormField(
                              hint: "Apartment No",
                              controller: _apartmentController,
                              maxLength: 5,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .15),
                      child: AppTextFormField(
                        controller: _floorController,
                        borderColor: AppColors.borderColor,
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        hint: " Floor No",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: AppButton.primaryButton(
                          isLoading: _isLoading,
                          title: "Sign Up",
                          onPressed: _onRegister),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onRegister() async {
    if (_formKey.currentState!.validate()) {
      _isLoading = true;
      setState(() {});
      AddressEntity addressEntity = AddressEntity(
        apartment: _apartmentController.text,
        area: _areaController.text,
        buildingNumber: _buildingController.text,
        city: _cityController.text,
        floorNumber: _floorController.text,
        street: _streetController.text,
        zone: _zoneController.text,
      );
      final result = await _setUserDataUseCase.execute(context, addressEntity);
      if (result) {
        navigateRemoveReplacement(context, const HostPage());
      }
      _isLoading = false;
      setState(() {});
    }
  }
}
