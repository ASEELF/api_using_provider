import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'payment_state.dart';

class PaymentEvent {}

class StartPaymentEvent extends PaymentEvent {
  final String clientSecret;

  StartPaymentEvent(this.clientSecret);
}

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is StartPaymentEvent) {
      yield* _mapStartPaymentEventToState(event.clientSecret);
    }
  }

  Stream<PaymentState> _mapStartPaymentEventToState(String clientSecret) async* {
    yield state.copyWith(status: PaymentStatus.loading);

    try {
      // You would call the Stripe Flutter SDK to handle the payment here.
      // For demonstration, we are mocking a successful payment.
      final paymentIntent = await StripePayment.confirmPaymentIntent(
        PaymentIntent(clientSecret: clientSecret),
      );
      if (paymentIntent.status == 'succeeded') {
        yield state.copyWith(
          status: PaymentStatus.success,
          message: 'Payment successful!',
        );
      } else {
        yield state.copyWith(
          status: PaymentStatus.failure,
          message: 'Payment failed!',
        );
      }
    } catch (e) {
      yield state.copyWith(
        status: PaymentStatus.failure,
        message: 'Error: $e',
      );
    }
  }
}
