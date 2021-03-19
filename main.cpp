#include <bits/stdc++.h>

using namespace std;

// 1. Constructori

class Fraction {
public:
    Fraction() : m_a(0), m_b(1){
        cout << "*";
    }

    Fraction(int a, int b) : m_a(a), m_b(b) {

    }

protected:
private:
    int m_a, m_b;
};


int main() {
    Fraction f;                     // este apelat Constructorul default
    Fraction *fp = new Fraction;    // idem
    Fraction *v = new Fraction[10]; // este apelat Constructorul default pt fiecare element in parte

//    Constructorul poate fi apelat si explicit:

    Fraction f2();  // Apelarea explicita a C.D.
    Fraction f3{};  // Orice constructori sunt apelati si cu {} in loc de ()
    return 0;


}

// I'll use this project as the place where I test classes and homeworks before they are send to you.

