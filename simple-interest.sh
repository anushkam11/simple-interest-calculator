#!/usr/bin/env bash
set -euo pipefail

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time (years): " time

for value in "$principal" "$rate" "$time"; do
  if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: enter non-negative numeric values." >&2
    exit 1
  fi
done

awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {printf "Simple interest: %.2f\n", p*r*t/100}'
