import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/payment/cubit/payment_cubit.dart';
import 'package:untitled2/features/payment/cubit/payment_state.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentCubit = getIt<PaymentCubit>();

    return BlocProvider<PaymentCubit>(
      create: (context) => paymentCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stripe Payment Integration'),
        ),
        body: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return switch (state) {
              PaymentState.loading => const Center(child: CircularProgressIndicator()),
              PaymentState.success => const Center(child: Text('Payment Successful!')),
              PaymentState.failure(:final error) => Center(child: Text('Payment Failed: $error')),
              _ => Center(
                  child: ElevatedButton(
                    onPressed: () => context.read<PaymentCubit>().startPayment(),
                    child: Text('Pay Now'),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}
