import 'package:admin/utility/extensions.dart';

import '../../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utility/constants.dart';
import 'chart.dart';
import 'order_info_card.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        //TODO: should complete Make this order number dynamic bt calling calculateOrdersWithStatus
        int totalOrder = context.dataProvider.calculateOrdersWithStatus();
        int pendingOrder = context.dataProvider.calculateOrdersWithStatus(status: 'pending');;
        int processingOrder = context.dataProvider.calculateOrdersWithStatus(status: 'processing');;
        int cancelledOrder = context.dataProvider.calculateOrdersWithStatus(status: 'cancelled');;
        int shippedOrder = context.dataProvider.calculateOrdersWithStatus(status: 'shipped');;
        int deliveredOrder = context.dataProvider.calculateOrdersWithStatus(status: 'delivered');;
        return Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Orders Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: defaultPadding),
              Chart(),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery1.svg",
                title: "All Orders",
                totalOrder: totalOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery5.svg",
                title: "Pending Orders",
                totalOrder: pendingOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery6.svg",
                title: "Processed Orders",
                totalOrder: processingOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery2.svg",
                title: "Cancelled Orders",
                totalOrder: cancelledOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery4.svg",
                title: "Shipped Orders",
                totalOrder: shippedOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery3.svg",
                title: "Delivered Orders",
                totalOrder: deliveredOrder,
              ),
            ],
          ),
        );
      },
    );
  }
}
