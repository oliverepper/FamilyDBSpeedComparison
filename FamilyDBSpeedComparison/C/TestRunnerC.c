//
//  TestRunnerC.c
//  FamilyDBSpeedComparison
//
//  Created by Oliver Epper on 31.10.21.
//

#include "address.h"

void runC(void) {
    family_t test = address_family_create("Test");
    for (int i=0; i<1000000; i++) {
        address_family_add_member(&test, address_person_create("Test Person", i));
    }
    printf("Family size: %zu\n", address_family_size(test));
}
