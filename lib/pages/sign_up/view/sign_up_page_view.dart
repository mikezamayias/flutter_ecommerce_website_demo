import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/widgets/busy_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';
import '../../../services/form_service.dart';
import '../components/sign_up_text_input_fields.dart';
import '../view_model/sign_up_page_view_model.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpPageViewModel>.reactive(
      viewModelBuilder: () => SignUpPageViewModel(),
      builder: (
        BuildContext context,
        SignUpPageViewModel model,
        Widget? child,
      ) {
        return Form(
          key: locator<FormService>().signUpFormKey,
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
            return AnimatedContainer(
              alignment: Alignment.topCenter,
              constraints: sizingInformation.isDesktop
                  ? const BoxConstraints(maxWidth: 1200)
                  : const BoxConstraints(),
              duration: const Duration(milliseconds: 60),
              padding: sizingInformation.isDesktop
                  ? const EdgeInsets.symmetric(horizontal: 90)
                  : const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.headline2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    if (sizingInformation.isDesktop)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: signUpFormFields.sublist(0, 5).map(
                                (item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 9,
                                    ),
                                    child: item,
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: signUpFormFields.sublist(5).map(
                                (item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 9,
                                    ),
                                    child: item,
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      )
                    else
                      ...signUpFormFields,
                    Text(
                      'By signing up, you agree to our Terms, Data and Cookies Policy.',
                      style: Theme.of(context).textTheme.subtitle2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    BusyButton(
                      title: 'Sign Up',
                      onPressed: () {},
                    ),
                  ].map(
                    (item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: item,
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
