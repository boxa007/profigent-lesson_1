#!/bin/bash
#
# Profigent · Company Context Model Skill — інсталятор
# One-liner: curl -sSL https://raw.githubusercontent.com/boxa007/profigent-lesson_1/main/install.sh | bash
#

set -e

REPO_URL="https://github.com/boxa007/profigent-lesson_1.git"
SKILL_NAME="company-context-model"
SKILLS_DIR="$HOME/.claude/skills"
TARGET="$SKILLS_DIR/$SKILL_NAME"

echo ""
echo "🚀 Встановлення скіла: $SKILL_NAME"
echo ""

# 1. Створити папку скілів якщо немає
mkdir -p "$SKILLS_DIR"

# 2. Якщо скіл вже встановлений — оновити
if [ -d "$TARGET" ]; then
  echo "⚠️  Скіл вже встановлений у $TARGET — оновлюю..."
  cd "$TARGET"
  git pull --rebase
  echo "✅ Оновлено."
else
  echo "📥 Клоную репо у $TARGET..."
  git clone "$REPO_URL" "$TARGET"
  echo "✅ Склоновано."
fi

echo ""
echo "==============================================="
echo "✅ Скіл встановлено: $SKILL_NAME"
echo ""
echo "Як запустити (у Claude Code):"
echo "  /$SKILL_NAME"
echo ""
echo "Або фразою:"
echo "  'Створи контекстну модель моєї компанії'"
echo "==============================================="
echo ""
