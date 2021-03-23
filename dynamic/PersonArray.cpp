//
// Created by stefan on 3/23/21.
//

#include "PersonArray.h"

// cateodata este posibil sa elimini constructorul default, daca ai parametrii cu valori default
PersonArray::PersonArray(int capacity) :
        m_size(0) {
    if (capacity <= 0) {
        m_capacity = 10;
    } else {
        m_capacity = capacity;
    }
    m_data = new Person[m_capacity]; // initial capacity is the maximum number of people in this array
}

PersonArray::PersonArray(const Person *people, const int peopleCount) :
        m_size(peopleCount) {
    // copy means allocating new memory (2), or moving the data to a different address, like m_data (1)
    if (peopleCount <= 0) {                     // (1)
        m_capacity = 10;
        m_data = new Person[m_capacity];        // initial capacity is the maximum number of people in this array
    } else {                                    // (2)
        m_capacity = peopleCount;
        m_data = new Person[m_capacity];        // initial capacity is the maximum number of people in this array
        for (int i = 0; i < peopleCount; ++i) {
            m_data[i] = people[i];
        }
    }
}

PersonArray::PersonArray(const PersonArray &pa) :
        PersonArray(pa.m_data, pa.m_size) {}

PersonArray &PersonArray::operator=(const PersonArray &pa) {

    // when copying dynamic data we allocate new memory for our object fields (m_data);

    if (m_capacity < pa.m_capacity) {
        // exponential growth of length, to minimize number of reallocation
        m_capacity *= 2;
        // free the used memory:
        delete[] m_data;
        // allocate new memory
        m_data = new Person[m_capacity];
    }

    m_size = pa.m_size;
    for (int i = 0; i < pa.m_size; ++i) {
        m_data[i] = pa.m_data[i];
    }

    return *this;
}

void PersonArray::setData(const Person *people, const int size) {
// when copying dynamic data we allocate new memory for our object fields (m_data);

    if (m_capacity < size) {
        // exponential growth of length, to minimize number of reallocation
        m_capacity = size;
        // free the used memory:
        delete[] m_data;
        // allocate new memory
        m_data = new Person[m_capacity];
    }

    m_size = size;
    for (int i = 0; i < size; ++i) {
        m_data[i] = people[i];
    }
}

PersonArray::~PersonArray() {
    delete[] m_data;
}

Person &PersonArray::operator[](int i) {
    return m_data[i];
}

void PersonArray::operator+=(const Person &p) {
    if (m_size < m_capacity) {
        m_data[m_size++] = p;
    } else {
        ++(*this); // resize the current array while keeping the old data
        m_data[m_size++] = p;
    }
}

void PersonArray::operator++() {
    if (m_capacity * 2 < 0) {
        // overflow
        return;
    }
    m_capacity *= 2;

    // TODO most important bits may be about how to keep the old data when reallocating memory
    Person* old = m_data;
    m_data = new Person[m_capacity];
    for (int i = 0; i < m_size; ++i) {
        m_data[i] = old[i];
    }


}

void PersonArray::operator+=(const PersonArray &pa) {
    for (int i = 0; i < pa.m_size; ++i) {
        *this+=pa.m_data[i];
    }
}

