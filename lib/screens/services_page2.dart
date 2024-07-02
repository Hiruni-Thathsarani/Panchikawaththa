import 'package:flutter/material.dart';
import 'package:my_app/screens/services.dart';

class ScheduleServiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScheduleServicePage(),
    );
  }
}

class ScheduleServicePage extends StatefulWidget {
  @override
  _ScheduleServicePageState createState() => _ScheduleServicePageState();
}

class _ScheduleServicePageState extends State<ScheduleServicePage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);
  String reminder = '2 hours before the service';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engine Oil Change'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ServicesListPage();
            }));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/scooter.png',
                    height: 150,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aether 450X',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('XX 03 YY 9797'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Business Name', style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text('Brake Pads',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                    onTap: _selectDate,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text('${selectedTime.format(context)}'),
                    onTap: _selectTime,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: reminder,
              onChanged: (String? newValue) {
                setState(() {
                  reminder = newValue!;
                });
              },
              items: <String>[
                '1 hour before',
                '2 hours before the service',
                '1 day before'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            const Text('Service Center Location', style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text('Aether Center Chennai',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Description', style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text(
              'Too much dirt and noise build-up',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle schedule button action
                },
                child: Text('Schedule'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }
}
