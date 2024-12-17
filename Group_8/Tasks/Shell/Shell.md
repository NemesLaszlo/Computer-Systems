### Pót/Javitó Zárthelyi Dolgozat (ZH) - 2024.12.17. (20 Pont)

- Részpontszám van

- 50% Elérése szükséges a sikeres alkalomhoz (10 Pont)

- Elküldeni a zh-t az alábbi emailcímre kell: laszlo.nemes@inf.elte.hu


#### Feladatok


1. (2 Pont) Számoljuk ki egy szám négyzetét. Írjunk egy scriptet, ami bemeneti értékként vár egy számot, (Nem parancssori argumentum, read khm...) aminek az ellenőrzése nem szükséges, feltételezzük, hogy helyes a megadott érték, a kiszámolt eredményt írjuk ki standard kimenetre/terminálra. (Pl. 2^2 = 2 × 2 = 4)


2. (3 Pont) Írjunk egy scriptet, amely átmásolja egy fájlból egy másik fájlba azokat a sorokat amelyek tartalmazzák a 'ZH' szót. A fájl amiből át kell másolni a sorokat és azt a fájlt amit létre kell hozni a script paraméterként (parancssori argumentum) várja el. Ellenőrizzük a fájl létezését, írjunk ki hibaüzenetet ha a fájl nem létezik a felhasználónak. Fájl amit használni kell: 2.txt (Elvárt eredmény: 2 sor kerül bele az új fájlba)


3. (3 Pont) Írjunk scriptet, amely kiírja terminálra azokat a sorokat, amelyek számra végződnek. A script a fájlt paraméterként (parancssori argumentum) kapja meg. Ellenőrizzük a fájl létezését, írjunk ki hibaüzenetet ha a fájl nem létezik a felhasználónak. Fájl amit használni kell: 3.txt (Elvárt eredmény: 2 sor van aminek a végén szám van) <br> Segítség: Figyeljünk arra, hogy lehetnek spacek, egyéb karakterek a sorok végén, rendszer függően: "$(echo -e "$line" | tr -d '[:space:]')" menjünk biztosra.


4. (3 Pont) Írjunk egy scriptet, amely paraméterben megadott fájlnak (parancssori argumentum) megszámolja, hány csak számokat tartalmazó sora van (valós számokra is gondoljunk), az eredményt írja ki standard kimenetre/terminálra. Ellenőrizzük a fájl létezését, írjunk ki hibaüzenetet ha a fájl nem létezik a felhasználónak. Fájl amit használni kell: 4.txt (Elvárt eredmény: 5)


5. (4 Pont) Írjunk egy scriptet, amely paraméterben megadott fájlból (parancssori argumentum) összeadja a páros számokat és kiírja terminálra a végeredményt (Elvárt eredmény: 12). A páratlan számokat pedig átmásolja egy másik fájlba amelyet a script hoz létre, a neve pedig legyen: OddNumbers.txt, továbbá adja össze ezeket a számokat is és írja a fájl végére, hogy: "A páratlan számok összege amelyek átmásolásra kerültek: 24". (24-nek kell lenni - változó legyen, ne csak odaírjuk) Ellenőrizzük a fájl létezését, írjunk ki hibaüzenetet ha a fájl nem létezik a felhasználónak. Fájl amit használni kell: 5.txt


6. (5 Pont) Írjunk egy scriptet amely a háziorvosi körzet egyszerű szöveges formátumban tárolt beteg nyilvántartásából kiírja annak az embernek a nevét (Név, Regisztrált megjelenés, Legutóbbi megjelenés dátuma), aki a legtöbb alkalommal kereste fel a rendelőt és, hogy pontosan hányszor fordult meg ott. Ellenőrizzük a fájl létezését, írjunk ki hibaüzenetet ha a fájl nem létezik a felhasználónak. Fájl amit használni kell: 6.txt (Elvárt eredmény: Kiss Lajos - 12 alkalommal) <br> Segítség: Figyeljünk a space-ekre.