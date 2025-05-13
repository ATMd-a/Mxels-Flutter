import 'app_routes.dart';

export 'package:flutter/material.dart';
export 'package:Mxels/screens/auth/login_screen.dart';
export 'package:Mxels/screens/auth/phoneNumber_screen.dart';
export 'package:Mxels/screens/auth/phoneOTP_screen.dart';
export 'package:Mxels/screens/auth/signup_screen.dart';
export 'package:Mxels/screens/auth/facebook.dart';

export 'package:Mxels/screens/home/home_screen.dart';
export 'package:Mxels/screens/home/restaurant.dart';
export 'package:Mxels/screens/home/perResto.dart';

export 'package:Mxels/screens/cart/cart_screen.dart';
export 'package:Mxels/screens/cart/checkoutPickUp_screen.dart';
export 'package:Mxels/screens/cart/checkoutDelivery_screen.dart';
export 'package:Mxels/screens/cart/paymentMethod_screen.dart';
export 'package:Mxels/screens/cart/olpayment.dart';
export 'package:Mxels/screens/cart/olpay_receipt.dart';
export 'package:Mxels/screens/cart/qr_screen.dart';
export 'package:Mxels/screens/cart/trackDelivery.dart';

class AppRoutes {
  static const String login = '/login';
  static const String phoneNumber = '/phoneNumber';
  static const String phoneOTP = '/phoneOTP';
  static const String signup = '/signup';
  static const String fb = '/fb';

  static const String home = '/home';
  static const String restaurant = '/restaurant';
  static const String resto = '/resto';

  static const String cart = '/cart';
  static const String checkOutP = '/checkOutP';
  static const String checkOutD = '/checkOutD';
  static const String payment = '/payment';
  static const String olpayment = '/olpayment';
  static const String olreceipt = '/olreceipt';
  static const String qrscreen = '/qrscreen';
  static const String track = '/track';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
    // Auth routes
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case phoneNumber:
        return MaterialPageRoute(builder: (_) => const PhoneNumberScreen());
      case phoneOTP:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => PhonePassScreen(phoneNumber: args),
          );
        }
        return _errorRoute();
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case fb:
        return MaterialPageRoute(builder: (_) => const FacebookScreen());

    // Home & Restaurant routes
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case restaurant:
        return MaterialPageRoute(builder: (_) => const RestaurantScreen());
      case resto:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => RestoScreen(restaurantKey: args),
          );
        }
        return _errorRoute();


    // Cart and Checkout routes
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case checkOutP:
        return MaterialPageRoute(builder: (_) => const CheckoutScreenP());
      case checkOutD:
        return MaterialPageRoute(builder: (_) => const CheckoutScreenD());
      case qrscreen:
        return MaterialPageRoute(builder: (_) => const QRScreen());
      case track:
        return MaterialPageRoute(builder: (_) => const TrackDeliveryScreen());


      case olpayment:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => OLPaymentScreen(
              paymentType: args['paymentType'],
              amount: args['amount'],
              orderType: args['orderType'], // can be null now
            ),
          );
        }
        return _errorRoute();


      case olreceipt:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => OLPaymentReceiptScreen(
              paymentType: args['paymentType'],
              orderType: args['orderType'],
              amount: args['amount'],
            ),
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
