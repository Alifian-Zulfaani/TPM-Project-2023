import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConvert());
}

class CurrencyConvert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyConvertPage(),
    );
  }
}

class CurrencyConvertPage extends StatefulWidget {
  @override
  _CurrencyConvertPageState createState() => _CurrencyConvertPageState();
}

class _CurrencyConvertPageState extends State<CurrencyConvertPage> {
  double amount = 0.0;
  double convertedAmount = 0.0;
  String selectedCurrencyFrom = 'IDR';
  String selectedCurrencyTo = 'USD';

  final Map<String, double> conversionRates = {
    'IDR': 1, // 1 IDR = 1 IDR
    'USD': 0.000070, // 1 USD = 0.000070 IDR
    'SAR': 0.00026, // 1 SAR = 0.00026 IDR
    'CNY': 0.00046, // 1 CNY = 0.00046 IDR
    'EUR': 0.000081, // 1 EUR = 0.000081 IDR
  };

  void convertCurrency() {
    setState(() {
      double rateFrom = conversionRates[selectedCurrencyFrom]!;
      double rateTo = conversionRates[selectedCurrencyTo]!;
      convertedAmount = (amount / rateFrom) * rateTo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFA8181),
              const Color(0xFFEF9A9A), // Warna gradient kedua
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCurrencyFrom,
                    onChanged: (value) {
                      setState(() {
                        selectedCurrencyFrom = value!;
                      });
                    },
                    items: conversionRates.keys.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'From',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCurrencyTo,
                    onChanged: (value) {
                      setState(() {
                        selectedCurrencyTo = value!;
                      });
                    },
                    items: conversionRates.keys.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'To',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Converted Amount: ${convertedAmount.toStringAsFixed(2)} ${selectedCurrencyTo.toUpperCase()}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
