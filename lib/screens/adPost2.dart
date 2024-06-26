import 'package:flutter/material.dart';
import 'package:my_app/dropdowns/condition.dart';
import 'package:my_app/dropdowns/fuel.dart';
import 'package:my_app/dropdowns/origin.dart';
import 'package:my_app/dropdowns/vehicle_make.dart';
import 'package:my_app/dropdowns/vehicle_model.dart';
import 'package:my_app/screens/AdPost1.dart';

class AdPost2 extends StatefulWidget {
  const AdPost2({super.key});

  @override
  _AdPost2State createState() => _AdPost2State();
}

List<String> makes = [
  'Toyota',
  'Nissan',
  'Audi',
  'BMW',
  'Mercedes',
  'Honda',
];
List<String> models = [
  'Corolla',
  'Vitz',
  'Q2',
  '3 Series',
  'Benz',
  'Civic',
];
List<String> origin = [
  'Local',
  'Japan',
  'UK',
  'Germany',
  'USA',
  'India',
];

List<String> conditions = [
  'New',
  'Used',
  'Reconditioned',
];

List<String> fuel = [
  'Petrol',
  'Diesel',
  'Electric',
  'Hybrid',
  'Any',
];

class _AdPost2State extends State<AdPost2> {
  String? _selectedMake;
  String? _selectedModel;
  String? _selectedOrigin;
  String? _selectedCondition;
  String? _selectedFuel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Post Ad',
          style: TextStyle(
            color: Color(0xFFFF5C01),
            fontSize: 27,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildDropdown(
                      'Make',
                      VehicleMake(
                        selectedMake: _selectedMake,
                        makes: makes,
                        onChanged: (String? make) {
                          setState(() {
                            _selectedMake = make;
                          });
                        },
                      ),
                    ),
                    buildDropdown(
                      'Model',
                      VehicleModel(
                        selectedModel: _selectedModel,
                        models: models,
                        onChanged: (String? model) {
                          setState(() {
                            _selectedModel = model;
                          });
                        },
                      ),
                    ),
                    buildDropdown(
                      'Origin',
                      Origin(
                        selectedOrigin: _selectedOrigin,
                        origin: origin,
                        onChanged: (String? origin) {
                          setState(() {
                            _selectedOrigin = origin;
                          });
                        },
                      ),
                    ),
                    buildDropdown(
                      'Condition',
                      Condition(
                        selectedCondition: _selectedCondition,
                        condition: conditions,
                        onChanged: (String? condition) {
                          setState(() {
                            _selectedCondition = condition;
                          });
                        },
                      ),
                    ),
                    buildDropdown(
                      'Fuel',
                      Fuel(
                        selectedFuel: _selectedFuel,
                        fuel: fuel,
                        onChanged: (String? fuel) {
                          setState(() {
                            _selectedFuel = fuel;
                          });
                        },
                      ),
                    ),
                    buildYearInput(),
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, Widget dropdown) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 100),
          Expanded(child: dropdown),
        ],
      ),
    );
  }

  Widget buildYearInput() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Year',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 105),
          Expanded(
            child: InputFields(hintText: 'Year', width1: 1),
          ),
        ],
      ),
    );
  }
}
