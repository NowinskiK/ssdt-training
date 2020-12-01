# SSDT Training [PL]

| [English Version](../README.md) | [Polish Version](#) |

Pełen kod prezentowany podczas autorskiego treningu online dot. SSDT.  

SSDT jest świetnym narzędziem jeśli szukasz rozwiązania do zarządzania i wdrażania baz danych SQL Server (on-prem) oraz baz danych Azure SQL. Jest to darmowe narzędzie od Microsoft'u (wchodzące w skład Visual Studio), ale czasem nie wiemy jak zacząć pracę z nim oraz jak:
* Importować istniejące bazy danych z serwerów fizycznych
* Używać pliku DACPAC i czym on jest?
* Zrozumieć koncepcję oraz sposób używania aplikacji SQLPackage
* Zbudować pełen proces CI/CD 

Pracowałem i pracuję z SSDT od wielu lat przy wielu projektach. To repozytorium zawiera kod przedstawiony w kompleksowym, autorskim szkoleniu, które przygotowałem w 2020 roku.  
Odwiedź stronę kursu aby dowiedzieć się więcej:  
**Edycja Polska:** [Projekty bazodanowe w SQL Server Data Tools](https://www.kursysql.pl/szkolenie-projekty-bazodanowe-w-sql-server-data-tools/)  
**Edycja Angielska:** (patrz niżej)

W pierwszej kolejności zdecydowałem przygotować polską wersję językową tego kursu.  
Wersja anglojęzyczna będzie dostępna w przyszłym (2021) roku.  

Powodzenia!  
*Kamil*

# Zakres szkolenia

## Moduł 1: Wstęp & Instalacja
Czas trwania: 83 min.
* A. Powitanie i wprowadzenie
* B. Instalacja SSDT
* C. Dwa podejścia: State vs Migration
* D. Porównanie narzędzi
* E. Automatyzacja, DevOps, CI/CD
* F. Podsumowanie
* G. Quiz

## Moduł 2: Podstawy wersjonowania z GIT
Czas trwania: 89 min.
* A. Mini-Kurs Git'a - Wprowadzenie
* B. Instalacja narzędzi
* C. Klonowanie projektu
* D. Tworzenie nowego projektu
* E. Podstawowe komendy (PULL, COMMIT, PUSH)
* F. Nowa gałąź (branch) developera
* G. Pull Request oraz MERGE do gałęzi master
* H. Podsumowanie
* I. Quiz

## Moduł 3: Praca z SSDT w Visual Studio
Czas trwania: 68 min.
* A. Wprowadzenie
* B. [Utworzenie i praca z projektem bazy danych](../src/Introduction/)
* C. [Zmienne w projekcie i ich role](../src/Variables/)
* D. Właściwości projektu i ustawienia bazy danych
* E. Podsumowanie
* F. Quiz

## Moduł 4: Import istniejącej bazy
Czas trwania: 108 min.
* A. Wprowadzenie
* B. [Import bazy bezpośrednio z serwera SQL](../src/Import/)
* C. Import bazy ze skryptu i pliku DACPAC
* D. [Database references](../src/References/)
* E. [Ostrzeżenia (warnings)](../src/Warnings/)
* F. Podsumowanie
* G. Quiz

## Moduł 5: Porównywanie i Publikacja
Czas trwania: 187 min.
* A. Wprowadzenie
* B. [Narzędzie: Schema Compare](../src/Compare/)
* C. [Migawka (snapshot) projektu bazy danych](../src/Compare/WideWorldImporters/Snapshots/)
* D. Narzędzie: Data Compare
* E. Generowanie skryptu różnicowego
* F. Publikowanie zmian i ustawienia
* G. [Profile publikacji](../src/Publishing/)
* H. [Skrypty Pre/Post Deployment w praktyce](../src/PrePostDeployment/)
* I. [Skryptowanie danych i ich publikacja](../src/ScriptingData/)
* J. Podsumowanie
* K. Quiz

## Moduł 6: Azure DevOps oraz CI/CD
Czas trwania: 152 min.
* A. Wprowadzenie
* B. [Publikowanie z użyciem Sqlpackage (CMD)](../src/sqlpackage/demo1.cmd)
* C. [Publikowanie z użyciem Sqlpackage (PowerShell)](../src/sqlpackage/demo2.ps1)
* D. [Generowanie skryptu i raportu (PowerShell)](../src/sqlpackage/demo3.ps1)
* E. Budowanie CI/CD w Azure DevOps
* F. Wydawanie nowej wersji (Release)
* G. Raport w Release Pipeline (CD)
* H. Publikacja na kolejne środowisko (stage)
* I. Podsumowanie
* J. Quiz

## Moduł 7: Testy jednostkowe
Czas trwania: 159 min.
* A. Wprowadzenie
  * Unit Test
  * Rodzaje testów i narzędzia
  * Zasady budowania testów
* B. [Unit Test - budowanie z Visual Studio](../src/Testing-SSDT/)
* C. [Unit Test - budowanie z tSQLt](../src/Testing-tSQLt/)
* D. Uruchamianie testów i raportowanie wyników
* E. Podsumowanie
* F. Quiz

## Moduł 8: Tips, Tricks & Troubleshooting
Czas trwania: 143 min.
* A. Wprowadzenie
* B. [Skuteczne wyszukiwanie błędów](../src/Tips&Tricks/)
* C. [Referencje do baz systemowych](../src/Tips&Tricks/)
* D. [Pakiety SSIS i referencje do bazy SSISDB (Catalog)](../src/SSISDB/)
* E. [Odwołanie do tej samej bazy danych](../src/Tips&Tricks/)
* F. [Przebudowywanie dużych indeksów](../src/Indexes/)
* G. [Rozbijanie kolumny z danymi](../src/DataManipulation/)
* H. [SQL Server On-Prem VS Azure](../src/SqlServerVsAzureSQLDB/)
* I. Podsumowanie
* J. Quiz

## Moduł 9: Zaawansowane
Czas trwania: 148 min.
* A. Wprowadzenie
* B. [Odwołania cykliczne](../src/CircularRefs/)
* C. [Security & DevSecOps](../src/Security/)
* D. [SQL Agent Jobs](../src/SQLJobs/)
* E. [Publikacja wybiórcza (selektywna)](../src/sqlpackage-selective/)
* F. Podsumowanie
* G. Quiz

