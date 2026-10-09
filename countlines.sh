#!/bin/bash

# 加个判断：如果没有 .sh 文件，*.sh 会原样变成 "*.sh" 这个字符串
shopt -s nullglob    # 让 *.sh 在没有匹配时变成空，而不是字面 "*.sh"

for f in *.sh; do
  lines=$(wc -l < "$f")
  printf "%-20s %s 行\n" "$f" "$lines"   # %-20s 让文件名左对齐，输出更整齐
done
