
import 'package:equatable/equatable.dart';

enum PaymentStatus { initial, loading, success, failure }

class PaymentState extends Equatable {
  final PaymentStatus status;
  final String message;

  const PaymentState({
    this.status = PaymentStatus.initial,
    this.message = '',
  });

  PaymentState copyWith({
    PaymentStatus? status,
    String? message,
  }) {
    return PaymentState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, message];
}
