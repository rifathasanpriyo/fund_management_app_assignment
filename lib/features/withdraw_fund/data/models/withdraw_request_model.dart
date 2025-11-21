import '../../domain/entities/withdraw_entity.dart';

class WithdrawModel extends WithdrawEntity {
  WithdrawModel({
    required super.amount,
    required super.bankAccount,
  });

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "bankAccount": bankAccount,
      };
}
