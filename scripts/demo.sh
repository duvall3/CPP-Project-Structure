#!/bin/bash
# demo.sh -- demonstrate/test the 'roll' program
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2022 ~ #

#Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# dir check
ORIG_PWD=$PWD
if [[ $PWD =~ scripts ]]; then
  cd ..
fi

# basic roll
echo -e "\nRolling 2d6 with a bonus of 5..."
roll 2 6 5

# batch rolls
echo -e "\nThrowing rolls from data/list.txt..."
NUM_LINES=$('wc' -l data/list.txt | awk '{print $1}')
for (( K = 1; K <= $NUM_LINES; K++ )) {
  roll $(awk -v k=$K 'NR==k' data/list.txt)
}

# finish up
cd $ORIG_PWD
echo

# all pau!   )
exit 0
