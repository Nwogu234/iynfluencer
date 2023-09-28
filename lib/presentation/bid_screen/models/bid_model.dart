class BidModel {
  String? jobId;
  String? coverLetter;
  int? price;

  BidModel({this.jobId, this.coverLetter, this.price});

  BidModel.fromJson(Map<String, dynamic> json) {
    jobId = json['jobId'];
    coverLetter = json['coverLetter'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobId'] = this.jobId;
    data['coverLetter'] = this.coverLetter;
    data['price'] = this.price;
    return data;
  }
}
