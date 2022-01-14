class FooterInfoFieldModel {
  String key;
  String value;

  FooterInfoFieldModel({
    required this.key,
    required this.value,
  });
}

List<FooterInfoFieldModel> footerInfoFields = [
  FooterInfoFieldModel(key: 'Address', value: 'Heraclio, Greece'),
  FooterInfoFieldModel(key: 'Phone', value: '+30 210-123-4567'),
  FooterInfoFieldModel(key: 'Email', value: 'mzamagias@gmail.com'),
  FooterInfoFieldModel(key: 'About Us', value: '@mzamayias'),
];
