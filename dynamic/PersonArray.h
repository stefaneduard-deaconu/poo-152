//
// Created by stefan on 3/23/21.
//

#ifndef POO_152_PERSONARRAY_H
#define POO_152_PERSONARRAY_H


#include "Person.h"

class PersonArray {
public:
    // constructors
    PersonArray(int capacity = 10);

    PersonArray(const Person *people, const int peopleCount);

    // CC
    PersonArray(const PersonArray &pa);

    // operator=
    PersonArray &operator=(const PersonArray &pa);

    // setter
    void setData(const Person* people, const int size);

    // destructor
    ~PersonArray();

    // overloaded operators for arrays of objects:
    Person& operator[](int i);                  // access the Person from position i
    void operator+=(const Person& p);           // append a single person to our PersonArray
    void operator+=(const PersonArray& pa);     // append the people from a second PersonArray
private:
    void operator++(); // used to double the arrays' capacity, should be used only inside the class to avoid memory errors
private:
    Person *m_data;         // an dynamic array of Person objects
    int m_size;             // current number of persons
    int m_capacity = 10;    // maximum capacity of array
};


#endif //POO_152_PERSONARRAY_H
