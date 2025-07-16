alias scan='scanimage -d "brother4:net1;dev0" --resolution 300 --mode Gray --format=png > ~/scan-$(date +%F_%H%M%S).png && echo "Scan saved."'
