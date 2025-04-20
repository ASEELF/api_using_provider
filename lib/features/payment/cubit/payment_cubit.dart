import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'payment_state.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState.initial());

  Future<void> startPayment() async {
    emit(const PaymentState.loading());
    try {
      // Step 1: Call Backend to Create Payment Intent
      final response = await Dio().post(
        'http://localhost:3000/create-payment-intent',
        data: {
          'amount': 5000, // Amount in cents (e.g., $50.00)
          'currency': 'usd',
        },
      );

      if (response.statusCode == 200) {
        final paymentIntentData = jsonDecode(response.data);
        final clientSecret = paymentIntentData['clientSecret'];

        // Step 2: Confirm the Payment Intent using flutter_stripe
        await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          applePay: true,
          googlePay: true,
          // style: ThemeMode.light,
          merchantCountryCode: 'US',
          merchantDisplayName: 'Demo Merchant',
          
        ));

        // Step 3: Present the Payment Sheet
        await Stripe.instance.presentPaymentSheet();

        emit(const PaymentState.success());
      } else {
        emit(PaymentState.failure('Failed to create payment intent'));
      }
    } catch (e) {
      emit(PaymentState.failure(e.toString()));
    }
  }
}
