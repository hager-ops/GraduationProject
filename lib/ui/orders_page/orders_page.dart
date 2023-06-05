import 'package:ecosofe_app/common/empty_view_body.dart';
import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:ecosofe_app/ui/orders_page/delivered_view_widget.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Orders",
          style: TextStyles.bold(color: AppColors.forthColor,fontSize: 20),
          textAlign: TextAlign.center,
        ),
        bottom: TabBar(
          unselectedLabelColor: AppColors.textPrimaryColor,
          labelColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
          dividerColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              child: Text("Active",
              ),
            ),
            Tab(
              child: Text("Delivered",
              ),
            )
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: const [
          EmptyViewBody(
            text: "No Result",
            image: "images/common/appLogo.png",
          ),
          DeliveredViewWidget(),
        ],
      ),
    );
  }
}
