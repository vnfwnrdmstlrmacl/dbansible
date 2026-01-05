#!/usr/bin/env bash
set -e

BASE="/root/ansible"
OUT="/root/ansible_REAL_CODE.txt"

echo "===== ANSIBLE REAL CODE DUMP =====" > "$OUT"
echo "Generated: $(date)" >> "$OUT"
echo "Host: $(hostname)" >> "$OUT"
echo >> "$OUT"

echo "===== DIRECTORY TREE =====" >> "$OUT"
(cd "$BASE" && find . -type f | sort) >> "$OUT"
echo >> "$OUT"

echo "===== FILE CONTENTS =====" >> "$OUT"

cd "$BASE"

for f in $(find . -type f | sort); do
  echo >> "$OUT"
  echo "----- FILE: $f -----" >> "$OUT"
  echo >> "$OUT"
  cat "$f" >> "$OUT"
  echo >> "$OUT"
  echo "----- END FILE: $f -----" >> "$OUT"
done

echo >> "$OUT"
echo "===== END OF DUMP =====" >> "$OUT"

echo "OK: $OUT 생성 완료"
