// import 'package:bloc/bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:dio/dio.dart';
// import 'dart:convert';
// import 'payment_state.dart';

// @injectable
// class PayPalPaymentCubit extends Cubit<PaymentState> {
//   PayPalPaymentCubit() : super(const PaymentState.initial());

//   Future<void> startPayPalPayment() async {
//     emit(const PaymentState.loading());
//     try {
//       // Step 1: Create a Payment Request (in real app, use PayPal SDK to create it)
//       final response = await Dio().post(
//         'http://localhost:3000/create-paypal-payment',
//         data: {
//           'amount': 50.00, // Amount in dollars (e.g., $50.00)
//           'currency': 'USD',
//         },
//       );

//       if (response.statusCode == 200) {
//         // Handle PayPal-specific payment approval and execute steps here
//         emit(const PaymentState.success());
//       } else {
//         emit(PaymentState.failure('Failed to create PayPal payment request'));
//       }
//     } catch (e) {
//       emit(PaymentState.failure(e.toString()));
//     }
//   }
// }
