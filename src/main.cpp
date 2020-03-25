#include <iostream>
#include "Hal.h"


int main() {
  Hal *hal = new Hal();
  hal->get_version();

  hal->~Hal();

  return 0;
}
