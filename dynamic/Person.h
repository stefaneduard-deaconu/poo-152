//
// Created by stefan on 3/23/21.
//

#ifndef POO_152_PERSON_H
#define POO_152_PERSON_H

#include <cstring>

/**
 * TODO TL;DR
 *  cand avem un c-string dinamic este nevoie sa il modificam in urmatoarele metode:
 */
class Person {
public:
    // constructors
    Person();

    Person(const char *name);

    // CC
    Person(const Person &p);

    // operator=
    Person &operator=(const Person &p);

    // setter
    void setName(const char *name);

    // destructor
    ~Person();

private:
    char *m_name;
};


#endif //POO_152_PERSON_H
