import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/common.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/models/address_entity.dart';
import 'package:ecosofe_app/domain/product/product_model.dart';
import 'package:ecosofe_app/ui/cart_page/confirm_cart_page.dart';
import 'package:ecosofe_app/ui/host_page.dart';
import 'package:ecosofe_app/ui/user_home_page/product_item_widget.dart';
import 'package:flutter/material.dart';

import 'my_address_widget.dart';

List<Product> cardProducts = [];
double productsPrice = 0;
void calculateProductsPrice() {
  productsPrice = 0;
  for (var item in cardProducts) {
    double itemPrice =
        (double.tryParse(item.priceForPiece) ?? 0) * item.count.toDouble();
    productsPrice += itemPrice;
  }
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    HostPage.tabsController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  AddressEntity? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyles.bold(color: AppColors.forthColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Product currentProduct = cardProducts[index];
                  return ProductItem(
                    product: currentProduct,
                    addFun: () {
                      cardProducts = cardProducts.map((e) {
                        if (e.name == currentProduct.name &&
                            e.category == currentProduct.category) {
                          return e.modify(count: e.count + 1);
                        }
                        return e;
                      }).toList();
                      calculateProductsPrice();
                      setState(() {});
                    },
                    removeFun: () {
                      if (currentProduct.count > 0) {
                        cardProducts = cardProducts.map((e) {
                          if (e.name == currentProduct.name &&
                              e.category == currentProduct.category) {
                            return e.modify(count: e.count - 1);
                          }
                          return e;
                        }).toList();
                        calculateProductsPrice();
                        setState(() {});
                      }
                    },
                  );
                },
                itemCount: cardProducts.length,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              const Divider(
                color: AppColors.forthColor,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "ADDRESS",
                      style: TextStyles.bold(color: AppColors.textPrimaryColor),
                    )
                  ],
                ),
              ),
              MyAddressCardWidget(
                onchange: (value) {
                  // address = value;
                  // setState(() {});
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppColors.forthColor,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Text(
                      "Total Amount:",
                      style: TextStyles.bold(color: AppColors.blackColor),
                    ),
                    const Spacer(),
                    Text(
                      "$productsPrice LE",
                      style: TextStyles.bold(color: AppColors.blackColor),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton.primaryButton(
                      color: AppColors.forthColor,
                      title: "Confirm",
                      verticalPadding: 0,
                      horizontalPadding: 0,
                      borderColor: AppColors.primaryColor,
                      textColor: AppColors.blackColor,
                      onPressed: () {
                        pushMaterialPage(context, const ConfirmCartPage());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}