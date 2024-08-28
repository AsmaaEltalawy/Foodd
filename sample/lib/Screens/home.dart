import 'package:flutter/material.dart';
import 'package:sample/services/data_model.dart';
import 'package:sample/services/survey_service.dart';

class SurveyFromApiScreen extends StatefulWidget {
  const SurveyFromApiScreen({super.key});

  @override
  State<SurveyFromApiScreen> createState() => _SurveyFromApiScreenState();
}

class _SurveyFromApiScreenState extends State<SurveyFromApiScreen> {
  List<SurveyDataModel> _surveyData = []; // Store the data as DataModel
  bool _isLoading = true;
  String? _errorMessage;
  final String surveyId = '67d5d552b8036e3e24769144'; // Survey ID
  final SurveyService _surveyService = SurveyService(); // Creating an instance of the service

  @override
  void initState() {
    super.initState();
    fetchSurveyData();
  }

  // Fetch data from the API using the service
  Future<void> fetchSurveyData() async {
    try {
      final data = await _surveyService.fetchCsvData();
      setState(() {
        _surveyData = data; // Store the data containing DataModel
        _isLoading = false;
      });
      print('Survey Data: $_surveyData'); // Print data for verification
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    if (_surveyData.isEmpty) {
      return const Center(child: Text("No Data Available"));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Survey Data')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Gender')),  // Gender
              DataColumn(label: Text('Current Living Area')),  // Current Living Area
              DataColumn(label: Text('Household Size')),  // Household Size
              DataColumn(label: Text('Main Reason for Living Here')),  // Main Reason for Living
              DataColumn(label: Text('Cost of Living Change')),  // Cost of Living Change
              DataColumn(label: Text('Lifestyle Change')),  // Lifestyle Change
              DataColumn(label: Text('Reason Not to Move')),  // Reason Not to Move
              DataColumn(label: Text('Preferred Living Area')),  // Preferred Living Area
              DataColumn(label: Text('Reason for Preference 1')),  // Reason for Preference 1
              DataColumn(label: Text('Reason for Preference 2')),  // Reason for Preference 2
              DataColumn(label: Text('Number of Social Connections')),  // Number of Social Connections
              DataColumn(label: Text('General Feeling')),  // General Feeling
              DataColumn(label: Text('Safety Feeling')),  // Safety Feeling
              DataColumn(label: Text('Access to Basic Services')),  // Access to Basic Services
              DataColumn(label: Text('Basic Service Quality')),  // Basic Service Quality
              DataColumn(label: Text('Service Accessibility')),  // Service Accessibility
              DataColumn(label: Text('Access to Healthcare')),  // Access to Healthcare
              DataColumn(label: Text('Healthcare Reliability')),  // Healthcare Reliability
              DataColumn(label: Text('Healthcare Availability')),  // Healthcare Availability
              DataColumn(label: Text('Last Moved')),  // Last Moved
              DataColumn(label: Text('Considering Moving?')),  // Considering Moving
              DataColumn(label: Text('Reason for Moving')),  // Reason for Moving
              DataColumn(label: Text('Expected Change if Moved')),  // Expected Change if Moved
              DataColumn(label: Text('What Made You Move?')),  // What Made You Move
              DataColumn(label: Text('Difficulties After Moving')),  // Difficulties After Moving
              DataColumn(label: Text('Social Life Change')),  // Social Life Change
              DataColumn(label: Text('Local Conditions Change')),  // Local Conditions Change
              DataColumn(label: Text('Preferred Future Location')),  // Preferred Future Location
              DataColumn(label: Text('Stay Long Term Improvements')),  // Stay Long Term Improvements
              DataColumn(label: Text('Quality of Life Improvement')),  // Quality of Life Improvement
              DataColumn(label: Text('Biggest Advantage 1')),  // Biggest Advantage 1
              DataColumn(label: Text('Biggest Advantage 2')),  // Biggest Advantage 2
              DataColumn(label: Text('Biggest Advantage 3')),  // Biggest Advantage 3
              DataColumn(label: Text('Satisfaction Rating')),  // Satisfaction Rating
              DataColumn(label: Text('Other Comments')),  // Other Comments
            ],

            rows: _surveyData.map((dataModel) {
              return DataRow(
                cells: [
                  DataCell(Text(dataModel.gender)),
                  DataCell(Text(dataModel.currentLivingAreaType)),
                  DataCell(Text(dataModel.householdSize ?? 'Not valid')),
                  DataCell(Text(dataModel.mainReasonForLiving)),
                  DataCell(Text(dataModel.costOfLivingChange ?? 'Not valid')),
                  DataCell(Text(dataModel.lifestyleChange ?? 'Not valid')),
                  DataCell(Text(dataModel.reasonNotToMove ?? 'Not valid')),
                  DataCell(Text(dataModel.preferredLivingArea ?? 'Not valid')),
                  DataCell(Text(dataModel.reasonForPreference1 ?? 'Not valid')),
                  DataCell(Text(dataModel.reasonForPreference2 ?? 'Not valid')),
                  DataCell(Text(dataModel.numberOfSocialConnections ?? 'Not valid')),
                  DataCell(Text(dataModel.generalFeeling ?? 'Not valid')),
                  DataCell(Text(dataModel.safetyFeeling ?? 'Not valid')),
                  DataCell(Text(dataModel.accessToBasicServices ?? 'Not valid')),
                  DataCell(Text(dataModel.basicServiceQuality ?? 'Not valid')),
                  DataCell(Text(dataModel.serviceAccessibility ?? 'Not valid')),
                  DataCell(Text(dataModel.accessToHealthcare ?? 'Not valid')),
                  DataCell(Text(dataModel.healthcareReliability ?? 'Not valid')),
                  DataCell(Text(dataModel.healthcareAvailability ?? 'Not valid')),
                  DataCell(Text(dataModel.lastMoved ?? 'Not valid')),
                  DataCell(Text(dataModel.consideringMoving ?? 'Not valid')),
                  DataCell(Text(dataModel.reasonForMoving ?? 'Not valid')),
                  DataCell(Text(dataModel.expectedChangeIfMoved ?? 'Not valid')),
                  DataCell(Text(dataModel.whatMadeYouMove ?? 'Not valid')),
                  DataCell(Text(dataModel.difficultiesAfterMoving ?? 'Not valid')),
                  DataCell(Text(dataModel.socialLifeChange ?? 'Not valid')),
                  DataCell(Text(dataModel.localConditionsChange ?? 'Not valid')),
                  DataCell(Text(dataModel.preferredFutureLocation ?? 'Not valid')),
                  DataCell(Text(dataModel.stayLongTermImprovements ?? 'Not valid')),
                  DataCell(Text(dataModel.qualityOfLifeImprovement ?? 'Not valid')),
                  DataCell(Text(dataModel.biggestAdvantage1 ?? 'Not valid')),
                  DataCell(Text(dataModel.biggestAdvantage2 ?? 'Not valid')),
                  DataCell(Text(dataModel.biggestAdvantage3 ?? 'Not valid')),
                  DataCell(Text(dataModel.satisfactionRating ?? 'Not valid')),
                  DataCell(Text(dataModel.otherComments ?? 'Not valid')),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
