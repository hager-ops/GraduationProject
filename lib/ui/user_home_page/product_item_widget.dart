import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/domain/product/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback addFun;
  final VoidCallback removeFun;

  const ProductItem(
      {super.key,
      required this.product,
      required this.addFun,
      required this.removeFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            width: 1, style: BorderStyle.solid, color: AppColors.forthColor),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                product.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyles.bold(fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                '${product.priceForPiece} LE / Piece',
                style: TextStyles.bold(color: AppColors.primaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: removeFun,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          color: AppColors.borderPrimaryColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    product.count.toString(),
                    style: TextStyles.regular(),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: addFun,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 18,
                          color: AppColors.borderPrimaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
