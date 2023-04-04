// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
// import 'package:patient_data_manager/Components/FormFields/CustomDateTimeField.dart';
// import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
// import 'package:patient_data_manager/Screen/UpdatePatientRecord.dart';

// void main() {
//   group('UpdatePatientRecord widget', () {
//     testWidgets('should render all form fields', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         const MaterialApp(
//           home: Scaffold(
//             body: UpdatePatientRecord(
//               patientId: '1',
//             ),
//           ),
//         ),
//       );

//       expect(find.byType(CustomTextField), findsNWidgets(3));
//       expect(find.byType(CustomDateTimeField), findsOneWidget);
//       expect(find.byType(FormButton), findsOneWidget);
//     });

//     testWidgets('should validate form fields when submitting',
//         (WidgetTester tester) async {
//       await tester.pumpWidget(
//         const MaterialApp(
//           home: Scaffold(
//             body: UpdatePatientRecord(
//               patientId: '1',
//             ),
//           ),
//         ),
//       );

//       await tester.tap(find.byType(FormButton));
//       await tester.pumpAndSettle();

//       expect(find.text('Please enter data type'), findsOneWidget);
//       expect(
//           find.text('Please enter data note or description'), findsOneWidget);
//       expect(find.text('Please enter data value'), findsOneWidget);
//     });
//   });
// }
