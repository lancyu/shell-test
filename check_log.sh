LOG="run_$(date +%F_%H%M%S)"

echo "==开始=="
echo "时间:$(date +%F_%H%M%S)"
echo "==结束=="

if grep -q "erro" "$LOG" 2>/dev/null; then
	echo "发现error"
else
	echo "没有error"
fi

for i in 1 2 3; do
	echo "第$i次"
done

for f in *.sh; do
	echo "脚本：$f"
done
