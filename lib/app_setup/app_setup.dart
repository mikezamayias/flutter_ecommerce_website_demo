import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../pages/add_phone/add_phone_page_view.dart';
import '../pages/cart/cart_page_view.dart';
import '../pages/contact_us/contact_us_page_view.dart';
import '../pages/home/home_page_view.dart';
import '../pages/log_in/log_in_page_view.dart';
import '../pages/orders/orders_page.dart';
import '../pages/phones/phones_page_view.dart';
import '../pages/sign_up/view/sign_up_page_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomePageView, initial: true),
    MaterialRoute(page: PhonesPageView),
    MaterialRoute(page: SignUpPageView),
    MaterialRoute(page: LogInPageView),
    MaterialRoute(page: CartPageView),
    MaterialRoute(page: OrdersPageView),
    MaterialRoute(page: ContactUsPageView),
    MaterialRoute(page: AddPhonePageView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
  ],
  locatorName: 'stackedLocator',
  locatorSetupName: 'setupStackedLocator',
)
class AppSetup {}
