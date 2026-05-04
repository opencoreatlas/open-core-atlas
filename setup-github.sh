#!/usr/bin/env bash
# setup-github.sh — automates GitHub repo creation for Open Core Atlas
#
# Prerequisites (do these BEFORE running this script):
#   1. GitHub account 'opencoreatlas' created
#   2. gh CLI installed: brew install gh
#   3. gh auth login completed (use the opencoreatlas account)
#
# Run from inside the open-core-atlas/ directory:
#   chmod +x setup-github.sh
#   ./setup-github.sh

set -e

EXPECTED_USER="opencoreatlas"
REPO_NAME="open-core-atlas"
REPO_DESCRIPTION="Systematic benchmark of how commercial open source companies price, license, and gate features."
REPO_HOMEPAGE="https://opencoreatlas.com"

echo "================================================"
echo "  Open Core Atlas — GitHub Setup"
echo "================================================"

# ----- [1/6] Verify gh authenticated -----
echo ""
echo "[1/6] Verifying gh CLI auth..."
if ! command -v gh &>/dev/null; then
    echo "FAIL gh CLI not installed."
    echo "     Install with: brew install gh"
    exit 1
fi
if ! gh auth status &>/dev/null; then
    echo "FAIL gh CLI not authenticated."
    echo "     Run: gh auth login"
    echo "     Choose: GitHub.com -> HTTPS -> Login with a web browser"
    exit 1
fi
CURRENT_USER=$(gh api user --jq .login)
echo "     Authenticated as: $CURRENT_USER"

if [ "$CURRENT_USER" != "$EXPECTED_USER" ]; then
    echo ""
    echo "WARN authenticated as '$CURRENT_USER', expected '$EXPECTED_USER'."
    echo "     If this is intentional, type 'y' to continue."
    echo "     Otherwise type N and run: gh auth login --hostname github.com"
    echo ""
    read -p "     Continue with $CURRENT_USER? [y/N] " answer
    if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
        echo "     Aborted."
        exit 1
    fi
fi

# ----- [2/6] Verify in correct directory -----
echo ""
echo "[2/6] Verifying repo location..."
if [ ! -f "schema/company.schema.json" ]; then
    echo "FAIL Not in open-core-atlas/ directory."
    echo "     cd into the open-core-atlas/ folder before running this script."
    exit 1
fi
if [ ! -d "data/companies" ]; then
    echo "FAIL data/companies/ directory missing."
    exit 1
fi
STUB_COUNT=$(ls data/companies/*.json 2>/dev/null | wc -l | tr -d ' ')
echo "     OK in: $(pwd)"
echo "     OK $STUB_COUNT company stubs found"

# ----- [3/6] Initialize git if needed -----
echo ""
echo "[3/6] Initializing git..."
if [ ! -d ".git" ]; then
    git init -q
    git branch -M main
    echo "     OK initialized fresh repo on branch main"
else
    BRANCH=$(git branch --show-current)
    echo "     OK git already initialized (current branch: $BRANCH)"
    if [ "$BRANCH" != "main" ]; then
        git branch -M main
        echo "     OK renamed branch to main"
    fi
fi

# Set LOCAL repo git identity so future manual commits also use the pseudonym.
# This does NOT touch your global ~/.gitconfig.
git config user.name "Atlas Research"
git config user.email "281491795+opencoreatlas@users.noreply.github.com"
echo "     OK local git identity set to Atlas Research / noreply email"

# Create .gitignore if missing
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << 'GITIGNORE'
# Python
__pycache__/
*.pyc
.venv/

# OS
.DS_Store
Thumbs.db

# Editors
.vscode/
.idea/
*.swp

# Local research notes (not for public repo)
data/research-notes/
GITIGNORE
    echo "     OK created .gitignore"
fi

# ----- [4/6] Stage and commit -----
echo ""
echo "[4/6] Committing files..."
git add .
if git diff --cached --quiet; then
    echo "     OK nothing to commit (already up to date)"
else
    git -c user.name="Atlas Research" -c user.email="281491795+opencoreatlas@users.noreply.github.com" \
        commit -q -m "Initial: schema, vocabularies, and 30 company stubs"
    echo "     OK initial commit created"
fi

# ----- [5/6] Create remote repo or skip if exists -----
echo ""
echo "[5/6] Creating GitHub repo..."
if gh repo view "$CURRENT_USER/$REPO_NAME" &>/dev/null; then
    echo "     OK repo already exists at github.com/$CURRENT_USER/$REPO_NAME"
    # Make sure remote is configured
    if ! git remote get-url origin &>/dev/null; then
        git remote add origin "https://github.com/$CURRENT_USER/$REPO_NAME.git"
        echo "     OK origin remote configured"
    fi
    git push -u origin main
    echo "     OK pushed to existing repo"
else
    gh repo create "$REPO_NAME" \
        --public \
        --description "$REPO_DESCRIPTION" \
        --homepage "$REPO_HOMEPAGE" \
        --source=. \
        --remote=origin \
        --push
    echo "     OK repo created and pushed"
fi

# ----- [6/6] Configure topics -----
echo ""
echo "[6/6] Configuring repo topics..."
gh repo edit "$CURRENT_USER/$REPO_NAME" \
    --add-topic open-source \
    --add-topic open-core \
    --add-topic commercial-open-source \
    --add-topic coss \
    --add-topic licensing \
    --add-topic benchmark \
    --add-topic dataset \
    --add-topic research \
    >/dev/null
echo "     OK topics added: open-source, open-core, commercial-open-source, coss,"
echo "                      licensing, benchmark, dataset, research"

echo ""
echo "================================================"
echo "  DONE"
echo "================================================"
echo ""
echo "Repo live at: https://github.com/$CURRENT_USER/$REPO_NAME"
echo ""
echo "Verify these manually:"
echo "  1. Open https://github.com/$CURRENT_USER/$REPO_NAME — README renders correctly"
echo "  2. Click 'Actions' tab — first validate.yml run should be green ✓"
echo "  3. Click 'About' (top-right gear) — verify topics + homepage URL"
echo ""
echo "Then tell me 'github setup done' and I'll verify from my end."
