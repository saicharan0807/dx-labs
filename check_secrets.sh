#!/bin/bash
echo "Checking for potential secrets in code..."

# Check for common secret patterns
if grep -r "password=" . --exclude-dir=.git 2>/dev/null; then
  echo "WARNING: Found potential password in code!"
fi

if grep -r "api_key" . --exclude-dir=.git 2>/dev/null; then
  echo "WARNING: Found potential API key in code!"
fi

if grep -r "secret" . --exclude-dir=.git 2>/dev/null; then
  echo "WARNING: Found potential secret in code!"
fi

echo "Secret check completed."
