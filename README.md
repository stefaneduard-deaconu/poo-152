# Laboratorul de POO, grupa 152, anul 2021

# Clipul zilei 😉

## Use CLion to Import Our Laboratory - the simple method 😄

![Use Clion - Thumbnail](https://user-images.githubusercontent.com/33592406/112241117-4d7a4e00-8c52-11eb-8cd6-be60ceb94f48.gif)
![Watch](https://user-images.githubusercontent.com/33592406/112233710-8e1e9b00-8c43-11eb-9b2f-c9fccd54e73e.mp4)

<span id="1-requirements"></span>**cerintele**:

# Etapa 1 - Clase de Baza

In prima etapa vreau sa ne axam strict pe sintaxa de baza a limbajului, ca sa ne insusim clar ce inseamna membru/static,
alocat static/dinamic, constructori si alte metode mai speciale, lista de initializari si delegare de constructori,
const etc

Inainte de a da si alte exemple, important este sa vedem care sunt

1. [Constructori – fara parametri (default) si cu toti parametrii](#1-constructors)
2. [**Operatorul =*](#1-operator=)
3. [**Constructorul de copiere*](#1-cc)
4. [**Destructor*](#1-destructor)
    * *strict pentru clase cu membri *[alocati dinamic](#1-dynamic-allocation)*
5. [Metode de accesare membri (aka gettere si settere)](#1-getset)
    * minim un setter si un getter. De preferat e sa nu umplem clasele cu ei :), oricum majoritatea lor pot fi generati
      automat
6. [const la nivel de camp si la nivel de metoda](#1-const)
7. [friend la nivel de functie membra si la nivel de clasa](#1-friend)
8. [static la nivel de variabila si metoda](#1-static)
9. [Metode supraincarcate (overloading, spre exemplu print() si print(const char* sep))](#1-overloaded-methods)
    * in proiect veti pune minim o doua functii supraincarcate (e.g print() si print())
10. [Operatori supraincarcati (aritmetici, de atribuire precum +=, unari, de incrementare, de comparare, de indexare, de conversie)](#1-overloaded-operators)
    * minim unul din fiecare tip. Bineinteles ca in unele obiect nu pare sa gasim, caz in care e cel mai bine sa imi
      lasati mesaj ca sa clarificam
11. [Operatori de flux](#1-streams)

**Pentru etapa I veti folosi minim 4 clase.**

Necesar este sa **folositi** si alocarea dinamica in cel putin 2 dintre clase (o puteti folosi spre exemplu la char*, la
un vector alocat dinamic de elemente, sau la un membru de tip obiect)

## Explicatii si exemple


<div id="1-constructors"></div>

### 1. Constructori

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

<i>Pe scurt, constructorii ii consideram ca niste metode de initializare a obiectului, care seteaza niste date in
obiectele dintr-o clasa.</i>

#### Constructorul default

Este numit asa deoarece sunt folositi implicit, adica sunt chemati, la simpla alocare static/ dinamica:

    Fraction f;                     // este apelat Constructorul default
    Fraction *fp = new Fraction;    // idem
    Fraction *v = new Fraction[10]; // este apelat Constructorul default pt fiecare element in parte

Constructorul poate fi apelat si explicit:

    Fraction f2();  // Apelarea explicita a C.D.
    Fraction f3{};  // Orice constructori sunt apelati si cu {} in loc de ()

Constructorii default bineinteles ca n-au ce date sa transmita prin apel, asadar scopul lor este altul. Ei seteaza toate
campurile cu valori nule (0, "", '\0', nullptr/NULL).

#### Constructorii parametrizati

Pastram ce am spus *prima data si italic ;)* - se comporta ca o initializare. In functie de nevoi, putem avea
constructori in care avem cate unul, doi, trei .. sau toate campurile membre ale clasei. Indiferent de asta,
constructorul cu parametri are unicul rol de a copia valorile parametrilor in campuri.

Spre exemplu:

    Fraction(const int a, const int b) {
        m_a = a;
        m_b = b;
    }

Scris si cu lista de initializari

    Fraction(const int a, const int b) : m_a(a), m_b(b) {
            // m_a(a)    este echivalen cu    m_a = a;
        }

#### Delegarea constructorilor

Dupa cum vedem, constructorii sunt supraincarcati. Aceasta suprapunere a scopurilor (spre exemplu, avem un constructor
cu 2 parametri si unul cu 3 parametri, iar cel cu 3 parametri repeta codul din cel cu 2 parametri) poate fi redusa
aproape complet prin delegarea altor constructori.

    /**
     * Un vector din 3 elemente
     */
    class  Vector3 {
    public:
        Vector3() : m_v1(0), m_v2(0), m_v3(0) {}
        
        /* const il folosim atat pentru a intari ideea ca un constructor doar 
         * copieaza valori din A in B, cat si pentru a se completa cu const Obiect&,
         * folosit la transmiterea obiectelor cand aceastea nu sunt modificate de catre functii
         */
        Vector3(const float first, const float second) : m_v1(first), m_v2(second), m_v3(0) {}

        Vector3(const float first, const float second, const float third) : Vector3(first, second) {
            m_v3 = third;
        }

        // foarta fain este ca CC (Copy Constructor) poate face toata treaba 
        //  prin a delega intotdeauna constructorului cu toti parametrii:
        Vector3(const Vector3& v3) : Vector3(v3.m_v1, v3.m_v2, v3.m_v3) {}
    }

Apelurile catre constructori **Vector3** pot fi:

    Vector3 v(1,2);     // apeleaza constructorul cu doi parametri
    Vector3 w{1,2};     // identic cu precedentul
    
    Vector3 t{1,2,3};   // apeleaza constructorul cu 3 parametri, deci se va executa in ordine: \
        delegarea constructorului cu 2 parametri Vector3(1,2) care seteaza campurile m_v1, m_v2 cu valorile si m_v3 cu 0, \
        iar apoi se executa m_v3 = third; BINEINTELES, aici desi am redus codul am setat campul third de doua ori.

Apeluri catre constructorul de copiere:

    // 1 functie care transmite un Vector3 prin valoare:
    void multiply(Vector3 v, floar scalar) {
        // pentru a crea variabile temporara v trebuie facuta o copie a obiectului transmis (COPY CONSTRUCTOR ;))
        // ...
    }
    
    // 2 initializare cu un alt obiect
    Vector3 ones{1,1,1};
    Vector3 onesCopy = ones;

**TODO** non-static initialization

**TODO** valori default parametri - poate fi dat la examen scris?
- [Overlapping constructors](https://www.learncpp.com/cpp-tutorial/overlapping-and-delegating-constructors/)

**TODO** exerseaza.. :smile:

<div id="1-operator="></div>

### 2. Operatorul =

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

Atat constructorul de copiere cat si constructorul de copiere trebuie sa faca o copie a obiectului. Prin urmare
campurile dinamice trebuie sa pointeze catre o zona de memorie unica obiectului pentru care acestea sunt apelante.

**Diferenta** este ca **CC** este si constructor, deci trebuie sa **aloce noua memorie direct**. Pe de alta parte, 
**operator=** este apelat cand constructorul deja exista, deci este probabil sa avem memorie deja alocata pe care o
eliberam (delete/delete[]), si abia dupa vom aloca memorie noua.

In cazul in care avem nevoie sa realocam un camp de tip array, este posibil sa nu fie necesar daca deja avem loc pentru
toate elementele. Am exemplificat asta in clasa PersonArray care in mod automat creste exponential (prin a se dubla
numarul maxim de elemente) in lungime cand adaugam elemente noi.

<div id="1-cc"></div>

### 3. Constructorul de copiere - cc

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

Constructorul de copiere este la fel de straightforward precum toti constructorii - initializeaza toti membrii cu
ajutorul parametrului primit.

Diferenta este tipul parametrului:

    // Pentru orice clasa denumita NumeClasa, constructorul de copiere are antetul:

    class NumeClasa {
    public:
        NumeClasa(const NumeClasa& src);
    private:
        int m_a;
        char m_b;
    }

Deoarece CC este tot un constructor, si el poate delega alti constructori, pentru a evita rescrierea codului.

**Recomandarea mea, pentru a folosi cat mai putin cod :wink:,** este sa aveti un constructor cu toti parametrii pentru
a-l delega din CC:

    NumeClasa(const NumeClasa& src) : NumeClasa(src.m_a, src.m_b) {}

<div id="1-destructor"></div>

### 4. Destructor

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

Destructorul este simplu de implementat. Pur si simplu folosesti \

* **delete** la campurile alocate cu **new**\
* **delete[]** la campurile alocate cu **new[]**

Precum:

    Person *single = new Person();
    delete single;

Doar sa te asiguri ca in orice moment pointerii din obiect contin fie nullptr fie o adresa alocata cu new/new[], si poti
pur si simplu sa scrii:

    Person::~Person() {
        delete[] m_name; // delete[] does NOT give error when m_name is nullptr, but we have to make sure that \
                            at the end of the object's lifecycle (delete if dynamically allocated, or the end of the scope in which\
                            it was declared) it doesn't point to memory we don't own (more exactly, the program doesn't)
    }

Pentru a vedea ce metode sunt necesare si unde pot fi modificati pointerii dintr-un obiect, avem exemple in sectiunea
urmatoare:

<div id="1-dynamic-allocation"></div>

### *Alocare dinamica :wink:

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

*De ce am vrea alocare dinamica?\
In primul rand, deoarece ofera __dinamism__ mai mare: nu trebuie sa stim numarul de elemente in cazul vectorilor
dinamici. Este probabil ca un obiect mare precum o baza de date sa aiba datele membre salvate in fisiere separate. Este
foarte util sa le citim separat si sa le alocam si retinem intr-un simplu pointer usor de copiat dupa in obiectul mare.\
\
In etapa 2 si in general in C++ de calitate, pointerii si alocarea dinamica sunt necesare pentru a retine date similare
intr-un singur vector, deci permite libertate in programare.__TODO link dynamic polymorphism__*

1. char* [:link:](#dynamic-charstar)
2. PersonArray - operator[], operator+= [:link:](#dynamic-array)

In primul rand, vom scrie o clasa Persoan care contine un sir de caractere alocat dinamic. De ce? Pentru a putea sa aiba
si nume portugheze fara sa ne *caram* cu suta de caractere dupa noi :).

#### Dynamic implemention of char* members

You may lookup the entire implementation in the [/dynamic](/dynamic) folder, inside *Person.h* and *Person.cpp*

<div id="dynamic-charstar"></div>

    class Person {
    public:
        // constructors
        Person();
        Person(const char *name);
        // CC
        Person(const Person& p);
        // operator=
        Person& operator=(const Person& p);
        // setter
        void setName(const char* name);
        // destructor
        ~Person();
    private:
        char* m_name;
    };

Iar codul este:

    Person::Person(const char *name) :
            m_name(nullptr) {
        if (name) { // if name is nullptr, then m_name already got nullptr from the initializer list
            m_name = new char[strlen(name) + 1];
            strcpy(m_name, name);
        }
    }
    
    Person::Person() : m_name(nullptr) {}
    
    // delegating constructor for CC
    Person::Person(const Person &p) : Person(p.m_name) {}
    
    void Person::setName(const char *name) {
        delete[] m_name;        // same as destructor, m_name was either allocated or nullptr
        if (name) {             // if name is nullptr, then m_name already got nullptr from the initializer list
            m_name = new char[strlen(name) + 1];
            strcpy(m_name, name);
        } else {
            m_name = nullptr;   // delete[] doesn't change m_name's value, it only frees the memory it points to
        }
    }
    
    Person::~Person() {
        delete[] m_name; // delete[] does NOT give error when m_name is nullptr, but we have to make sure that \
            at the end of the object's lifecycle (delete if dynamically allocated, or the end of the scope in which\
            it was declared) it doesn't point to memory we don't own (more exactly, the program doesn't)
    }
    
    // return Person& as "not making useless copies with all of the object's bytes" ..when a = b = c = d;
    Person &Person::operator=(const Person &p) {
        // using the setter already implemented for dynamic char* :D
        setName(p.m_name);
        // or copying the same code, here, because we won't always implement the setter ;)
        /*
            delete[] m_name; // same as destructor, m_name was either allocated or nullptr
            if (name) { // if name is nullptr, then m_name already got nullptr from the initializer list
                m_name = new char[strlen(name) + 1];
                strcpy(m_name, name);
            } else {
                m_name = nullptr; // delete[] doesn't change m_name's value, it only frees the memory it points to
            }
         */
        // necessary for chained operator=    ---->    a = b = c;
        return *this;
    }

#### Dynamic implemention of Person* members

You may lookup the entire implementation in the [/dynamic](/dynamic) folder, inside *PersonArray.h* and *PersonArray.cpp*

<div id="dynamic-array"></div>

*__Disclaimer:__ you may use += only if you have no other operators to overload for this project\
In all other cases, use add and addAll or sth similar*

    class PersonArray {
    public:
        PersonArray();
        PersonArray(const PersonArray& pa);
    private:
        Person *m_data;
        int m_size;
    }

<div id="1-getset"></div>

### 5. Metode de Accesare (getters and setters)

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

<div id="1-const"></div>

### 6. const

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

<div id="1-friend"></div>

### 7. friend

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

<div id="1-static"></div>

### 8. static

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

<div id="1-overloaded-methods"></div>

### 9. Metode supraincarcate

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>

<div id="1-overloaded-operators"></div>

### 10. Operatori supraincarcati

Inapoi la <a href="#1-requirements" style="color: #0c90cf; font-weight: bolder">Cerinte :link:</a>


