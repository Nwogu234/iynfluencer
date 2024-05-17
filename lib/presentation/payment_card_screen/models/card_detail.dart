class CardDetail {
  final String number;
  final int expirationYear;
  final int expirationMonth;
  final String cvc;
  final String name;

  CardDetail({
    required this.number,
    required this.expirationYear,
    required this.expirationMonth,
    required this.cvc,
    required this.name
  });

   Map<String, dynamic> toJson() {
    return {
      'number': number,
      'expirationYear': expirationYear,
      'expirationMonth': expirationMonth,
      'cvc': cvc,
      'name': name,
    };
  }
}
