import 'package:cathay_pay_ui/features/payment/ui/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:cathay_pay_ui/features/home/ui/home_screen.dart';
import 'package:cathay_pay_ui/features/qrcode/ui/qr_code_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    // const NotificationScreen(),
    const QrCodeScreen(),
    // Add more slides
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.grey.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                size: 35,
                color: Color(0xff005d63),
              ),
              onPressed: () {
                setState(
                  () {
                    currentScreen = const HomeScreen();
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.qr_code_scanner,
                size: 45,
                color: Color(0xff005d63),
              ),
              onPressed: () {
                setState(
                  () {
                    currentScreen = const QrCodeScreen();
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.credit_card,
                size: 35,
                color: Color(0xff005d63),
              ),
              onPressed: () => {
                setState(
                  () {
                    currentScreen = const PaymentScreen();
                  },
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}