set -euo pipefail

LOG="test_$(date +%F_%H%M%S).log"

log() {
	echo "[$(date +%H:%M:%S)] $*"
}

run_step() {
	local name="$1"
	shift
	log "==$name=="
	"$@"
}
{
	run_step "构建“ echo "假装在构建
	run_step "推送" echo "假装在推送"
	run_step "运行" echo "假装在运行"
} 2>&1 | tee "$LOG"

if grep -iE "error | fail | assert" "$LOG"; then
	log "测试失败，日志： %LOG"
	exit 1
fi

log “测试通过“
