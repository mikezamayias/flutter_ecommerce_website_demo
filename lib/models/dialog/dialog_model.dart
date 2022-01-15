class DialogModel {
  final String title;
  final String description;
  final String buttonTitle;
  final String? cancelTitle;

  DialogModel({
    required this.title,
    required this.description,
    required this.buttonTitle,
    this.cancelTitle,
  });
}
