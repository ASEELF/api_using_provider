

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/payment/cubit/paypal_payment_cubit.dart';

class PayPalPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final payPalPaymentCubit = getIt<PayPalPaymentCubit>();

    return BlocProvider<PayPalPaymentCubit>(
      create: (context) => payPalPaymentCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PayPal Payment Integration'),
        ),
        body: BlocBuilder<PayPalPaymentCubit, PaymentState>(
          builder: (context, state) {
            return switch (state) {
              PaymentState.loading => const Center(child: CircularProgressIndicator()),
              PaymentState.success => const Center(child: Text('PayPal Payment Successful!')),
              PaymentState.failure(:final error) => Center(child: Text('PayPal Payment Failed: $error')),
              _ => Center(
                  child: ElevatedButton(
                    onPressed: () => context.read<PayPalPaymentCubit>().startPayPalPayment(),
                    child: Text('Pay with PayPal'),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}
