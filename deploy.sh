#!/usr/bin/env bash
# 户外模式原型 —— 一键同步到 GitHub Pages
# 用法: bash deploy.sh "本次修改说明"
set -euo pipefail

cd "$(dirname "$0")"

MSG="${1:-更新户外模式原型}"
REPO="nancity11521-ai/outdoor-mode-widgets"
SITE="https://nancity11521-ai.github.io/outdoor-mode-widgets/"

echo "▶ 1/4 提交改动"
git add -A
if git diff --cached --quiet; then
  echo "  没有需要提交的改动"
else
  git commit -q -m "$MSG"
  git log --oneline -1
fi

echo "▶ 2/4 推送到 GitHub"
git push -q origin main
echo "  已推送 → $REPO"

echo "▶ 3/4 等待 Pages 上线"
for i in $(seq 1 20); do
  CODE=$(curl -s -o /dev/null -w "%{http_code}" "$SITE" || true)
  if [ "$CODE" = "200" ]; then
    echo "  $CODE <- $SITE"
    break
  fi
  echo "  [$i] http=$CODE 等待中…"
  sleep 8
done

echo "▶ 4/4 校验线上与本地一致性"
LOCAL=$(shasum outdoor-mode-interactive.html | cut -c1-12)
ONLINE=$(curl -s "${SITE}outdoor-mode-interactive.html" | shasum | cut -c1-12)
echo "  本地 $LOCAL / 线上 $ONLINE"
if [ "$LOCAL" = "$ONLINE" ]; then
  echo "✓ 同步完成"
else
  echo "⚠ 哈希不一致，Pages 可能仍在构建，稍后重试"
  exit 1
fi
