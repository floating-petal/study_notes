#!/bin/bash

set -e

echo "=== 更新软件源并安装 zsh ==="
sudo apt update
sudo apt install -y zsh

echo "=== 安装 oh-my-zsh（使用镜像加速） ==="
export REMOTE=https://ghproxy.com/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh -c "$(curl -fsSL $REMOTE)" "" --unattended

echo "=== 安装 zsh-autosuggestions 插件 ==="
git clone https://ghproxy.com/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "=== 安装 zsh-syntax-highlighting 插件 ==="
git clone https://ghproxy.com/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "=== 修改 ~/.zshrc 配置 ==="
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo "=== 设置 zsh 为默认 shell ==="
chsh -s $(which zsh)

echo "=== 应用配置 ==="
source ~/.zshrc

echo "✅ 安装完成！请重新打开终端以使用 zsh"
