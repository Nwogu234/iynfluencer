class TransactionResponse {
  List<TransactionDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  int? prevPage;
  int? nextPage;

  TransactionResponse({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  
  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      docs: (json['docs'] as List<dynamic>?)
          ?.map((item) => TransactionDoc.fromJson(item))
          .toList(),
      totalDocs: json['totalDocs'],
      limit: json['limit'],
      totalPages: json['totalPages'],
      page: json['page'],
      pagingCounter: json['pagingCounter'],
      hasPrevPage: json['hasPrevPage'],
      hasNextPage: json['hasNextPage'],
      prevPage: json['prevPage'],
      nextPage: json['nextPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docs': docs?.map((doc) => doc.toJson()).toList(),
      'totalDocs': totalDocs,
      'limit': limit,
      'totalPages': totalPages,
      'page': page,
      'pagingCounter': pagingCounter,
      'hasPrevPage': hasPrevPage,
      'hasNextPage': hasNextPage,
      'prevPage': prevPage,
      'nextPage': nextPage,
    };
  }
}

class TransactionDoc {
  String? id;
  String? userId;
  String? accountNumber;
  String? bankName;
  String? accountName;
  int? amount;
  bool? cleared;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  TransactionDoc({
    this.id,
    this.userId,
    this.accountNumber,
    this.bankName,
    this.accountName,
    this.amount,
    this.cleared,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TransactionDoc.fromJson(Map<String, dynamic> json) {
    return TransactionDoc(
      id: json['_id'],
      userId: json['userId'],
      accountNumber: json['accountNumber'],
      bankName: json['bankName'],
      accountName: json['accountName'],
      amount: json['amount'],
      cleared: json['cleared'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'accountNumber': accountNumber,
      'bankName': bankName,
      'accountName': accountName,
      'amount': amount,
      'cleared': cleared,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}