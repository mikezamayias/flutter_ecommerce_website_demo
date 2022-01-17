class DialogRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final String? cancelTitle;

  DialogRequest({
    required this.title,
    required this.description,
    required this.buttonTitle,
    this.cancelTitle,
  });
}
