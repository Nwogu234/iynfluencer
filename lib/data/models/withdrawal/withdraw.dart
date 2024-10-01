import 'dart:convert';
import 'dart:io';

class WithdrawModel{
  final String userId;
  final String accountNumber;
  final String bankName;
  final String accountName;
  final int amount;

  WithdrawModel({
    required this.userId,
    required this.accountNumber,
    required this.bankName,
    required this.accountName,
    required this.amount,
  });

  
  factory WithdrawModel.fromJson(Map<String, dynamic> json) {
    return WithdrawModel(
      userId: json['userId'] as String,
      accountNumber: json['accountNumber'] as String,
      bankName: json['bankName'] as String,
      accountName: json['accountName'] as String,
      amount: json['balance'] ?? 0,
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'accountNumber': accountNumber,
      'bankName':  bankName,
      'accountName': accountName,
      'amount': amount,
    };
  }
}

 