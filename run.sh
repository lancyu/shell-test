#!/bin/bash
set -euo pipefail

LOG="test_$(date +%F_%H%M%S).log"

# ===== 练习2：trap，脚本退出时打印"清理完成" =====
trap 'echo "清理完成"' EXIT

log() {
  echo "[$(date +%H:%M:%S)] $*"
}

run_step() {
  local name="$1"
  shift
  log "== $name =="
  "$@"
}

# ===== 练习1：真实命令替换 echo =====
{
  run_step "查看目录" ls -la
  run_step "当前路径" pwd
  run_step "当前时间" date
} 2>&1 | tee "$LOG"

if grep -iE "error|fail|assert" "$LOG"; then
  log "测试失败，日志：$LOG"
  exit 1
fi

log "测试通过"
