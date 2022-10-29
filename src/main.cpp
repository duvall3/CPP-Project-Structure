/*! \file */
/// roll -- simulate and add k rolls of an n-sided die, with overall bonus b
/**
 *  USAGE: roll <SIDES>
 *        roll <ROLLS> <SIDES> [BONUS]
 * -- Or, in nerd lingo:
 *      roll a dN --> 'roll N'
 *      roll KdN --> 'roll K N'
 *      roll KdN + B --> 'roll K N B'
 * Examples:
 * -- to roll  d6:         roll 6
 * -- to roll 2d6:         roll 2 6
 * -- to roll 2d6 + 8:     roll 2 6 8
 * ~ Mark J. Duvall ~ duvall3@github.com ~ 11/2021 ~ //
 */

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include "mainRoll.h"

using namespace std;

// MAIN
int main( int argc, char* argv[] )
{
  /** MAIN function
   * \param argument list
   */
  return mainRoll(argc, argv);
}

// all pau!   )
