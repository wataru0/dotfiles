#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
PCT_RAW=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
PCT=$(printf '%.0f' "$PCT_RAW")
COST_RAW=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
COST=$(printf '$%.2f' "$COST_RAW")

CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; DIM='\033[2m'; RESET='\033[0m'

BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
  CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
  DIRTY_COUNT=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  DIRTY=""
  [ "$DIRTY_COUNT" -gt 0 ] && DIRTY=" ${YELLOW}✚${DIRTY_COUNT}${RESET}"
  [ -n "$CURRENT_BRANCH" ] && BRANCH=" ${DIM}|${RESET} 🌿 ${CURRENT_BRANCH}${DIRTY}"
fi

if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

BAR_WIDTH=20
FILLED=$((PCT * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))
BAR=""
[ "$FILLED" -gt 0 ] && printf -v FILL "%${FILLED}s" && BAR="${FILL// /█}"
[ "$EMPTY" -gt 0 ] && printf -v PAD "%${EMPTY}s" && BAR="${BAR}${PAD// /░}"

printf "${CYAN}%s${RESET} ${DIM}📁 %s${RESET}%b\n" "$MODEL" "${DIR##*/}" "$BRANCH"
printf "${BAR_COLOR}%s${RESET} %d%%${DIM} | 💰 %s${RESET}\n" "$BAR" "$PCT" "$COST"
