#!/bin/bash
# Disabled — this pack forbids blind git add / commit / push.
# Use the manual workflow in ../SKILL.md (stage explicit paths only).

echo "smart_commit.sh is disabled in this skills pack." >&2
echo "Follow git-pushing/SKILL.md: stage only the paths the user asked to ship, then commit and push manually." >&2
exit 1
