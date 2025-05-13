class DeliveryOption {
  final String label;
  final String time;
  final double price;

  DeliveryOption({
    required this.label,
    required this.time,
    required this.price,
  });
}

final List<DeliveryOption> deliveryOptions = [
  DeliveryOption(label: 'Priority', time: '10-15 mins', price: 25.0),
  DeliveryOption(label: 'Normal', time: '15-25 mins', price: 0.0),
  DeliveryOption(label: 'Saver', time: '25-40 mins', price: -10.0),
];
