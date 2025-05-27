#!/bin/bash

# Default values
FILTER=""
PHASE="all"
DRYRUN=false
BASE_PATH="../dev-env"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
  -f | --filter)
    FILTER="$2"
    shift 2
    ;;
  -p | --phase)
    PHASE="$2"
    shift 2
    ;;
  --dry-run)
    DRYRUN=true
    shift
    ;;
  *)
    echo "Unknown option: $1"
    exit 1
    ;;
  esac
done

# Resolve phase paths
ALL_PHASES=()
case "$PHASE" in
all)
  ALL_PHASES=(
    "$BASE_PATH/install"
    "$BASE_PATH/config"
  )
  ;;
install)
  ALL_PHASES=("$BASE_PATH/install")
  ;;
config)
  ALL_PHASES=("$BASE_PATH/config")
  ;;
uninstall)
  ALL_PHASES=("$BASE_PATH/uninstall")
  ;;
*)
  echo "Invalid phase: $PHASE"
  exit 1
  ;;
esac

# Main logic
for PHASE_PATH in "${ALL_PHASES[@]}"; do
  PHASE_NAME=$(basename "$PHASE_PATH" | tr '[:lower:]' '[:upper:]')
  ABS_PHASE_PATH=$(realpath "$PHASE_PATH" 2>/dev/null)

  if [[ ! -d "$ABS_PHASE_PATH" ]]; then
    echo "Skipping $PHASE_NAME — Directory not found: $PHASE_PATH"
    continue
  fi

  echo "PHASE: $PHASE_NAME — SEARCHING IN: $ABS_PHASE_PATH"

  for SCRIPT in "$ABS_PHASE_PATH"/*.sh; do
    [[ -e "$SCRIPT" ]] || continue

    if [[ -n "$FILTER" ]] && [[ "$SCRIPT" != *"$FILTER"* ]]; then
      continue
    fi

    echo "Running Script: $SCRIPT"
    if [[ "$DRYRUN" != true ]]; then
      bash "$SCRIPT"
    fi
  done
done
