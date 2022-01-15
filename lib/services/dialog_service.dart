import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/models/dialog/dialog_reponse_model.dart';
import '../models/dialog/dialog_model.dart';

class DialogService {
  final GlobalKey<NavigatorState> _dialogNavigationKey =
      GlobalKey<NavigatorState>();

  late Function(DialogModel) _showDialogListener;

  Completer<DialogResponseModel> _dialogCompleter = Completer<DialogResponseModel>();

  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function(DialogModel) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<DialogResponseModel> showDialog({
    required String title,
    required String description,
    String buttonTitle = 'Ok',
  }) {
    _dialogCompleter = Completer<DialogResponseModel>();
    _showDialogListener(DialogModel(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _dialogCompleter.future;
  }

  /// Shows a confirmation dialog
  Future<DialogResponseModel> showConfirmationDialog({
    required String title,
    required String description,
    String confirmationTitle = 'Ok',
    String cancelTitle = 'Cancel',
  }) {
    _dialogCompleter = Completer<DialogResponseModel>();
    _showDialogListener(
      DialogModel(
        title: title,
        description: description,
        buttonTitle: confirmationTitle,
        cancelTitle: cancelTitle,
      ),
    );
    return _dialogCompleter.future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(DialogResponseModel response) {
    _dialogNavigationKey.currentState?.pop();
    _dialogCompleter.complete(response);
  }
}
