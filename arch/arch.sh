#!/usr/bin/env bash

features=(
  # base
  # fonts

  # hyprland

  # monitoring

  # dev
  # nvim
  # golang
  # flutter

  # perf

  office
)

for feature in "${features[@]}"; do
  echo "feature => ${feature}"
  if [ -f "${feature}.sh" ]; then
    bash "${feature}.sh"
  else
    echo "warn => ${feature}.sh not found"
  fi
done
