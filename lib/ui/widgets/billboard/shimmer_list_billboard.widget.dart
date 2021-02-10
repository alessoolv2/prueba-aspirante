import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'grid_view_item_shimmer.widget.dart';

//Loader billboard list
class ShimmerListBillboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Container(
            margin: const EdgeInsets.only(
                left: 16, right: 16, top: 20),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 29.0,
              mainAxisSpacing: 24.0,
              childAspectRatio: 0.70,
              children: List<Widget>.generate(8, (int index) {
                return GridViewItemShimmer();
              }),
            ),
          ),
        ),
    );
  }
}

