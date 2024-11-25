### PowerShell Alapok

PowerShell is a cross-platform (Windows, Linux, and macOS) automation and configuration tool/framework that works well with your existing tools and is optimized for dealing with structured data (e.g. JSON, CSV, XML, etc.), REST APIs, and object models.


#### Windows PowerShell vs. PowerShell Core

PowerShell Core has one significant difference from PowerShell; PowerShell Core is multi-platform and runs on Windows, Mac, and Linux. PowerShell is Windows only and included with Windows. 

Windows PowerShell 5.1 is built on top of the .NET Framework v4.5. With the release of PowerShell 6.0, PowerShell became an open source project built on .NET Core 2.0. Moving from the .NET Framework to .NET Core allowed PowerShell to become a cross-platform solution. PowerShell runs on Windows, macOS, and Linux.

#### Amit el kell végezni saját gépeken

Alapértemlezett esetben nem lehetséges futtatni ezeket a srcipteket, nincs hozzá jogosultság, ezt be kell "kapcsolni":

```
Parancs: Get-ExecutionPolicy (Alapesetben ez: Restricted)

Amit ki kell adni parancs pontosan: Set-ExecutionPolicy –ExecutionPolicy UnRestricted vagy RemoteSigned, ajánlott az utóbbi

Rövidebben: Set-ExecutionPolicy RemoteSigned
```

```
Restricted: This default Set option locks PowerShell to enter only interactively.

All signed: This mode allows all scripts to run only when a trusted publisher signs them.

Remote signed: This mode allows locally created PowerShell scripts to run if this option is set.

Unrestricted: By doing so, the execution policy will have all restrictions lifted.
```

Megvédi alapesetben a felhasználót veszélyes scriptek véletlen szerű futtatásától.

Ha `Warning` üzenet látható amikor futtatnánk egy scriptet (.ps1) amelyet az internetről töltöttünk le (bizonyosodjunk meg róla futtatás előtt, hogy mit is csinál), ez esetben megoldás lehet az `R` opcióval való futtatás (Futtasd egyszer), vagy "Unblockolni a fájlt":

```
Unblock-File -Path "path_to_the_file"
```


#### Cmdlets and Modules

*Cmdlets* are native PowerShell commands, not stand-alone executables. Cmdlets are collected into PowerShell modules that can be loaded on demand. Cmdlets can be written in any compiled . NET language or in the PowerShell scripting language itself.

*Modules* A module is a package that contains PowerShell members, such as cmdlets, providers, functions, workflows, variables, and aliases. The members of this package can be implemented in a PowerShell script, a compiled DLL, or a combination of both. These files are usually grouped together in a single directory. (https://www.powershellgallery.com/)


##### Cmdlets

Cmdlets are different from commands in other command-shell environments in the following manners: 
- Cmdlets are .NET Framework class objects It can’t be executed separately
- Cmdlets can construct from as few as a dozen lines of code
- Parsing, output formatting, and error presentation are not handled by cmdlets
- Cmdlets process works on objects. So text stream and objects can’t be passed as output for pipelining
- Cmdlets are record-based as so it processes a single object at a time

Most of the PowerShell functionality comes from Cmdlet’s which is always in verb-noun format and not plural. Moreover, Cmdlet’s return objects not text. A cmdlet is a series of commands, which is more than one line, stored in a text file with a .ps1 extension.


#### Basic Commands

- Segítség:

```
Get-Help <Command> -> Get-Help Format-Table
```

- Get-Command

```
Get-Command
```

To generate a list of cmdlets, functions installed in your machine

- Listázás:

```
get-childitem

or

ls (-l is default)
```

```
-Recurse – rekurzívan írja ki a fájlokat
-Force – kiírja a rejtett fájlokat is
-Include – amit utána írok, azokat kiszűri
-Exclude – amit utána írok, azokat nem szűri ki a -Include szűréséből
-Name – csak a fájlok nevét írja ki
-Attributes – jogok, fájltípusok (-Attributes d -> könyvtárak, -Attributes r -> olvasható fájlok)
-File – csak fájlok
-Directory – csak könyvtárak
```

- Mappa készítés:

```
$directoryPath = "C:\Path\To\Your\Directory"
New-Item -ItemType Directory -Path $directoryPath

or 

$directoryPath = "C:\Path\To\Your\Directory"
mkdir $directoryPath
```

- Másolás (Rekurzívan):

```
# Specify the source directory path
$sourcePath = "C:\Path\To\Your\Source\Directory"

# Specify the destination path
$destinationPath = "C:\Path\To\Your\Destination"

# Copy the directory and its contents
Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse

```

- Átnevezés:

```
# Specify the current path and name of the file or directory
$currentPath = "C:\Path\To\Your\Current\FileOrDirectory"
$newName = "NewName"

# Rename the item without changing its location
Rename-Item -Path $currentPath -NewName $newName
```

- Mozgatás (Rekurzívan):

```
# Specify the source directory path
$sourcePath = "C:\Path\To\Your\Source\Directory"

# Specify the destination path
$destinationPath = "C:\Path\To\Your\Destination"

# Move the directory and its contents to the destination
Move-Item -Path $sourcePath -Destination $destinationPath -Recurse
```

```
# Specify the source path and name of the file
$sourceFilePath = "C:\Path\To\Your\Source\File.txt"

# Specify the destination path
$destinationPath = "C:\Path\To\Your\Destination"

# Move the file to the destination
Move-Item -Path $sourceFilePath -Destination $destinationPath
```

- Törlés:

```
-Force – letörli a rejtett és csak olvasható fájlokat is
-Include – amit utána írok, azokat kiszűri
-Exclude – amit utána írok, azokat nem szűri ki a -Include szűréséből
-Recurse – rekurzívan töröl -> Óvatosan ezzel
```

Example with *-Include*

```
# Specify the path of the directory you want to delete
$directoryPath = "C:\Path\To\Your\Directory"

# Remove files with specific extensions (e.g., .txt and .csv) from the directory
Remove-Item -Path $directoryPath -Include *.txt, *.csv -Recurse
```

- Tartalom szűrés/kiírás (alias: cat - ami itt is működik)

```
# Specify the path of the file you want to read
$filePath = "C:\Path\To\Your\File.txt"

# Get and display the content of the file
Get-Content -Path $filePath
```

```
# Specify the paths of the files you want to read
$filePaths = "C:\Path\To\Your\File1.txt", "C:\Path\To\Your\File2.txt"

# Get and display the content of the files
Get-Content -Path $filePaths
```

```
# Specify the path of the file you want to read
$filePath = "C:\Path\To\Your\File.txt"

# Get the content of the file and store it in a variable
$fileContent = Get-Content -Path $filePath

# Display the content stored in the variable
$fileContent
```

More:

```
Get-Content text.txt -Head 2 – első két sor
Get-Content text.txt -Tail 2 – utolsó két sor
Get-Content text.txt -TotalCount 5  – első 5 sor kiírása
```

- Tartalom írása/módosítása:

```
# Specify the path of the file where you want to write or replace content
$filePath = "C:\Path\To\Your\File.txt"

# Specify the new content you want to write to the file
$newContent = "Hello, this is the new content."

# Set the content of the file to the new content
Set-Content -Path $filePath -Value $newContent
```

```
# Specify the path of the file where you want to append content
$filePath = "C:\Path\To\Your\File.txt"

# Specify the content you want to append to the file
$additionalContent = "This is additional content."

# Append the content to the end of the file
Set-Content -Path $filePath -Value $additionalContent -Append
```

```
"C:\Logs\Log060912.txt" -TotalCount 50 | Set-Content "Sample.txt" # az első 50 sor átírása a másik fájlba
```

- Aktuális Lokáció, és annak felülírása:

```
# Get the current location (store it in a variable)
$currentLocation = Get-Location

# Specify the path to the directory you want to temporarily set as the current location
$directoryPath = "C:\Path\To\Your\Directory"

# Push the current location onto the stack and set the new location
Push-Location -Path $directoryPath

# Now, the current location is changed to the specified directory
# Perform operations in the new location, e.g., list files
Get-ChildItem

# Pop the location from the stack to revert to the original location
Pop-Location

# Now, you are back to the original location
```

- Kiírás terminálra:

```
# Display a message using Write-Host
Write-Host "Hello, this is a message!"
```

```
# Define a variable
$variable = "world"

# Display a message using Write-Host with variable interpolation
Write-Host "Hello, $variable!"
```

Write-host and Write-output:

```
Write-Host 1,2,3,4,5 | measure
    1 2 3 4 5 -> Count: 0

Write-Output 1,2,3,4,5 | measure
-> Count: 5
```

Use Write-Output when you want to send data down the pipeline for further processing or capturing in a variable.

```echo``` in PowerShell scripts -> it usually works as an alias for Write-Output.

- Dátum:

```
# Get the current date and time in a specific format
$formattedDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Display the formatted date and time
Write-Output "Formatted Date and Time: $formattedDateTime"
```

#### Pipes:

- Using a pipeline is the same as in UNIX, but the result is an object.

```
dir | format-list -Property Name, Length  # lista formában írja ki a fájlok nevét és hosszát
dir | format-table -Property Name, Length # táblázatos formában írja ki a fájlok nevét és hosszát
dir | sort-object Name | format-table -Property Name, Length # Név szerint rendez
cat text.txt | sort -Unique -Descending
```

```
dir | where Length -gt 2000 # 2000 byte-nál nagyobbak kiírása
cat .\text.txt | where Length -lt 4 # 4 karakternél kisebb sorok kiírása
```

- Select-Object

The Select-Object cmdlet in PowerShell is used to select specific properties of objects. It's often used in combination with other cmdlets, such as Get-Process, Get-Service, or Get-ChildItem, to filter and display only the properties you're interested in

```
# Get a list of processes and select specific properties
$selectedProcesses = Get-Process | Select-Object -Property Name, Id, CPU

# Display the selected properties for each process
$selectedProcesses
```

```
cat .\text.txt | Select-Object -Unique # mindent 1x ír ki
cat .\text.txt | Select-Object Length # kiírja a sorok hosszát (ez egy tömb -> egyszerű maximumkeresés)
cat .\text.txt | Select-Object -First 4 # első négy kiírása
cat .\text.txt | Select-Object -Last 4 # utolsók
cat .\text.txt | Select-Object -Index 3,6 # 3. és 6. sor kiírása
cat .\text.txt | Select-Object -Skip 3 # 3. sor kihagyása
cat .\text.txt | Select-Object Length -First 5 # első öt hosszának a kiírása
```

- Select-String (olyan mint a grep)

```
# Specify the path to the file you want to search
$filePath = "C:\Path\To\Your\File.txt"

# Search for a specific pattern in the file
$result = Get-Content -Path $filePath | Select-String -Pattern "example"

# Display the matching lines
$result
```

```
# Search for a specific pattern in the file using the -Path parameter
$result = Select-String -Path "C:\Path\To\Your\File.txt" -Pattern "example"

# Display the matching lines
$result
```

```
echo "hello" | Select-String -Pattern "HELLO" # hello
echo "hello" | Select-String -Pattern "HELLO" -CaseSensitive # nem ír ki semmit
Select-String text.txt -Pattern 34 # 34-et tartalmazó sorok kiírása
Select-String text.txt -Pattern alma,körte # almát vagy körtét tartalmazó sorok
Select-String text.txt -Pattern ^[a-zA-Z]*$ # csak betűket tartalmazó sorok
Select-String text.txt -Pattern ^[+-]?[1-9][0-9]*$ -NotMatch # minden olyan sor, ami nem csak számokat tartalmaz
```

- Measure-Object

```
# Create an array of numbers
$numbers = 1, 2, 3, 4, 5

# Use Measure-Object to calculate various statistics
$measurements = $numbers | Measure-Object

# Display the calculated statistics
$measurements
```

```
# Get a list of processes and measure memory usage
$processes = Get-Process
$memoryStats = $processes | Measure-Object -Property WS -Sum

# Display the calculated memory statistics
$memoryStats
```

```
echo hello | Measure-Object -Character # hello karakterszáma
cat text.txt | Measure-Object -Line # text.txt sorainak száma
cat szamok.txt | Measure-Object -Average -Sum -Maximum -Minimum
```

- Out-File (A kimenetet fájlba ír, olyan, mint a > operátor)

```
dir | Out-File dir.txt
dir | Out-File dir.txt -Append # Hozzáadja/Hozzáfűzi
```

- Get-Member

The Get-Member cmdlet in PowerShell is used to retrieve information about the properties and methods of objects. (Show what can be done with an object)

```
echo 3 | Get-Member
```

#### Script Basics

##### Variables

```
$name = 'Jon'

$number = 12345

$location = 'Charlotte'

$listofnumbers = 6,7,8,9

$my_last_math_grade = 'D+'
```

##### If/Else

```
If (10 –gt 5)
{
    Write-Host "Yes"
}
```

```
If (10 –gt 11)
{
    Write-Host "Yes"
} elseif (11 –gt 10)
{
    Write-Host "This time, yes"
}
```

```
If (10 –gt 11)
{
    Write-Host "Yes"
} elseif (11 –lt 10)
{
    Write-Host "This time, yes"
} elseif (20 –gt 40)
{
    Write-Host "Third time was a charm"
} else {
    Write-Host "You're really terrible at math, aren’t you?"
}
```

##### Do While / While

```
$numbers = 1
Do {
    $numbers = $numbers + 1
    Write-Host "The current value of the variable is $numbers"
} While ($numbers –lt 10)
```

```
$numbers = 1
While ($numbers –lt 10) {
    $numbers = $numbers + 1
    Write-Host "The current value of the variable is $numbers"
}
```

##### ForEach

```
$names = "Amy","Bob","Candice","Dick","Eunice","Frank"
$count = 0
ForEach ($singlename in $names) {
    $count += 1
    Write-Host "$singlename"
}
Write-Host "The total number of names is $count."
```
