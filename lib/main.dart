// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled2/core/di/configure_dependencies.dart';
// import 'package:untitled2/core/di/setup_dependencies.dart';
// import 'package:untitled2/features/news_feature/presentation/providers/news_provider.dart';
// import 'package:untitled2/features/news_feature/presentation/screens/news_screen.dart';

// void main() async{
//   //  await configureDependencies(); 
//   setupDependencies(); 
//   //  setupDependencies(); 
//  runApp(
//     ChangeNotifierProvider(
//       create: (_) => sl<NewsProvider>()..loadNews(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter News App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: NewsScreen(), 
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:untitled2/features/payment/presentation/pages/payment_page.dart';

void main() {
  StripePayment.setOptions(
    StripeOptions(
      publishableKey: 'pk_test_51RIptrRe9NpURKPfAwfpply82X2Q3ZlPTNvk2MWQQGFT3YO5js87zTSQ2cfN1dizonFci53KSuMbU1aLaHay2nNQ005y5fKVRC',
      merchantId: 'Test',
      androidPayMode: 'test',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe Payment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentScreen(
        clientSecret: 'your_client_secret_received_from_backend',
      ),
    );
  }
}
