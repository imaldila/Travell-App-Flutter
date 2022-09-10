import 'package:flutter/material.dart';

import '../widgets/custom_header.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  static const routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomHeader(
            title: 'Hotels',
          ),
        ],
      ),
    );
  }
}
