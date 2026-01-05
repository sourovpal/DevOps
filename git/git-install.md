# Git & Github Command

### 🧩 Install Git

```bash
    👉 sudo apt update
    👉 sudo apt install git -y
    👉 git --version
```

### 🧩 Git Config

```bash
    👉 git config --global user.name "Sourov Pal"
    👉 git config --global user.email "sourovpal@gmail.com"
```

### 🧩 Git Init

```bash
    👉 git init
    👉 git status
```

### 🧩 Git Add/Stage

```bash
    👉 git add .              # সব ফাইল add করতে
    👉 git add index.html    # নির্দিষ্ট ফাইল add করতে
    👉 git add index.html style.css # Multiple file যুক্ত করতে
    👉 git add -A             # বর্তমান ফোল্ডার + সাবফোল্ডারের সব পরিবর্তন add করে
    👉 git add --all          # সব changes (new, modified, deleted) add করে
    👉 git add src/           # নির্দিষ্ট ফোল্ডার add করতে
    👉 git add -u             # শুধু modified (tracked) ফাইল add করতে
    👉 git add -i             # Interactive / Selective add
    👉 git add -p             # menu দিয়ে ফাইল সিলেক্ট

    👉 git add -n .           # কি add হবে তা দেখার জন্য (dry run)

    # ফাইল add করা বাতিল করতে (unstage)

    👉 git restore --staged file.txt
    👉 git reset file.txt
```

### 🧩 Git Unstage

```bash
    👉 git restore --staged .              # ✅ Safe! সব staged ফাইল unstage করবে
    👉 git reset                           # ✅ Safe!
    👉 git reset HEAD                      # ✅ Safe!
    👉 git restore --staged file.txt       # ✅ Safe! নির্দিষ্ট ফাইল unstage
    👉 git reset --hard                    # ❌ Dangerous! Changes delete করে
```

### 🧩 Git Commit

```bash
    👉 git commit -m "message"     # সাধারণ commit
    👉 git commit -am "message"    # Add + Commit একসাথে
    👉 git commit                  # Commit message editor open
    👉 git commit --amend          # Previous commit amend করতে বা সাথে যুক্ত করতে
    👉 git commit --amend -m "new message"
    👉 git commit file.txt -m "message"             # Specific file commit
    👉 git commit --allow-empty -m "empty commit"   # Empty commit
    👉 git commit --no-edit        # Commit না করে message edit
    👉 git commit --no-verify      # Hooks skip করে commit (pre-commit hook skip)
    👉 git commit --author="Name <email@example.com>" # Author সহ commit
    👉 git commit --date="2025-01-01 10:00:00"        # Date সহ commit
    👉 git commit -v        # Verbose commit
    👉 git commit -C HEAD   # Reuse previous commit message [-C or -c]
    👉 git commit -m "Title" -m "Description"      # Multiple message lines
```

### 🧩 Git Uncommit With Unstage

```bash
    👉 git reset --soft HEAD~1      # Commit Delete করবে, কিন্তু ‍Stage থাকবে
    👉 git reset HEAD~1             # Commit & Stage Delete but file changes থাকবে
    👉 git reset --mixed HEAD~1     # Commit & Stage Delete but file changes থাকবে
    👉 git reset --hard HEAD~1      # ❌ Dangerous! Commit + Changes সব মুছে ফেলবে
    👉 git reset --soft HEAD~3      # একাধিক commit uncommit করতে
    👉 git reset --hard HEAD~3      # ❌ Dangerous! একাধিক commit uncommit, Unstage করতে With Code Delete
```

### 🧩 Github Remote URL Add/Change

```bash
    👉 git remote add origin https://github.com/<username>/<repo>.git          # Remote add
    👉 git remote set-url origin https://github.com/<username>/<new-repo>.git  # Remote Change
    👉 git remote remove origin                                                # Remote Remove
    👉 git remote -v               # Remote list দেখার জন্য
    👉 git remote show origin      # Verify করার জন্য
```

### 🧩 Git All Commands
```bash
    👉 git branch <branch-name>            # Create a new branch
    👉 git branch                          # Show Local Branch List
    👉 git branch -a                       # local + remote branch List

    📌 Branch delete

    👉 git branch -d <branch-name>             # Local Branch Delete
    👉 git branch -D <branch-name>             # Local Branch force delete
    👉 git push origin --delete <branch-name>  # Delete Remote Branch

    📌 Checkout / Switch Branch

    👉 git checkout <branch-name>              # Switch Branch
    👉 git checkout -b <new-branch>            # Create & Switch Branch
    👉 git switch <branch-name>                # Switch Branch [NEW]
    👉 git switch -c <branch-name>             # Create & Switch Branch [NEW]

    📌 Push Commands

    👉 git push -u origin <branch-name>        # প্রথমবার push
    👉 git push                                # সাধারণ push
    👉 git push origin main                    # নির্দিষ্ট branch push
    👉 git push --all                          # সব branch push
    👉 git push --set-upstream origin <branch-name>
    # --set-upstream এই branch কে remote tracking branch হিসেবে set করবে
    # -u = --set-upstream


    📌 Pull Commands

    👉 git pull                # pull = fetch + merge
    👉 git pull origin main    # নিদিষ্ট Branch
    👉 git pull --rebase       # rebase সহ pull

    📌 Clone Commands

    👉 git clone https://github.com/<username>/<repo>.git                       # repository clone
    👉 git clone -b branch-name https://github.com/<username>/<repo>.git        # নির্দিষ্ট branch clone
    👉 git clone --depth 1 https://github.com/<username>/<repo>.git             # Shallow clone

    📌 Fetch Commands

    👉 git fetch                       # সব remote branch fetch
    👉 git fetch origin                # সব remote branch fetch
    👉 git fetch origin branch-name    # নির্দিষ্ট branch fetch

    📌 Log Commands

    👉 git log
    👉 git log --oneline
    👉 git log --oneline --graph --all
    👉 git log -n 5
    👉 git log --author="Soruov Pal"
    👉 git log --since="2026-01-01" --until="2026-01-05"
    👉 git log --grep="fix"            # Commit message filter
    👉 git log -- path/to/file.txt     # Files filter
    👉 git log --pretty=oneline
    👉 git log --pretty=format:"%h - %an, %ar : %s"
    👉 git log -p                      # কোন ফাইলে কত line add/remove হয়েছে
    👉 git log -p --stat --name-only
    👉 git diff HEAD~2 HEAD
    👉 git diff --staged

    👉 git branch -vv
    # Current branch (যেখানে আপনি এখন আছেন)
    # Tracking branch (যে remote branch এর সাথে linked)
    # Last commit hash + message

    📌 নির্দিষ্ট commit অন্য branch-এ apply করা

    👉 git checkout main
    👉 git cherry-pick <commit-hash>

    📌 Stash (Temporary save changes) / Commit না করেও branch switch করার জন্য

    👉 git stash       # save current changes
    👉 git stash list  # list stashed changes
    👉 git stash apply # apply latest stash
    👉 git stash pop   # apply + remove from stash

    📌 Tagging - Release / version tracking

    👉 git tag v1.0.0
    👉 git tag -a v1.0.1 -m "Bug fixes"
    👉 git push origin --tags

   📌 Sparse Checkout

    👉 git sparse-checkout init --cone
    👉 git sparse-checkout set folder1 folder2

```










