// mainRoll -- primary function

#include <iostream>
#include <string>
#include "dRoll.h"
#include "mainRoll.h"

using namespace std;

// MAIN
int mainRoll( int argc, char *argv[] )
{
  int k, n, b;
  switch (argc) {
    case 2:
      n = stoi(argv[1]);
      dRoll(n);
      break;
    case 3:
      k = stoi(argv[1]);
      n = stoi(argv[2]);
      dRoll( k, n, 0 );
      break;
    case 4:
      k = stoi(argv[1]);
      n = stoi(argv[2]);
      b = stoi(argv[3]);
      dRoll( k, n, b );
      break;
    default:
      printf( "Usage: roll <SIDES>\n       roll <ROLLS> <SIDES> [BONUS]\n" );
      return 2;
  }
  return 0;
}

// all pau!   )

