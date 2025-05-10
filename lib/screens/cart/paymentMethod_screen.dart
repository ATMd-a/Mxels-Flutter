import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  final void Function(String) onSelect;

  const PaymentMethodScreen({super.key, required this.onSelect});

  void _selectAndReturn(BuildContext context, String method) {
    onSelect(method);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Payment Method')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('GCash'),
            onTap: () => _selectAndReturn(context, 'GCash'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Maya Wallet'),
            onTap: () => _selectAndReturn(context, 'Maya Wallet'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Cash'),
            onTap: () => _selectAndReturn(context, 'Cash'),
          ),
        ],
      ),
    );
  }
}
