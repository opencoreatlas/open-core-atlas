# GitHub Setup Runbook — Open Core Atlas

This runbook covers what YOU need to do (account creation, auth) so that the automated script can do the rest.

**Total time: ~15 min active + 5 min waiting**

---

## Step 1 — Create a clean throwaway email for the account (3 min)

This avoids tying the GitHub account to your personal Gmail forever.

**Option A (recommended): Free ProtonMail**

1. Go to https://proton.me/mail
2. Click "Create free account"
3. Username suggestion: `atlas.research` or `atlasresearch.bench` (any of these on @proton.me)
4. Set strong password, save in password manager
5. **Skip** any KYC / phone verification if offered
6. Verify the account works — send/receive a test email to your Gmail

**Option B (faster): Gmail alias**

If you want to skip Proton for now:
1. Use `your.real.gmail+atlasresearch@gmail.com` — Gmail aliases route to your inbox
2. Note: this still ties the account to your real-name Gmail. Less clean.

> Decision: **go with Option A**. Three minutes of friction now saves cleanup later when you migrate to `hello@opencoreatlas.com`.

---

## Step 2 — Create GitHub account (5 min)

1. Sign out of any existing GitHub session in your browser (or use an Incognito window)
2. Go to https://github.com/signup
3. **Email:** the Proton email from Step 1
4. **Password:** strong, save in password manager
5. **Username:** `opencoreatlas` (verified available)
6. Verify email (check Proton inbox)
7. Skip the personalization survey

**Configure the new account:**
1. Click your avatar (top right) → **Settings**
2. **Profile**:
   - **Name:** `Atlas Research`
   - **Bio:** `Independent benchmarks for commercial open source. Building The Open Core Atlas. → opencoreatlas.com`
   - **URL:** leave blank for now (will add when domain is live)
3. **Account → Profile email:** check "Keep my email addresses private"
4. **Password and authentication → Two-factor authentication:** enable with **Authenticator app** (NOT SMS).
   - Use Google Authenticator, Authy, 1Password, or similar
   - **Save the recovery codes** to a separate secure location

---

## Step 3 — Install gh CLI on your Mac (3 min)

In your terminal:

```bash
brew install gh
```

If you don't have Homebrew, install it first: https://brew.sh

Verify install:

```bash
gh --version
```

You should see something like `gh version 2.x.x`.

---

## Step 4 — Authenticate gh CLI (2 min)

```bash
gh auth login
```

Answer the prompts:
- Where do you use GitHub? → **GitHub.com**
- Preferred protocol for Git operations? → **HTTPS**
- Authenticate Git with your GitHub credentials? → **Yes**
- How would you like to authenticate GitHub CLI? → **Login with a web browser**

A browser opens. **Verify it logged in as `opencoreatlas`** (top-right avatar). If it logged in as your personal account, run:

```bash
gh auth logout
gh auth login --hostname github.com
```

And try again.

Verify auth:

```bash
gh auth status
```

Should say `Logged in to github.com account opencoreatlas`.

---

## Step 5 — Run the setup script (1 min)

```bash
cd "/Users/pablogarciacasasola/Documents/05_Cowork Projects/Side Project Hunt/Side Project Hunt/open-core-atlas"
chmod +x setup-github.sh
./setup-github.sh
```

The script does everything else automatically:
- Validates gh auth and directory
- Initializes git
- Creates `.gitignore`
- Commits all files
- Creates the public repo on GitHub
- Pushes initial commit
- Sets repo description, homepage, topics

Expected output: 6 steps with `OK` markers, ending with `DONE` and the repo URL.

---

## Step 6 — Tell me when done

Reply with **`github setup done`** and I'll verify the repo from my end:
- Confirm repo is live at correct URL
- Confirm GitHub Actions ran green
- Confirm topics + description correct
- Send you the URL to verify visually

---

## What happens if something fails?

**`gh auth status` fails** → run `gh auth login` again.

**Script fails at "[5/6]"** → most likely the repo name conflict or push permission issue. Run:
```bash
gh repo view opencoreatlas/open-core-atlas
```
If the repo exists but the push failed, run the script again — it's idempotent.

**Anything else** → paste the full error output and I'll fix the script.

---

## Optional polish (do later, not now)

- Profile picture: use https://ui-avatars.com/api/?name=Atlas+Research&background=1f2937&color=fff&size=400 → save image, upload via Settings → Profile
- Pinned repos: when you have 1+ repos, pin `open-core-atlas` to the top of the profile

These don't block anything and you can do them after the repo is live.
