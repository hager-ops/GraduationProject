import 'package:ecosofe_app/common/extenstions.dart';
import 'package:ecosofe_app/common/utils/app_buttons.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/data/dunmy_data.dart';
import 'package:ecosofe_app/domain/product/product_model.dart';
import 'package:ecosofe_app/domain/product/profuct_type.dart';
import 'package:ecosofe_app/ui/cart_page/cart_page.dart';
import 'package:ecosofe_app/ui/host_page.dart';
import 'package:ecosofe_app/ui/user_home_page/product_item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductEnum productType = ProductEnum.allItems;
  List<String> filterList = [
    'All Items',
    'Plastic',
    'Metal',
    "Used Oil",
    "Paper"
  ];

  List<Product> currentProducts = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  alignment: Alignment.topRight,
                  child: Text(
                    "Hey there",
                    style: TextStyles.bold(
                      fontSize: 20,
                      color: AppColors.forthColor,
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  child: Icon(
                    Icons.notifications_on_rounded,
                    color: AppColors.forthColor,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "separate your waste...",
                style: TextStyles.regular(
                  color: AppColors.forthColor,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: filterList.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: FilterChip(
                      showCheckmark: false,
                      label: Text(
                        filterList[index],
                      ),
                      selectedColor: AppColors.forthColor,
                      side: const BorderSide(color: Colors.white, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      disabledColor: Colors.redAccent,
                      backgroundColor: AppColors.primaryColor,
                      onSelected: (value) {
                        if (value) {
                          productType = ProductEnum.values[index];
                          loadData();
                          setState(() {});
                        }
                      },
                      selected: productType == ProductEnum.values[index],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  shrinkWrap: true,
                  itemCount: currentProducts.length,
                  itemBuilder: (context, index) {
                    Product currentProduct = products[index];
                    return ProductItem(
                      product: currentProduct,
                      addFun: () {
                        products = products.map((e) {
                          if (e.name == currentProduct.name &&
                              e.category == currentProduct.category) {
                            return e.modify(count: e.count + 1);
                          }
                          return e;
                        }).toList();
                        setState(() {});
                      },
                      removeFun: () {
                        if (currentProduct.count > 0) {
                          products = products.map((e) {
                            if (e.name == currentProduct.name &&
                                e.category == currentProduct.category) {
                              return e.modify(count: e.count - 1);
                            }
                            return e;
                          }).toList();
                          setState(() {});
                        }
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: AppButton.primaryButton(
          color: AppColors.forthColor,
          title: "Next",
          verticalPadding: 0,
          horizontalPadding: 0,
          borderColor: AppColors.primaryColor,
          textColor: AppColors.primaryColor,
          onPressed: () {
            for (Product item in products) {
              if (item.count != 0) {
                final index = cardProducts
                    .firstIndexWhere((element) => element.name == item.name);
                if (index == null) {
                  cardProducts.add(item);
                } else {
                  cardProducts[index] = item;
                }
              }
            }
            setState(() {});
            HostPage.tabsController.jumpToTab(1);
          },
        ),
      ),
    );
  }

  void loadData() {
    if (productType == ProductEnum.allItems) {
      currentProducts = products;
    } else {
      currentProducts = [];
      products.map((e) {
        if (e.category == productType) {
          currentProducts.add(e);
        }
      }).toList();
    }
  }
}
