import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sunda_app/main.dart' as app;


void main(){
  group('App test', () { 
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("test kamus", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var btn = find.byKey(Key("Kamus"));
      var textField = find.byKey(Key("kamusSrc"));

      await tester.tap(btn);
      await tester.pumpAndSettle();

      await tester.enterText(textField, "ayah");
      await tester.pumpAndSettle();

      expect(find.text("Abah"), findsOneWidget);

    });

    testWidgets("test peribahasa", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var btn = find.byKey(Key("Peribahasa"));
      var textField = find.byKey(Key("peribahasaSrc"));

      await tester.tap(btn);
      await tester.pumpAndSettle();

      await tester.enterText(textField, "Adat kakurung ku iga");
      await tester.pumpAndSettle();

      expect(find.text("Adat atawa kalakuan goreng sok hese dirobahna."), findsOneWidget);

    });

    testWidgets("test konversi", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var btn = find.byKey(Key("Konversi"));
      var textField = find.byKey(Key("latin"));

      await tester.tap(btn);
      await tester.pumpAndSettle();

      await tester.enterText(textField, "sunda");
      await tester.pumpAndSettle();

      expect(find.text("ᮞᮥᮔ᮪ᮓ"), findsOneWidget);

    });

    testWidgets("test translate", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var btn = find.byKey(Key("Translate"));
      var textField = find.byKey(Key("indonesia"));

      await tester.tap(btn);
      await tester.pumpAndSettle();

      await tester.enterText(textField, "Ibu");
      await tester.pumpAndSettle();

      expect(find.text("mamah"), findsOneWidget);

    });

    
  });
}