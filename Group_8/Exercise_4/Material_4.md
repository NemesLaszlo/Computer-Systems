### Shell scriptek

A scriptek futtatásához szükséges, hogy az adott állomány rendelkezzen a megfelelő futtatási jogosultságokkal (x - execute)

```

chmod +x script_file_name.sh

```

---

### Reguláris kifejezések

Hasznos oldal: https://regex101.com/

Reguláris kifejezésekkel keresendő, vagy cserélendő karakterláncokat (stringeket) írhatunk le.
A reguláris kifejezések építőelemei olyan szabályos kifejezések, amelyek egy karakterhez
illeszkednek. A legtöbb karakter (pl. betűk és számok) önmagukhoz illeszkednek. Emellett
léteznek speciális jelentéssel rendelkező metakarakterek (pl. . (pont), *, [, stb. ), amik elé \
jelet kell írni, ha ezekre illeszkedő mintát szeretnénk alkotni, ha \ jelet szeretnénk keresni,
akkor \\-t kell írni.

A [ és ] jelek közé írt karakterlista illeszkedik a listában szereplő bármely karakterhez.
Amennyiben a lista ^ jellel kezdődik, akkor az illeszkedés a karakterlistában nem szereplő
karakterekkel áll fenn. Például a [0123456789] a számjegyekre illeszkedik. Ascii karakterek
tartományát a tartomány első és utolsó elemével, és az ezeket elválasztó - jellel adható meg
(pl. [a-d], ugyanazt jelenti, mint az [abcd] ). A legtöbb speciális karakter elveszti a jelentését a
[ ] jelek között, ezért pl. a ., vagy * karaktert keresünk, akkor nem kell elé \ jelet írni a
listában.

A pont (.) karakter minden karakterre illeszkedik. A \w szimbólum csak betűkre és számokra,
a \W pedig bármire, ami nem betű és szám.

A ^ jel csak sor elején, a $ jel pedig csak sor végén illeszkedik. Hasonlóan a \b a
szóhatárokhoz illeszkedik. Például ```^alma$``` csak az alma stringből álló sorhoz illeszkedik. A
```\bkorte\b``` csak akkor illeszkedik, ha a korte mint önálló szó szerepel.

A metakarakterek egy fontos fajtája az ismétlést szabályzó karakterek. Ezeket egy karakter,
vagy karaktercsoport mögé írva megadhatjuk hányszor keressük az adott karaktert a
bemenetben: 

```

? Az előző tag 0-szor vagy 1-szer illeszkedik (azaz opcionális)
* Az előző tag 0-szor vagy többször illeszkedik
+ Az előző tag 1-szer vagy többször illeszkedik
{n} Az előző tag pontosan n-szer illeszkedik
{n,} Az előző tag pontosan n-szer vagy többször illeszkedik
{,m} Az előző tag legfeljebb m-szer illeszkedik
{n,m} Az előző tag legalább n-szer és legfeljebb m-szer illeszkedik

```

A reguláris kifejezésben ( ) jelekkel csoportokat alkothatunk. Ezen csoportok után írt ismétlés
jel a teljes csoportra vonatkozik (pl. (abcd)+ egyszer vagy többször ismétlődő abcd
karakterláncot keres). Emellett választó kifejezéseket is megadhatunk a | jel segítségével (pl.
(alma|korte|banan) az alma, korte, vagy banan stringre illeszkedik). Végezetül a csoportokra
bizonyos esetekben (pl. sed parancson belül) hivatkorhatunk a sorszámukkal \1 formában (pl.
alma(korte)x([0-9]+) kifejezésben a 0. csoport maga a megtalált kifejezés, az 1. csoport a
korte string, a 2. csoport az x után következő, legalább 1 darab számjegy).

---

### Scriptek / Változók

- Változó létrehozása: változónév=érték

Például:
var1="almafa"

Az értékadásnál figyelni kell arra, hogy a = jel előtt nem szabad szóközt rakni, a változó
neve elé nem rakhatunk $ jelet, és lehetőleg ékezetmentes neveket adjunk meg. A változók
neve nem kezdődhet számmal.

- Változó tartalmának elérése: $változónév

Például:
$var1

Ekkor a var1 változóban tárolt érték behelyettesítésre kerül a $var1 helyére. Ha a változó nem
volt korábban definiálva (létrehozva), akkor üres string kerül behelyettesítésre.

- Változó törlése: unset változónév

Például:
unset var1

Ekkor a változó törlődik, a script további részében nem lesz definiálva.

#### Neves környezetváltozók

A környezetváltozók (amiket ```env``` parancssal listázhatunk) minden script számára elérhetőek
az indulás pillanatától. Ezek a rendszerről nyújtanak hasznos információkat: 

```

HOME : a felhasználó saját könyvtárának abszolút elérési címe
PWD : az aktuális könyvtár abszolút elérési címe
PATH : a rendszerparancsok elérési helyeinek listája, : -al elválasztva
USER : a felhasználónevünk
RANDOM : egy véletlenszerű számot ad 0 és 32767 között
PS1 : parancssori promptot meghatározó változó

```

#### Script paraméterek (Script Arguments)

- $0 parancs neve, $1 első, $2, …$9 kilencedik paraméter
- $# paraméterek száma
- $* összes paraméter

---

### Scriptek futtatása

Első sorban meg szoktuk adni, hogy:  ```#!/bin/bash```

- Ez megadja, hogy a script futtatása során a bash parancsértelmezőt szeretnénk futtatni. 
- Az aktuális könyvtárban lévő scriptet a ```./script.sh``` parancssal kell futtatni (ahol script.sh a script neve)

Természetesen kommentekkel el tudjuk látni a scriptjeinket, ami a jövőbeli újra felhasználhatóság miatt hasznos lehet!

```# comment```

