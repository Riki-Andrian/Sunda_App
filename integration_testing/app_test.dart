import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sunda_app/main.dart' as app;


// void main(){
//   group('App test', () { 
//     IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//     testWidgets("test kamus", (tester) async {
//       app.main();
//       await tester.pumpAndSettle();

//       var btn = find.byKey(Key("Kamus"));
//       var textField = find.byKey(Key("kamusSrc"));

//       await tester.tap(btn);
//       await tester.pumpAndSettle();

//       await tester.enterText(textField, "ayah");
//       await tester.pumpAndSettle();

//       expect(find.text("abah"), findsOneWidget);

//       await tester.pageBack();
//       await tester.pumpAndSettle();

//     });

//     testWidgets("test peribahasa", (tester) async {
//       app.main();
//       await tester.pumpAndSettle();

//       var btn = find.byKey(Key("Peribahasa"));
//       var textField = find.byKey(Key("peribahasaSrc"));

//       await tester.tap(btn);
//       await tester.pumpAndSettle();

//       await tester.enterText(textField, "Adat kakurung ku iga");
//       await tester.pumpAndSettle();

//       expect(find.text("Adat atawa kalakuan goreng sok hese dirobahna."), findsOneWidget);

//       await tester.pageBack();
//       await tester.pumpAndSettle();

//     });

//     testWidgets("test konversi", (tester) async {
//       app.main();
//       await tester.pumpAndSettle();

//       var btn = find.byKey(Key("Konversi"));
//       var textField = find.byKey(Key("latin"));

//       await tester.tap(btn);
//       await tester.pumpAndSettle();

//       await tester.enterText(textField, "sunda");
//       await tester.pumpAndSettle();

//       expect(find.text("ᮞᮥᮔ᮪ᮓ"), findsOneWidget);

//       await tester.pageBack();
//       await tester.pumpAndSettle();

//     });

//     testWidgets("test translate", (tester) async {
//       app.main();
//       await tester.pumpAndSettle();

//       var btn = find.byKey(Key("Translate"));
//       var textField = find.byKey(Key("indonesia"));

//       await tester.tap(btn);
//       await tester.pumpAndSettle();

//       await tester.enterText(textField, "Ibu");
//       await tester.pumpAndSettle();

//       expect(find.text("mamah"), findsOneWidget);

//       await tester.pageBack();
//       await tester.pumpAndSettle();

//     });

    
//   });
// }
void main() {
  group('App test', () { 
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    // Fungsi untuk memulai ulang aplikasi di setiap tes
    Future<void> restartApp(WidgetTester tester) async {
      await tester.pumpWidget(app.MainApp()); // Gantilah ini dengan metode yang sesuai untuk memulai ulang aplikasi Anda
      await tester.pumpAndSettle();
    }

    testWidgets("test kamus", (tester) async {
      await restartApp(tester);

      try {
        var btn = find.byKey(Key("Kamus"));
        var textField = find.byKey(Key("kamusSrc"));

        await tester.tap(btn);
        await tester.pumpAndSettle();

        await tester.enterText(textField, "ayah");
        await tester.pumpAndSettle();

        expect(find.text("abah"), findsOneWidget);

        print("test kamus berhasil");
      } catch (e) {
        print("test kamus gagal: $e");
      }
    });

    testWidgets("test peribahasa", (tester) async {
      await restartApp(tester);

      try {
        var btn = find.byKey(Key("Peribahasa"));
        var textField = find.byKey(Key("peribahasaSrc"));

        await tester.tap(btn);
        await tester.pumpAndSettle();

        await tester.enterText(textField, "Adat kakurung ku iga");
        await tester.pumpAndSettle();

        expect(find.text("Adat atawa kalakuan goreng sok hese dirobahna."), findsOneWidget);

        print("test peribahasa berhasil");
      } catch (e) {
        print("test peribahasa gagal: $e");
      }
    });

    testWidgets("test konversi", (tester) async {
      await restartApp(tester);

      try {
        var btn = find.byKey(Key("Konversi"));
        var textField = find.byKey(Key("latin"));

        await tester.tap(btn);
        await tester.pumpAndSettle();

        await tester.enterText(textField, "sunda");
        await tester.pumpAndSettle();

        expect(find.text("ᮞᮥᮔ᮪ᮓ"), findsOneWidget);

        print("test konversi berhasil");
      } catch (e) {
        print("test konversi gagal: $e");
      }
    });

      testWidgets("test quiz", (tester) async {
      await restartApp(tester);

      try {
        var btn = find.byKey(Key("Peribahasa"));
        var textField = find.byKey(Key("peribahasaSrc"));

        await tester.tap(btn);
        await tester.pumpAndSettle();

        await tester.enterText(textField, "Adat kakurung ku iga");
        await tester.pumpAndSettle();

        expect(find.text("Adat atawa kalakuan goreng sok hese dirobahna."), findsOneWidget);

        print("test quiz berhasil");
      } catch (e) {
        print("test peribahasa gagal: $e");
      }
    });

    testWidgets("test translate", (tester) async {
      await restartApp(tester);

      try {
        var btn = find.byKey(Key("Terjemahan"));
        var textField = find.byKey(Key("indonesia"));

        await tester.tap(btn);
        await tester.pumpAndSettle();

        await tester.enterText(textField, "Ibu ");
        await tester.pumpAndSettle();

        await tester.testTextInput.receiveAction(TextInputAction.done); // Menekan aksi "Done" pada keyboard virtual
        await tester.pumpAndSettle();

        await Future.delayed(Duration(seconds: 5));

        expect(find.text("Indung"), findsOneWidget);

        print("test translate berhasil");
      } catch (e) {
        print("test translate gagal: $e");
      }
    });
  });
}
