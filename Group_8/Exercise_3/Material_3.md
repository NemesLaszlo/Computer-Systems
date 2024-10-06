### Folyamatok - Processes

A Unix és így a Linux rendszerek többfeladatos (multitasking) operációs rendszerek,
időosztásos (time sharing) módszert használva több programot is képesek egyszerre futtatni.

A kellően gyors váltások miatt a felhasználó számára mindez egyidejűséget kelt.

A párhuzamosan futtatott feladatokat (folyamatokat) kezelni is tudjuk: lekérdezni, leállítani,
időzíteni, priorizálni.

A Unix minden futó feladathoz külön azonosítót PID (processz identificator) rendel, hogy az
egyszerre futó - akár azonos – programpéldányok között különbséget tudjon tenni. A PID egy
egész szám, amely a gép bekapcsolásakor 1-ről indul és minden elindított feladat esetén
eggyel növekszik.

A legnagyobb PID limit érték lekérdezhető az alábbi paranccsal: ```cat /proc/sys/kernel/pid_max```

### Folyamatok kezelése / lekérdezése: 

A futó folyamatokat a ```ps``` paranccsal kérhetjük le

- PID - a folyamat azonosítója 
- TTY - a vezérlõ terminál azonosítója, jelen esetben ez a ttyp0 
- STAT - a folyamat állapota
- TIME - a processz által eddig elhasznált processzor idő

A rendszerben futó összes folyamatot, a legbővebb információkkal Linux alatt a ```ps -aux```
opciókkal kérhetjük le. Ekkor a processzekről megtudjuk még tulajdonosukat, az időpontot
amikor elindultak, valamint különféle erőforrás használati információkat (CPU, memória
használat, a program mérete a memóriában).

A manual elérhető a következő paranccsal: ```man ps``` innen megtudhatjuk, hogy a STAT esetén mit is jelentenek az alábbi code-ok:

PROCESS STATE CODES

```

Here are the different values that the s, stat and state output specifiers (header "STAT" or "S") will display to describe the state of a process:
D    uninterruptible sleep (usually IO)
R    running or runnable (on run queue)
S    interruptible sleep (waiting for an event to complete)
T    stopped, either by a job control signal or because it is being traced.
W    paging (not valid since the 2.6.xx kernel)
X    dead (should never be seen)
Z    defunct ("zombie") process, terminated but not reaped by its parent.

```

```

For BSD formats and when the stat keyword is used, additional characters may be displayed:
<    high-priority (not nice to other users)
N    low-priority (nice to other users)
L    has pages locked into memory (for real-time and custom IO)
s    is a session leader
l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
+    is in the foreground process group.

```

```top``` parancs: Információk a processzekről és egyéb statisztikák a rendszerről. A top folyamatosan fut,
és 5 másodpercenként frissíti a megjelenített információkat. Kilépni a "q" megnyomásával
lehet.

```htop``` parancs: Míg a top azokra a folyamatokra összpontosít, amelyek a legtöbb rendszererőforrást fogyasztják, 
a htop az összes futó folyamatot mutatja. A htop szinesebb megjelenítést és "vizuális" információkat is biztosít a processzor, a csere memória és a memória állapotáról.


#### Process erőforrás felhasználás:

```time <parancsnév>``` parancs: Ha egy parancs elé a time kulcsszót írjuk, akkor a burok az
indított program befejezése után statisztikai adatokat ad a feladat által használt
erőforrásokról, kiírja, hogy mennyi idő alatt futott le és mekkora terhelést jelentett a
rendszer számára.

```

time ls

```

- real: The elapsed real time in seconds. -- Az eltelt valós idő másodpercekben.
- user: The amount of CPU time spent in user mode (executing the command) in seconds. -- A felhasználói módban (a parancs végrehajtásában) eltöltött CPU-idő másodpercben.
- sys: The amount of CPU time spent in system mode (kernel operations on behalf of the command) in seconds. -- A CPU rendszermódban eltöltött ideje (a parancs nevében végzett kernelműveletek) másodpercben.


```strace <parancsnév>``` parancs: Hibakereséshez használatos parancs. Az indított
program minden rendszerhívását kiírja.

```

strace ls

strace -o output.txt ls

```

- open: Opens a file or directory.
- read: Reads data from a file descriptor.
- write: Writes data to a file descriptor.
- close: Closes a file descriptor.
- stat or lstat: Retrieves file or directory information.
- access: Checks file access permissions.
- ioctl: Performs I/O control operations.

- mmap amit még látunk gyakran: 

mmap is a system call in Unix-like operating systems, including Linux, that is used to map files or devices into memory. It allows a process to establish a mapping between the virtual address space of the process and a file or device, making it possible to read from or write to the file as if it were an array in memory.

### Programok indítása:

- Programok indítása előtérben: A program az előtérben fut, amíg nem fejezi be futását addig
a felhasználó az adott héjban (shell, burok) nem indíthat újabb programot. Az előtérben futó
program birtokolja a billentyűzetet. A hagyományos elindítással, tehát alapértelmezés szerint
a programok az előtérben futnak. Vagy az fg <parancsnév> használatával.

- Programok indítása háttérben: Háttérben úgy tudunk futtatni programot, hogy ’&’ jelet kell
gépelni a parancs után.


1. Adjuk ki a következő parancsot: ```sleep 20```
(20 másodpercig vár, előtérben futtatva. A vezérlést 20 másodperc múlva kapjuk vissza.)

2. Adjuk ki a következő parancsot: ```sleep 20&``` 
(The "&" symbol at the end of the command is used to run the command in the background, so you can continue to use the terminal for other tasks while the sleep command is running.)

Két számot ír ki: Az első szám az "adott burok feladatazonosítója", a második a rendszeren "érvényes egyedi feladatazonosító", PID

### Jelek - Signals:

A Unix rendszer a folyamatok vezérlését a folyamatoknak küldött ún. szignálok (signals) segítségével végzi.

Signals are software interrupts sent to a program to indicate that an important event has occurred. The events can vary from user requests to illegal memory access errors. Some signals, such as the interrupt signal, indicate that a user has asked the program to do something that is not in the usual flow of control.

A jelek szoftveres megszakítások, amelyeket egy programnak küldenek, hogy jelezzék, hogy fontos esemény történt. Az események a felhasználói kérésektől az illegális memóriahozzáférési hibákig változhatnak. Egyes jelek, mint például a megszakítási jel, azt jelzik, hogy a felhasználó olyasvalamit kért a programtól, ami nem tartozik a szokásos vezérlési folyamatba.

| Signal Name | Signal Number | Description                                                |
|-------------|---------------|------------------------------------------------------------|
| SIGHUP      | 1             | Hang up detected on controlling terminal or death of controlling process |
| SIGINT      | 2             | Issued if the user sends an interrupt signal (Ctrl + C)    |
| SIGQUIT     | 3             | Issued if the user sends a quit signal (Ctrl + D)          |
| SIGFPE      | 8             | Issued if an illegal mathematical operation is attempted   |
| SIGKILL     | 9             | If a process gets this signal it must quit immediately and will not perform any clean-up operations |
| SIGALRM     | 14            | Alarm clock signal (used for timers)                       |
| SIGTERM     | 15            | Software termination signal (sent by kill by default)      |

There is an easy way to list down all the signals supported by your system. Just issue the ```kill -l``` command and it would display all the supported signals.

Every signal has a default action associated with it. The default action for a signal is the action that a script or program performs when it receives a signal.

Minden jelhez tartozik egy alapértelmezett művelet. A jel alapértelmezett művelete az a művelet, amelyet egy szkript vagy program hajt végre, amikor jelet kap.

There are several methods of delivering signals to a program or script. One of the most common is for a user to type CONTROL-C or the INTERRUPT key while a script is executing.

When you press the Ctrl+C key, a SIGINT is sent to the script and as per defined default action script terminates.

The other common method for delivering signals is to use the kill command, the syntax of which is as follows

```

kill -signal pid

```

---

#### Example: 

```

kill -1 1001

```
A fenti parancs elküldi a HUP- vagy leállási jelet az 1001-es folyamatazonosítóval futó programnak.

```

kill -9 1001

```

Ez leállítja az 1001-es folyamatazonosítóval futó folyamatot.

---


A sokféle látszólag azonos hatású szignál oka, hogy korántsem azonos hatásúak: például a HUP és a
TERM szignálokat a folyamat felülbírálhatja, saját szignál-kezelő rutint állíthat be (így van ez
az INT szignálnál is). Ezeket a szignálokat a folyamat kapja meg, és alapértelmezés szerinti
kezelő rutinjuk lép ki. A KILL szignál hatására viszont a kernel öli meg a folyamatot, annak
megkérdezése nélkül. Ezért nem probléma Unixban, ha egy folyamat "lefagy", végtelen
ciklusba kerül: egy KILL szignál mindig megoldja a problémát.

Szignált csak saját processzeinknek küldhetünk (kivéve a root-ot, aki bármely processzel
rendelkezhet). 

#### Csapdák - Felülírások Szignálok esetén:

When you press the Ctrl+C or Break key at your terminal during execution of a shell program, normally that program is immediately terminated, and your command prompt returns. This may not always be desirable. For instance, you may end up leaving a bunch of temporary files that won't get cleaned up.

As an example of the trap command, the following shows how you can remove some files and then exit if someone tries to abort the program from the terminal

```

trap "rm -f $WORKDIR/work1$$ $WORKDIR/dataout$$; exit" 2

```

A shell programban attól a ponttól kezdve, amikor ez a csapda végrehajtódik, a két "work1$$" és "dataout$$" fájl automatikusan eltávolításra kerül, ha a program megkapja a 2-es számú jelet.

Ezért, ha a felhasználó megszakítja a program végrehajtását a csapda végrehajtása után, biztos lehet benne, hogy ez a két fájl el lesz távolítva. Az rm-t követő kilépési parancs azért szükséges, mert enélkül a végrehajtás ott folytatódna a programban, ahol az a jel vételekor abbamaradt.

```

trap ’echo ELTE!’ 2

Alapértelmezettre vissza: trap 2

```

### Midnight Commander (mc)

Fontos, többcélú fájlmenedzsment program, akár szövegszerkesztőként, FTP kliensként is
használható. Hasonlít a sokak által ismert Norton Commanderhez. Kétpaneles, de mindkét
panel a távoli gépre vonatkozik!

```

sudo apt install mc

```

### Sorok manipulációja - Szűrők:

1. Számoljuk meg az aktuális könyvtárban lévő bejegyzések számát.

- Megoldás: ls | wc -l

(wc - command to count the number of lines)

2. Listázzuk ki az aktuális könyvtár alkönyvtárait!

- Megoldás: find laszlo -type d -not -path '*/.*'  | grep -v 'temp'

(Itt én a saját felhasználóm mappáját írom ki, kicsi extrákkal szemléltetés miatt, itt listázzuk ki a mappákat, de ami .-al kezdődik, vagyis rejtett azt ne vegyük figyelembe)

(Ezt követően, nekem a 'temp' mappában elég sok minden van, így azt ignorálom pipeline-al összekötve)

3. Listázzuk ki a bejelentkezett felhasználók azonosítóját és csak azt!

- Megoldás: who 

4. Listázzuk ki egy tetszőleges szöveges fájl sorait abc sorba rendezve!

- Megoldás: sort file.txt vagy fordított módon sort -r file.txt

5. Cseréljük ki egy fájlban lévő karaktereket a nagybetűs párjukra!

- Megoldás: tr '[:lower:]' '[:upper:]' < file.txt > output.txt

(tr --> translate (or transform) characters from lowercase to uppercase)

(< file.txt --> input redirection, a file.txt beolvasása történik meg)

(> output.txt --> output redirection, mentsük el ebbe a fájlba a tr általá végrehajtott adatokat / textet)

6. Számoljuk meg, hogy egy fájlban hány olyan sor van, amelyik az alma szót tartalmazza és semmi mást! 

- Megoldás: grep -o 'alma' apples.txt | wc -l

(grep-el (search for matching patterns in a file) "megkeressük" az alma szavakat a megadott szöveges fájlban, a '-o' kapcsolóval megadjuk, hogy csak a matching részt adjuk meg kimenetként -> Itt az alma szavak lesznek, amit pipleline-al összekötve megszámolunk)

7. Csak az egészeket tartalmazó sorokat szürje ki és jelenítse meg egy 'numbers.txt' fájlból.

- Megoldás: grep -E '^[0-9]+$' numbers.txt > filtered_file.txt

(a grep -E kapcsolóval megadunk egy reguláris kifejezést a feltétel teljesítésér)

Ajánlom a következő oldalt regexekhez: https://regex101.com/
