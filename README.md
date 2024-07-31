# KC85_SDCC_Hello_World
"Hello World"-Beispiel für KC85/4 mit dem Small Device C Compiler (SDCC)


Das Projekt zeigt den Einsatz des SDCC-Compilers um KCC-Dateien für die Kleincomputer aus Mühlhausen (KC85/3, KC85/4, KC85/5) zu erzeugen.
Dazu sind einige Anpassungen nötig (crt0.s, header.s, menuentry.s).
Außerdem gibt es eine Bibliothek, die ein angepasste printf-Funktion zur Verfügung stellt und eine Bibliothek, die Zugriff auf einige Unterprogramme des Betriebsystems CAOS erlaubt.

## Buildsystem
Um das Programm zu übersetzen werden folgende Werkzeuge benötigt:  
- make  
- sdcc  
- python3  


## Dateien

| Datei             | Typ               | Erläuterung
| ---               | ---               | ---
| Makefile          | Makefile          | Projektautomatisierung
| hello.c           | C-Program         | Hauptprogramm
| crt0.s            | Assembler         | C-Runtime, Start- und Endcode angepasdt für CAOS
| header.s          | Assembler         | enthält den KCC-Header
| menuentry.s       | Assembler         | enthält Eintrag für CAOS-Menüsystem
| caos.h            | C-Header          | für Funktionen aus caos.lib
| caos.lib          | Bibliothek        | zur Nutzung der CAOS-Unterprogamme
| printf.lib        | Bibliothek        | enthält printf-Funktion für CAOS
| fix_kcc_length.py | Python-Skript     | erweitert die Länge der KCC-Datei auf Vielfache von 128 Byte
| HELLO.kcc         | Programm          | Programmdatei


## Zusätzliche Bibliotheken
| Vezeichnis        | Erläuterung
| ---               | ---
| lib_caos          | Bibliothek zur Nutzung der CAOS-Unterprogamme
| lib_printf        | printf-Funktion für CAOS


# Hilfreiche Links

- KC85/5 Systemhandbuch  
http://www.kc85.info/index.php/download-topmenu/download/32-handbuecher/401-kc85-5-systemhandbuch.html

- SDCC - Small Device C Compiler  
https://sdcc.sourceforge.net/

- Gihub-Seite von Andreas Ziermann  
https://github.com/anchorz/sdcc-z1013-kc85

- JKCEMU, Emulator (u.a. KC85) von Jens Müller  
http://www.jens-mueller.org/jkcemu/

