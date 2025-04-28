import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/payment/cubit/payment_bloc.dart';
import 'package:untitled2/features/payment/cubit/payment_state.dart';

class PaymentScreen extends StatelessWidget {
  final String clientSecret;

  const PaymentScreen({required this.clientSecret});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Payment'),
      ),
      body: BlocProvider(
        create: (_) => PaymentBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<PaymentBloc, PaymentState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status, // Optimizing rebuilds
                builder: (context, state) {
                  if (state.status == PaymentStatus.loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state.status == PaymentStatus.success) {
                    return Column(
                      children: [
                        Text(state.message),
                        Icon(Icons.check_circle, color: Colors.green),
                      ],
                    );
                  } else if (state.status == PaymentStatus.failure) {
                    return Column(
                      children: [
                        Text(state.message),
                        Icon(Icons.error, color: Colors.red),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Text('Ready to make a payment!'),
                        ElevatedButton(
                          onPressed: () {
                            // Trigger the StartPaymentEvent
                            context.read<PaymentBloc>().add(
                                  StartPaymentEvent(clientSecret),
                                );
                          },
                          child: Text('Pay Now'),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
