import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          SizedBox(
            height: 30,
            child: Image.asset('assets/images/logo.png'),
            // child: SvgPicture.asset('assets/images/logo.svg')
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // home
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.home_rounded),
                label: const Text('Home'),
              ),
              // register
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add_rounded),
                label: const Text('Register'),
              ),
              // login
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.login_rounded),
                label: const Text('Login'),
              ),
              // cart
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_rounded),
                label: const Text('Cart'),
              ),
              // contact
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.contact_page_rounded),
                label: const Text('Contact'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
