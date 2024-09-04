#!/bin/bash

# Function to display a countdown timer
countdown() {
  local SECONDS=$1
  while [ $SECONDS -gt 0 ]; do
    echo -ne "$(date -u --date @$SECONDS +%H:%M:%S)\r"
    sleep 1
    : $((SECONDS--))
  done
}

# Pomodoro timer function
pomodoro_timer() {
  local WORK_DURATION=$((25 * 60))  # 25 minutes in seconds
  local BREAK_DURATION=$((5 * 60))  # 5 minutes in seconds
  local CYCLES=4  # Number of Pomodoro cycles

  for ((i=1; i<=CYCLES; i++)); do
    echo "Cycle $i of $CYCLES"
    echo "Work for 25 minutes"
    countdown $WORK_DURATION
    echo "Time for a 5-minute break"
    countdown $BREAK_DURATION
  done
  echo "All cycles completed! Great job!"
}

# Run the Pomodoro timer
pomodoro_timer
