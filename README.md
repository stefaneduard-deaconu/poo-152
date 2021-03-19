# Laboratorul de POO, grupa 152, anul 2021

# Etapa 1 - Clase de Baza

In prima etapa vreau sa ne axam strict pe sintaxa de baza a limbajului,
    ca sa ne insusim clar ce inseamna membru/static, alocat static/dinamic,
    constructori si alte metode mai speciale, lista de initializari si
    delegare de constructori, const etc

Inainte de a da si alte exemple, important este sa vedem care sunt 
    <span id="1-requirements"></span>**cerintele**:

1. [Constructori – fara parametri (default) si cu toti parametrii](#1-constructors)
2. [**Operatorul =*](#1-operator=)             
3. [**Constructorul de copiere*](#1-cc)        
4. [**Destructor*](#1-destructor)
    * *strict pentru clase cu membri *[alocati dinamic](#1-dynamic-allocation)*
5. [Metode de accesare membri (aka gettere si settere)](#1-getset)
   * minim un setter si un getter. De preferat e sa nu umplem clasele cu ei :), 
     oricum majoritatea lor pot fi generati automat 
6. [const la nivel de camp si la nivel de metoda](#1-const)
7. [friend la nivel de functie membra si la nivel de clasa](#1-friend)
8. [static la nivel de variabila si metoda](#1-static)
9. [Metode supraincarcate (overloading, spre exemplu print() si print(const char* sep))](#1-overloaded-methods)
   * in proiect veti pune minim o doua functii supraincarcate (e.g print() si print())
10. [Operatori supraincarcati (aritmetici, de atribuire precum +=, unari, de incrementare, de comparare, de indexare, de conversie)](#1-overloaded-operators)
    * minim unul din fiecare tip. Bineinteles ca in unele obiect nu pare sa gasim, caz in care 
    e cel mai bine sa imi lasati mesaj ca sa clarificam
11. [Operatori de flux](#1-streams)



**Pentru etapa I veti folosi minim 4 clase.**

Necesar este sa **folositi** si alocarea dinamica in cel putin 2 dintre
    clase (o puteti folosi spre exemplu la char*, la un vector alocat dinamic de elemente,
    sau la un membru de tip obiect)


## Explicatii si exemple

### 1. Constructori
<div id="1-constructors"></div>

<i>Pe scurt, constructorii ii consideram ca niste metode de initializare a obiectului, care 
seteaza niste date in obiectele dintr-o clasa.</i>

#### Constructorul default

Este numit asa deoarece sunt folositi implicit, adica sunt chemati, la simpla alocare static/ dinamica:

    Fraction f;                     // este apelat Constructorul default
    Fraction *fp = new Fraction;    // idem
    Fraction *v = new Fraction[10]; // este apelat Constructorul default pt fiecare element in parte

Constructorul poate fi apelat si explicit:

    Fraction f2();  // Apelarea explicita a C.D.
    Fraction f3{};  // Orice constructori sunt apelati si cu {} in loc de ()

Constructorii default bineinteles ca n-au ce date sa transmita prin apel, asadar scopul lor este altul.
Ei seteaza toate campurile cu valori nule (0, "", '\0', nullptr/NULL).

#### Constructorii parametrizati

Pastram ce am spus *prima data si italic ;)* - se comporta ca o initializare. In functie de nevoi,
putem avea constructori in care avem cate unul, doi, trei .. sau toate campurile membre ale clasei.
Indiferent de asta, constructorul cu parametri are unicul rol de a copia valorile parametrilor in campuri.

Spre exemplu:

    Fraction(int a, int b) {
        m_a = a;
        m_b = b;
    }

Scris si cu lista de initializari

    Fraction(int a, int b) : m_a(a), m_b(b) {
            // m_a(a)    este echivalen cu    m_a = a;
        }

#### Delegarea constructorilor

Dupa cum vedem, constructorii sunt supraincarcati. Aceasta suprapunere a scopurilor (spre exemplu,
    avem un constructor cu 2 parametri si unul cu 3 parametri, iar cel cu 3 parametri repeta codul
    din cel cu 2 parametri) poate fi redusa aproape complet prin delegarea altor constructori.

    /**
     * Un vector din 3 elemente
     */
    class  Vector3 {
    public:
        Vector3() : m_v1(0), m_v2(0), m_v3(0) {}

        Vector3(float first, float second) : m_v1(first), m_v2(second), m_v3(0) {}

        Vector3(float first, float second, float third) : Vector3(first, second) {
            m_v3 = third;
        }

        // foarta fain este ca CC (Copy Constructor) poate face toata treaba 
        //  prin a delega intotdeauna constructorului cu toti parametrii:
        Vector3(const Vector3& v3) : Vector3(v3.m_v1, v3.m_v2, v3.m_v3) {}
    }

**TODO** valori default parametri - poate fi dat la examen scris? - [Overlapping constructors](https://www.learncpp.com/cpp-tutorial/overlapping-and-delegating-constructors/)

**TODO** exerseaza.. :smile

### 2. Operatorul =
<div id=-operator="></div>


### 3. Constructorul de copiere - cc
<div id="1-cc"></div>


### 4. Destructor
<div id="1-destructor"></div>


### 5. Alocare dinamica
<div id="1-dynamic-allocation"></div>


### 6. const
<div id="1-getset"></div>


### 7. friend
<div id="1-const"></div>


### 8. static
<div id="1-friend"></div>


### 9. Metode supraincarcate
<div id="1-static"></div>


### 10. Operatori supraincarcati
<div id="1-overloaded-methods"></div>


<div id="1-overloaded-operators"></div>

