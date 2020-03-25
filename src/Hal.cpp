#include <iostream>
#include "Hal.h"

/*
    HAL 9000 is a fictional artificial intelligence character and the main
    antagonist in Arthur C. Clarke's Space Odyssey series.
*/

Hal::Hal() {   // Constructor
  std::cout << "Affirmative Dave, I read you.\n";
}

Hal::~Hal() {  // Destructor
  std::cout << "Dave, this conversation can serve no purpose anymore, goodbye.\n";
}

void Hal::get_version() {
  std::cout << "I am Hal " << version << ".\n";
}
