import 'package:flutter/material.dart';
import 'package:hlep/screens/auth/login_screen.dart';
import 'package:hlep/screens/auth/phoneNumber_screen.dart';
import 'package:hlep/screens/auth/phoneOTP_screen.dart';
import 'package:hlep/screens/auth/signup_screen.dart';
import 'package:hlep/screens/cart/paymentMethod_screen.dart';
import 'package:hlep/screens/home/home_screen.dart';
import 'package:hlep/screens/home/restaurant.dart';
import 'package:hlep/screens/home/summary_screen.dart';
import 'package:hlep/screens/cart/cart_screen.dart';
import 'package:hlep/screens/cart/checkout_screen.dart';
import 'package:hlep/screens/cart/olpayment.dart';
import 'package:hlep/screens/home/beverage_screen.dart';
import 'package:hlep/screens/cart/olpay_receipt.dart';

class AppRoutes {
  static const String login = '/login';
  static const String phoneNumber = '/phoneNumber';
  static const String phoneOTP = '/phoneOTP';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String restaurant = '/restaurant';
  static const String summary = '/summary';
  static const String cart = '/cart';
  static const String checkOut = '/checkOut';
  static const String beverage = '/beverage';
  static const String payment = '/payment';
  static const String olpayment = '/olpayment';
  static const String olreceipt = '/olreceipt';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case phoneNumber:
        return MaterialPageRoute(builder: (_) => PhoneNumberScreen());
      case phoneOTP:
        return MaterialPageRoute(builder: (_) => PhoneOTPScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => Signup());
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case restaurant:
        if (args is Map<String, dynamic> &&
            args.containsKey('restaurantKey') &&
            args.containsKey('restaurantIndex') &&
            args.containsKey('initialRestaurantIndex')) {
          return MaterialPageRoute(
            builder: (_) => RestaurantScreen(
              restaurantKey: args['restaurantKey'],
              restaurantIndex: args['restaurantIndex'],
              initialRestaurantIndex: args['initialRestaurantIndex'],
            ),
          );
        }
        return _errorRoute();
      case summary:
        return MaterialPageRoute(builder: (_) => SummaryScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case checkOut:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case beverage:
        return MaterialPageRoute(builder: (_) => const BeverageScreen());
      case payment:
        if (args is void Function(String)) {
          return MaterialPageRoute(
            builder: (_) => PaymentMethodScreen(onSelect: args),
          );
        }
        return _errorRoute();


      case olpayment:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => OLPaymentScreen(paymentType: args),
          );
        }
        return _errorRoute();
      case olreceipt:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => OLPaymentReceiptScreen(paymentType: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('No route defined for this screen')),
      ),
    );
  }
}
