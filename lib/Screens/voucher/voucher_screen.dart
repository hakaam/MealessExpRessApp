import 'package:flutter/material.dart';
class VoucherScreen extends StatelessWidget {
  static  const String routeName = '/voucher';
  static Route  route(){
    return MaterialPageRoute(builder: (_)=>VoucherScreen(),
        settings: RouteSettings(name: routeName)
    );


  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
