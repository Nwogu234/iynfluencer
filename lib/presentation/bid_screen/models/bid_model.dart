class BidModel {
  String? jobId;
  String? coverLetter;
  int? price;
  List<String>? terms;

  BidModel({this.jobId, this.coverLetter, this.price, this.terms});

  BidModel.fromJson(Map<String, dynamic> json) {
    jobId = json['jobId'];
    coverLetter = json['coverLetter'];
    price = json['price'];
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobId'] = this.jobId;
    data['coverLetter'] = this.coverLetter;
    data['price'] = this.price;
    data['terms'] = this.terms;
    return data;
  }
}
