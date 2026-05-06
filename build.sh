#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

BIN_NAME="mhr-cfw-go"

echo "========================================"
echo " MHR-CFW Go Builder (Linux)"
echo "========================================"
echo

if [[ ! -f "go.mod" ]]; then
  echo "Error: go.mod not found. Make sure you are in the project directory."
  exit 1
fi

echo "Building ${BIN_NAME}..."
echo
go build -ldflags "-s -w" -o "${BIN_NAME}" ./cmd/mhr-cfw
echo
echo "Build successful: ${BIN_NAME}"
echo "Done! Run with: ./${BIN_NAME}"