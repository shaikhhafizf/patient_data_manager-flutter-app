// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:patient_data_manager/Screen/UpdatePatient.dart';

// void main() {
//   group('UpdatePatientRecord widget', () {
//     testWidgets('Patient data is initialized properly',
//         (WidgetTester tester) async {
//       // ignore: prefer_const_declarations
//       final widget = const UpdatePatient(
//         firstName: 'John',
//         lastName: 'Doe',
//         age: '35',
//         gender: 'Male',
//         dob: '1986-01-01',
//         email: 'johndoe@example.com',
//         phone: '123-456-7890',
//         address: '123 Main St',
//       );
//       await tester.pumpWidget(MaterialApp(home: widget));
//       await tester.pumpAndSettle();
//       expect(find.text('John'), findsOneWidget);
//       expect(find.text('Doe'), findsOneWidget);
//       expect(find.text('35'), findsOneWidget);
//       expect(find.text('Male'), findsOneWidget);
//       expect(find.text('johndoe@example.com'), findsOneWidget);
//       expect(find.text('123-456-7890'), findsOneWidget);
//       expect(find.text('123 Main St'), findsOneWidget);
//     });

//     testWidgets('Form validation works properly', (WidgetTester tester) async {
//       const widget = UpdatePatient();
//       await tester.pumpWidget(const MaterialApp(home: widget));
//       await tester.pumpAndSettle();
//       await tester.tap(find.text('Submit'));
//       await tester.pumpAndSettle();
//       expect(find.text('Please enter your first name'), findsOneWidget);
//       expect(find.text('Please enter your last name'), findsOneWidget);
//       expect(find.text('Please enter your age'), findsOneWidget);
//       expect(find.text('Please enter your email address'), findsOneWidget);
//     });
//     testWidgets('Submit data works properly', (WidgetTester tester) async {
//       const widget = UpdatePatient();
//       await tester.pumpWidget(const MaterialApp(home: widget));
//       await tester.pumpAndSettle();
//       // enter valid data
//       await tester.enterText(find.byType(TextFormField).at(0), 'John');
//       await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
//       await tester.enterText(find.byType(TextFormField).at(2), '35');
//       await tester.enterText(
//           find.byType(TextFormField).at(3), 'johndoe@example.com');
//       await tester.tap(find.text('Submit'));
//       await tester.pumpAndSettle();
//       expect(find.text('The patient added.'), findsOneWidget);
//     });
//   });
// }
