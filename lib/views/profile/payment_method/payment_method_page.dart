import 'package:flutter/material.dart';

import '../../../core/constants/app_defaults.dart';

import '../../../core/components/app_back_button.dart';
import 'components/new_card_row.dart';
import 'components/default_card.dart';
import 'components/payment_option_tile.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Payment Option'),
      ),
      body: Column(
        children: [
          const SizedBox(height: AppDefaults.padding),
          const AddNewCardRow(),
          const PaymentDefaultCard(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Text(
                'Other Payment Option',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          PaymentOptionTile(
            icon: 'https://img.picui.cn/free/2025/06/24/6859892f74afc.png',
            label: 'Stripe',
            accountName: 'Secure online payment with Stripe',
            onTap: () {},
          ),
          PaymentOptionTile(
            icon: 'https://i.imgur.com/aRJj3iU.png',
            label: 'Cash on Delivery',
            accountName: 'Pay in Cash',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
