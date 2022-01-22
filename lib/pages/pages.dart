import 'add_phone/add_phone.dart';
import 'cart/cart_page.dart';
import 'contact_us/contact_us_page.dart';
import 'home/home_page.dart';
import 'log_in/log_in_page.dart';
import 'orders/orders_page.dart';
import 'phones/phones_page.dart';
import 'sign_up/view/sign_up_page_view.dart';

final pages = {
  '/': const HomePage(),
  '/phones': const PhonesPage(),
  '/signup':  const SignUpPage(),
  '/login': const LogInPage(),
  '/contactus': const ContactUsPage(),
  '/addphone': const AddPhonePage(),
  '/cart': const CartPage(),
  '/orders': const OrdersPage(),
};
