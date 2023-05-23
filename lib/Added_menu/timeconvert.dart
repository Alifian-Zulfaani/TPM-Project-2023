import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TimeConvertPage extends StatefulWidget {
  @override
  _TimeConvertPage createState() => _TimeConvertPage();
}

class _TimeConvertPage extends State<TimeConvertPage> {
  String _timeString = '';
  String _zoneWaktu = 'WIB';
  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting(); // inisialisasi format tanggal
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    setState(() {
      now = DateTime.now();
      _timeString = DateFormat('HH:mm:ss').format(now);
    });
  }

  void _getWaktu() {
    setState(() {
      switch (_zoneWaktu) {
        case 'WIB': // Universal Time Coordinate
          now = now.toUtc().add(Duration(hours: 7));
          break;
        case 'WITA':
          now = now.toUtc().add(Duration(hours: 8));
          break;
        case 'WIT':
          now = now.toUtc().add(Duration(hours: 9));
          break;
        case 'London':
          now = now.toUtc().add(Duration(hours: 1));
          break;
        case 'Beijing':
          now = now.toUtc().add(Duration(hours: 8));
          break;
        default:
          now = DateTime.now();
      }
      _timeString = DateFormat('HH:mm:ss').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    _getWaktu();
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA),
      appBar: AppBar(
        title: Text('Time Converter'),
        backgroundColor:Colors.grey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF81D4FA), // Warna gradient pertama
              Color(0xFFEF9A9A), // Warna gradient kedua
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat('EEEE', 'id_ID').format(now),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              DateFormat('dd MMMM yyyy').format(now),
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _timeString,
              style: TextStyle(fontSize: 60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'WIB',
                  groupValue: _zoneWaktu,
                  onChanged: (value) {
                    setState(() {
                      _zoneWaktu = value!;
                    });
                  },
                ),
                Text('WIB'),
                Radio<String>(
                  value: 'WITA',
                  groupValue: _zoneWaktu,
                  onChanged: (value) {
                    setState(() {
                      _zoneWaktu = value!;
                    });
                  },
                ),
                Text('WITA'),
                Radio<String>(
                  value: 'WIT',
                  groupValue: _zoneWaktu,
                  onChanged: (value) {
                    setState(() {
                      _zoneWaktu = value!;
                    });
                  },
                ),
                Text('WIT'),
                Radio<String>(
                  value: 'London',
                  groupValue: _zoneWaktu,
                  onChanged: (value) {
                    setState(() {
                      _zoneWaktu = value!;
                    });
                  },
                ),
                Text('London'),
                Radio<String>(
                  value: 'Beijing',
                  groupValue: _zoneWaktu,
                  onChanged: (value) {
                    setState(() {
                      _zoneWaktu = value!;
                    });
                  },
                ),
                Text('Beijing'),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
