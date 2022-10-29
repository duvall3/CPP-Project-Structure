//! core di(c)e-rolling function

/*!
 Rolls dice:
   1) a specified number of times,
   2) of a specified number of sides,
   3) with an optional bonus
*/

// src for di(c)e-roll functions

#include <cstdio>
#include <stdlib.h>
#include <vector>
#include <time.h>

using namespace std;

// primary
int dRoll( int k, int n, int b = 0 ) {

  // init
  srand( time(NULL) ); // seed
  int total(0);
  vector<int> rolls(k);
  int j;

  // MAIN
  // print requested calculation
  printf("%dd%d + {%d}  ==>  ", k, n, b);
  // loop over rolls
  for ( j=0; j<k; j++ ) {
    // generate and store appropriate random integers
    rolls[j] = 1 + rand() % n;
    // get running sum
    total += rolls[j];
    // print results
    printf("%d ", rolls[j]);
    if ( j < k-1 ) {
      printf("+ ");
    } else {
      /* printf("+ {%d}  =  %d\n", b, total); */
      printf("+ {%d}  =  ", b);
    } // end if -- print "+" signs
  } // end rolls loop
  // finally, add bonus
  total += b;
  printf("%d\n", total);

  return total;
}

// overload for single roll
int dRoll( int n ) {
  // init
  int total(0);
  srand( time(NULL) ); // seed
  // roll
  total = 1 + rand() % n;
  // print
  printf("%d\n", total);
  return total;
}

