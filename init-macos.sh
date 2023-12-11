#!/bin/bash

# 更新
./cloudflared-macos update

# wait
sleep 10

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ttyd

# 运行
nohup ttyd -i 127.0.0.1 bash &>/dev/null & disown
nohup ./cloudflared-macos tunnel --url http://127.0.0.1:7681 &> ./cf.log & disown
tail -f ./cf.log
