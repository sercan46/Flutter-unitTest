import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/model/favorites.dart';
import 'package:unit_test/screens/home.dart';

Favorites? favoritesList;

//createHomeScreen()
Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Komponent Testleri - Anasayfa ', () {
    testWidgets('Scroll özelliğini test ediyoruz', (tester) async {
      await tester
          .pumpWidget(createHomeScreen()); //pumpWidget metodu widgeti ekrana
      expect(find.text('Sayı 0'),
          findsOneWidget); // Ekranda "Sayı 0" elemanını buluyoruz
      await tester.fling(find.byType(ListView), Offset(0, -200),
          3000); // ListView komponenetini otomatik kaydırıyoruz
      await tester
          .pumpAndSettle(); // Animasyonun tamamlanması için bekletiyoruz.
      expect(find.text('Sayı 0'),
          findsNothing); // Ekranda artık Sayı 0 'in olmadığına emin oluyoruz
    });
  });
}
