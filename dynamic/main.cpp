//
// Created by stefan on 3/23/21.
//

#include "Person.h"
#include "PersonArray.h"
#include <vector>
#include <cmath>

using namespace std;

int main() {
    Person alex;
    PersonArray people;
    people += alex;
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < pow(2, i); ++j) {
            people += alex;
        }
    }
}

