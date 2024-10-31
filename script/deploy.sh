cd ..
mkdir temp

# 只在 GitHub Actions 环境中使用，确保密钥引用正确
GITHUB_URL="https://oauth:"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"@github.com/moegovs/moegovs.github.io"
git clone ${GITHUB_URL} temp

# 清空 temp 目录并移动新的文件
rm -rf temp/*
mv ./NapCatDocs/src/.vitepress/dist/* temp

# 进入 temp 并配置 Git
cd temp

# 仅在克隆仓库的情况下，不再添加远程 origin
git config --global user.name "Page Build"
git config --global user.email "test@wumiao.wang"

# 提交更改并推送
git add .
git commit -m "docs: auto update"
git push -f origin main
