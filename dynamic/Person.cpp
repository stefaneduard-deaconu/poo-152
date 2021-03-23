//
// Created by stefan on 3/23/21.
//

#include "Person.h"

Person::Person(const char *name) :
        m_name(nullptr) {
    if (name) { // if name is nullptr, then m_name already got nullptr from the initializer list
        m_name = new char[strlen(name) + 1];
        strcpy(m_name, name);
    }
}

// delegating constructor for CC
Person::Person() :
        m_name(nullptr) {}

Person::Person(const Person &p) :
        Person(p.m_name) {

}

void Person::setName(const char *name) {
    delete[] m_name; // same as destructor, m_name was either allocated or nullptr
    if (name) { // if name is nullptr, then m_name already got nullptr from the initializer list
        m_name = new char[strlen(name) + 1];
        strcpy(m_name, name);
    } else {
        m_name = nullptr; // delete[] doesn't change m_name's value, it only frees the memory it points to
    }
}

Person::~Person() {
    delete[] m_name; // delete[] does NOT give error when m_name is nullptr, but we have to make sure that \
                at the end of the object's lifecycle (delete if dynamically allocated, or the end of the scope in which\
                it was declared) it doesn't point to memory we don't own (more exactly, the program doesn't)
}

// You can think ok returning Person& as "not making useless copies with all of the object's bytes" ..when a = b = c = d;
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
