echo "当前用户：$(whoami)"
echo "当前目录：$(pwd)"
echo "磁盘剩余：$(df -h / | awk 'NR==2 {print $4}')"

