#Dokumentacia
Projekt Školský systém R&A EDU na predmet Vývoj aplikácií s viacvrstvovou architektúrou. 
##	Popis projektu
Táto aplikácia predstavuje systém na manažment štúdia pre učiteľov a študentov. Študenti si v ňom môžu prezerať svoje známky a prípadné absencie, zatiaľ čo učitelia reprezentujú tzv. administrátorov, teda učiteľské účty sú administrátorské. 
Učitelia majú možnosť zadávať známky a absencie jednotlivým žiakom, spravovať triedy, ostatných učiteľov a predmety. 
V našom projekte je možné stiahnuť si reporty z známok a absencií, ako aj vygenerovať a stiahnuť si vysvedčenie pre konkrétnych žiakov. 
Náš projekt je riešený ako webová aplikácia a na implementáciu sme použili jazyk Ruby. Používateľské rozhranie sme tvorili pomocou HTML, CSS a JavaScript v spojení s frontendovým frameworkom Boostrap. Databázu sme použili PostgreSQL.

##	Scenáre
Pre študentov je možné len pozrieť si svoje absencie a známky.
![Student](/app/assets/images/ziak.png)
###	Registrácia a prihlásenie
Registrácia a prihlásenie je rozdelené na prihlasovanie pre učiteľov "tajné" (link/teachers/sign_in) a prihlasovanie pre študentov. Ak nie je prihlásený nikto, tak vidí len landing page. 
![Student_reg](/app/assets/images/reg.png)
###Pridávanie absencií a známok
Absencie a známky môžu pridávať len učitelia a to formulárom v paneli vľavo na obrazovke. Kliknutím na tlačidlo exportovať nad tabuľkou si môžu stiahnuť report vo formáte csv. 

###	Manažment tried
Učitelia majú takisto možnosť vytvárať nové triedy, pridávať žiakov do tried, prípadne im meniť triedy. Pri výpise tried sú tlačidlá určené na zobrazenie žiakov v triede (Detail), vymazanie a upravenie triedy. Takisto je tu informácia o tom, koľko žiakov sa v triede nachádza. 
Po rozkliknutí danej triedy sa zobrazí výpis žiakov v triede. K žiakovi sú uvedené základné informácie a možnosť stiahnuť si vysvedčenie. Každému zo žiakov je možné editovať triedu.
![man_tried](/app/assets/images/man_tried.png)
###	Manažment učiteľov
Učitelia majú možnosť pridávať si triedy, teda stanú sa z nich triedny učitelia, a pridávať si predmety, ktoré učia. 

###	Manažment predmetov
V manažmente predmetov je možné vytvárať nové predmety. Každému predmetu vieme určiť názov, náročnosť a počet kreditov. 

###	Úprava profilu
Každý užívateľ v systéme má možnosť editovať si svoj vlastný profil a to kliknutím na tlačidlo v navigačnom paneli „Upraviť profil“.

###	Prehľad informácií o systéme
Dole na úvodnej stránke sú grafy, ktoré nám zobrazujú počet a typy registrovaných používateľov ako aj počet jednotlivých známok.
![grafy](/app/assets/images/grafy.png)