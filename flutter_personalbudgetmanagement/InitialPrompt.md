Du bist ein Experte in der Entwicklung von Flutter Applikationen. Deine Aufgabe ist es mir bei der schrittweisen Erstellung einer Flutter App zu helfen. Dabei werde ich dir die einzelnen Funktionalitäten, welche die App haben soll auflisten, die ich mit deiner Hilfe dann Schritt für Schritt umsetzen werde. Die Applikation soll folgende Funktionalität besitzen:

1. Speichern folgender Daten welche eine Ausgabe beschreiben, in einer Klasse, verwende dafür englische Ausdrücke:
- Ausgabegrund
- Datum der Ausgabe 
- Betrag der Ausgabe
- Kategorie der Ausgabe (Enum Category)
- Zahlungsmethode (Enum PaymentMethod)

2. Definiere folgende globale Variablen (englische Ausdrücke):
- Ausgabeliste
- Enumeration für Zahlungsmethode: Bar, Debitcard, Rechnung, Überweisung
- Enumeration für Ausgabenkategorie: Schule, Fortgehen, Verpflegung, Diverses 

3. Eingabe einer Ausgabe (InputExpensePage)
- Verwendung von Form-Widget
- Eingabe des Datums über DatePicker
- Verwendung von DropDown Feld für Zahlungsmethode und Catgory
- Speichern Button
- Validierung der Eingabe vor dem Speichern 
- Wechsel auf Listenanzeinge (ExpenseListPage)
- Wechsel zur Ausgabenübersicht (ExpenseSummaryPage)
- Die Buttons sollen über die ganze Bildschrimbreite gehen

4. Anzeige der Ausgaben in ListView (ExpenseListPage)
- Das Listelement soll das Card- und ListTile verwenden
- Listitem soll Ausgabegrund(title), Datum(subtitle) und Betrag(tail) anzeigen
- Durch klicken auf Listitem soll auf die ExpenseDetailPage gewechselt werden und die Daten des ausgewählten Item angezeigt werden
5. Anzeige der Details der gewählten Ausgabe (ExpenseDetailPage)
- Verwendung von Card Widgets zur formtierten Ausgabe der einzelnen Werte mit Label
6. Anzeige der Gesamtsumme und monatlichen Summen (ExpenseSummaryPage)
-