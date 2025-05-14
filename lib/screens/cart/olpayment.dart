import 'package:Mxels/routes/app_routes.dart';

class OLPaymentScreen extends StatelessWidget {
  final String paymentType;
  final double amount;
  final String? orderType; 

  const OLPaymentScreen({
    super.key,
    required this.paymentType,
    required this.amount,
    this.orderType, 
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isGcash = paymentType == 'GCash';
    final color = isGcash ? Color(0xFF007DFE) : Color(0xFF06A555);
    final imagePath = isGcash ? 'assets/img/gcash_logo.png' : 'assets/img/maya_logo.png';

    return Scaffold(
      appBar: AppBar( backgroundColor: color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: screenHeight * 0.3,
            width: double.infinity,
            color: color,
          ),
          Positioned(
            top: -20,
            child: Image.asset(
              imagePath,
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 120, 16, 0),
            child: Container(
              width: 380,
              height: 500,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Seamoney Credit',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'PAY WITH',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(paymentType, style: TextStyle(fontSize: 16)),
                          Text(
                            'Pay now',
                            style: TextStyle(fontSize: 14, color: color),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('PHP ${10000.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                          Text('Available balance', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'YOU ARE ABOUT TO PAY',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount', style: TextStyle(fontSize: 16)),
                      Text('PHP ${amount.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('PHP ${amount.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Spacer(),
                  Text(
                    'Please review to ensure that the details are correct before you proceed',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to OLPaymentReceiptScreen with the orderType
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OLPaymentReceiptScreen(
                            paymentType: paymentType,
                            orderType: orderType ?? '',
                            amount: amount,
                          ),
                        ),
                      );
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      );
                    }, child: const Text('Pay'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                    ),

                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
