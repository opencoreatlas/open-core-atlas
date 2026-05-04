#!/usr/bin/env bash
# Quick wrapper for GitHub repo stats during data collection.
#
# Usage: ./scripts/github_stats.sh owner/repo
# Requires: gh CLI authenticated (gh auth login)

set -e
REPO="${1:?Usage: $0 owner/repo}"

echo "=== Repo: $REPO ==="
gh repo view "$REPO" --json stargazerCount,createdAt,pushedAt,description,primaryLanguage \
    --template '{{.description}}{{"\n"}}Stars: {{.stargazerCount}}{{"\n"}}Created: {{.createdAt}}{{"\n"}}Last push: {{.pushedAt}}{{"\n"}}Language: {{.primaryLanguage.name}}{{"\n"}}'

echo ""
echo "=== Commits last 12 months (sum of weekly) ==="
gh api "repos/$REPO/stats/commit_activity" 2>/dev/null | python3 -c "
import json, sys
data = json.load(sys.stdin)
if not isinstance(data, list):
    print('GitHub returned no data (may be still computing). Retry in 30s.')
    sys.exit(0)
total = sum(week.get('total', 0) for week in data)
print(f'Total commits last 52 weeks: {total}')
print(f'Weeks with >0 commits: {sum(1 for w in data if w.get(\"total\", 0) > 0)}')
"

echo ""
echo "=== Releases (last 12 months, max 20) ==="
gh release list --repo "$REPO" --limit 20

echo ""
echo "=== Contributors (top 10 by recent activity) ==="
gh api "repos/$REPO/contributors?per_page=10" --jq '.[] | "\(.login): \(.contributions) contributions"' 2>/dev/null || echo "Stats not available"
