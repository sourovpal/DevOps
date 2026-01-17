# Git এবং GitHub: ১০০ ইন্টারভিউ প্রশ্ন ও উত্তর (বাংলায়)

## **বেসিক কনসেপ্ট (১-২০)**

### ১. Git কি?
**উত্তর:** Git হল একটি ডিস্ট্রিবিউটেড ভার্সন কন্ট্রোল সিস্টেম যা সফটওয়্যার ডেভেলপমেন্টে কোডের পরিবর্তন ট্র্যাক করতে ব্যবহৃত হয়।

### ২. Version Control System (VCS) কি?
**উত্তর:** VCS হল একটি সিস্টেম যা ফাইলের পরিবর্তনসমূহ ট্র্যাক করে এবং নির্দিষ্ট সময়ে নির্দিষ্ট ভার্সনে ফিরে যাওয়ার সুযোগ দেয়।

### ৩. GitHub কি?
**উত্তর:** GitHub হল একটি ক্লাউড-বেসড প্ল্যাটফর্ম যেখানে Git রিপোজিটরি হোস্ট করা হয় এবং ডেভেলপাররা একসাথে কাজ করতে পারে।

### ৪. Git vs GitHub পার্থক্য কি?
**উত্তর:**
- **Git:** ভার্সন কন্ট্রোল সিস্টেম (টুল)
- **GitHub:** Git রিপোজিটরি হোস্ট করার প্ল্যাটফর্ম (সেবা)

### ৫. Distributed Version Control System (DVCS) কি?
**উত্তর:** DVCS-এ প্রতিটি ডেভেলপারের লোকাল মেশিনে সম্পূর্ণ রিপোজিটরি কপি থাকে, যা সেন্ট্রাল সার্ভার ছাড়াই কাজ করতে সহায়তা করে।

### ৬. Repository কি?
**উত্তর:** রিপোজিটরি হল একটি প্রকল্পের সমস্ত ফাইল এবং তাদের পরিবর্তনের হিস্ট্রি সংরক্ষণের স্থান।

### ৭. Local vs Remote Repository পার্থক্য?
**উত্তর:**
- **লোকাল:** আপনার কম্পিউটারে স্টোর করা রিপোজিটরি
- **রিমোট:** সার্ভারে হোস্ট করা রিপোজিটরি (GitHub, GitLab, etc.)

### ৮. Git install কিভাবে করব?
**উত্তর:**
```bash
# Ubuntu/Debian
sudo apt-get install git

# Windows
# Git official website থেকে ডাউনলোড করুন

# Mac
brew install git
```

### ৯. Git কনফিগারেশন কিভাবে করব?
**উত্তর:**
```bash
git config --global user.name "আপনার নাম"
git config --global user.email "আপনার ইমেইল"
git config --list # কনফিগারেশন চেক করতে
```

### ১০. .gitignore ফাইল কি?
**উত্তর:** এটি একটি ফাইল যেখানে উল্লেখ করা ফাইল/ফোল্ডারগুলো Git ট্র্যাক করবে না (যেমন: node_modules, .env, log files)।

## **বেসিক কমান্ড (২১-৪০)**

### ১১. Git init কমান্ড কি করে?
**উত্তর:** নতুন Git রিপোজিটরি ইনিশিয়ালাইজ করে।
```bash
git init
```

### ১২. Git clone কমান্ড কি?
**উত্তর:** রিমোট রিপোজিটরি থেকে লোকাল মেশিনে কপি করে।
```bash
git clone <repository-url>
```

### ১৩. Git status কমান্ডের কাজ?
**উত্তর:** কারেন্ট ব্রাঞ্চ এবং ফাইলগুলোর স্টেটাস দেখায়।
```bash
git status
```

### ১৪. Git add কমান্ডের ব্যবহার?
**উত্তর:** ফাইলগুলো স্টেজিং এরিয়াতে এড করে।
```bash
git add filename.txt       # একটি ফাইল এড
git add .                  # সব ফাইল এড
git add *.js               # সব .js ফাইল এড
```

### ১৫. Git commit কি করে?
**উত্তর:** স্টেজ করা পরিবর্তনসমূহ রিপোজিটরিতে সেভ করে।
```bash
git commit -m "Commit message"
```

### ১৬. Git push কমান্ডের কাজ?
**উত্তর:** লোকাল কমিটগুলো রিমোট রিপোজিটরিতে পাঠায়।
```bash
git push origin main
```

### ১৭. Git pull কমান্ড কি?
**উত্তর:** রিমোট রিপোজিটরি থেকে সর্বশেষ পরিবর্তন লোকালে নিয়ে আসে।
```bash
git pull origin main
```

### ১৮. Git fetch vs Git pull পার্থক্য?
**উত্তর:**
- **fetch:** শুধু ডেটা ডাউনলোড করে, মার্জ করে না
- **pull:** ডেটা ডাউনলোড করে এবং মার্জ করে

### ১৯. Git log কিভাবে দেখব?
**উত্তর:**
```bash
git log                    # সব কমিট দেখাবে
git log --oneline          # সংক্ষিপ্তভাবে দেখাবে
git log --graph            # গ্রাফ আকারে দেখাবে
```

### ২০. Git diff কমান্ডের কাজ?
**উত্তর:** ফাইলগুলোর পরিবর্তন দেখায়।
```bash
git diff                   # আনস্টেজড পরিবর্তন দেখায়
git diff --staged          # স্টেজড পরিবর্তন দেখায়
```

## **ব্রাঞ্চিং এবং মার্জিং (৪১-৬০)**

### ২১. Branch কি?
**উত্তর:** ব্রাঞ্চ হল মূল কোডের একটি স্বাধীন লাইন যা আলাদাভাবে ডেভেলপমেন্ট করতে সহায়তা করে।

### ২২. কিভাবে নতুন ব্রাঞ্চ তৈরি করব?
**উত্তর:**
```bash
git branch branch-name      # ব্রাঞ্চ তৈরি
git checkout branch-name    # ব্রাঞ্চে সুইচ
# বা
git checkout -b branch-name # একসাথে তৈরি এবং সুইচ
```

### ২৩. কিভাবে ব্রাঞ্চ লিস্ট দেখব?
**উত্তর:**
```bash
git branch                  # লোকাল ব্রাঞ্চ লিস্ট
git branch -a               # সব ব্রাঞ্চ (লোকাল + রিমোট)
```

### ২৪. Merge কি?
**উত্তর:** একটি ব্রাঞ্চের পরিবর্তন অন্য ব্রাঞ্চে এড করা।

### ২৫. কিভাবে ব্রাঞ্চ মার্জ করব?
**উত্তর:**
```bash
git checkout main           # টার্গেট ব্রাঞ্চে যান
git merge feature-branch    # ফিচার ব্রাঞ্চ মার্জ করুন
```

### ২৬. Merge conflict কি এবং কিভাবে সলভ করব?
**উত্তর:** Merge conflict হয় যখন Git স্বয়ংক্রিয়ভাবে পরিবর্তন মার্জ করতে পারে না।

**Conflict সলভ করার ধাপ:**
1. Conflict আছে এমন ফাইল খুলুন
2. Conflict মার্কার (<<<<<<<, =======, >>>>>>>) খুঁজুন
3. প্রয়োজনীয় কোড রাখুন এবং মার্কার মুছুন
4. ফাইল সেভ করুন
5. পরিবর্তন কমিট করুন

### ২৭. Rebase কি?
**উত্তর:** Rebase হল একটি ব্রাঞ্চের কমিট হিস্ট্রি অন্য ব্রাঞ্চের উপরে পুনরায় অ্যাপ্লাই করা।

### ২৮. Merge vs Rebase পার্থক্য?
**উত্তর:**
- **Merge:** নতুন কমিট তৈরি করে, হিস্ট্রি প্রিজার্ভ করে
- **Rebase:** হিস্ট্রি রিওরগানাইজ করে, লিনিয়ার হিস্ট্রি তৈরি করে

### ২৯. Fast-forward merge কি?
**উত্তর:** যখন টার্গেট ব্রাঞ্চে নতুন কমিট না থাকে, তখন ব্রাঞ্চ পয়েন্টার সরাসরি মুভ করে।

### ৩০. কিভাবে ব্রাঞ্চ ডিলিট করব?
**উত্তর:**
```bash
git branch -d branch-name   # মার্জ করা ব্রাঞ্চ ডিলিট
git branch -D branch-name   # ফোর্স ডিলিট
```

## **এডভান্সড কনসেপ্ট (৬১-৮০)**

### ৩১. Staging Area কি?
**উত্তর:** স্টেজিং এরিয়া হল একটি মধ্যবর্তী স্থান যেখানে কমিটের জন্য ফাইল প্রস্তুত করা হয়।

### ৩২. HEAD কি?
**উত্তর:** HEAD হল পয়েন্টার যা কারেন্ট ব্রাঞ্চের সর্বশেষ কমিট নির্দেশ করে।

### ৩৩. Detached HEAD স্টেট কি?
**উত্তর:** যখন HEAD সরাসরি কোনো কমিট পয়েন্ট করে, কোনো ব্রাঞ্চ না করে।

### ৩৪. Cherry-pick কি?
**উত্তর:** নির্দিষ্ট কমিট বর্তমান ব্রাঞ্চে এপ্লাই করা।
```bash
git cherry-pick <commit-hash>
```

### ৩৫. Stash কি?
**উত্তর:** অস্থায়ীভাবে পরিবর্তন সেভ করে অন্য কাজ করার সুযোগ দেয়।
```bash
git stash                   # পরিবর্তন স্ট্যাশ করুন
git stash pop               # স্ট্যাশ থেকে ফিরিয়ে আনুন
git stash list              # সব স্ট্যাশ দেখুন
```

### ৩৬. Reset vs Revert পার্থক্য?
**উত্তর:**
- **Reset:** কমিট হিস্ট্রি পরিবর্তন করে (পাবলিক হিস্টোরির জন্য বিপজ্জনক)
- **Revert:** নতুন কমিট তৈরি করে পূর্ববর্তী কমিট undo করে (সেফ)

### ৩৭. তিন ধরণের Reset:
```bash
git reset --soft <commit>   # শুধু HEAD মোভ করে
git reset --mixed <commit>  # ডিফল্ট, HEAD এবং স্টেজিং
git reset --hard <commit>   # সবকিছু মুছে ফেলে
```

### ৩৮. Tag কি?
**উত্তর:** ট্যাগ নির্দিষ্ট কমিটকে মার্ক করে (সাধারণত রিলিজের জন্য)।
```bash
git tag v1.0.0              # লাইটওয়েট ট্যাগ
git tag -a v1.0.0 -m "Version 1.0.0" # অ্যানোটেটেড ট্যাগ
```

### ৩৯. .git ডিরেক্টরিতে কি থাকে?
**উত্তর:**
- config (কনফিগারেশন)
- HEAD (কারেন্ট ব্রাঞ্চ)
- objects (ডেটাবেস)
- refs (রেফারেন্স)
- hooks (স্ক্রিপ্ট)

### ৪০. Hooks কি?
**উত্তর:** হুকস হল অটোমেটেড স্ক্রিপ্ট যা নির্দিষ্ট Git ইভেন্টে এক্সিকিউট হয়।

## **GitHub স্পেসিফিক (৮১-১০০)**

### ৪১. Fork vs Clone পার্থক্য?
**উত্তর:**
- **Fork:** GitHub-এ রিপোজিটরি কপি করে আপনার অ্যাকাউন্টে
- **Clone:** লোকাল মেশিনে রিপোজিটরি কপি করে

### ৪২. Pull Request (PR) কি?
**উত্তর:** PR হল একটি রিকোয়েস্ট যার মাধ্যমে আপনি অন্য রিপোজিটরিতে আপনার পরিবর্তন মার্জ করতে বলেন।

### ৪৩. কিভাবে PR তৈরি করব?
**ধাপ:**
1. রিপো Fork করুন
2. Clone করুন
3. নতুন ব্রাঞ্চ তৈরি করুন
4. পরিবর্তন করুন
5. Push করুন
6. GitHub-এ Pull Request তৈরি করুন

### ৪৪. Issue কি?
**উত্তর:** Issue হল একটি ট্র্যাকিং সিস্টেম যেখানে বাগ, ফিচার রিকোয়েস্ট ইত্যাদি ট্র্যাক করা হয়।

### ৪৫. GitHub Flow কি?
**ধাপ:**
1. Main ব্রাঞ্চ থেকে নতুন ব্রাঞ্চ তৈরি
2. পরিবর্তন কমিট
3. Pull Request তৈরি
4. রিভিউ এবং ডিসকাশন
5. Merge
6. ডিপ্লয়

### ৪৬. Code Review কিভাবে করব?
**উত্তর:** PR-এ গিয়ে:
- লাইন বাই লাইন কমেন্ট করুন
- চেঞ্জেস রিভিউ করুন
- Request changes বা Approve করুন

### ৪৭. GitHub Actions কি?
**উত্তর:** CI/CD ওয়ার্কফ্লো অটোমেট করার টুল।

### ৪৮. README.md ফাইলের গুরুত্ব?
**উত্তর:** প্রজেক্টের ডকুমেন্টেশন, Installation guide, usage ইত্যাদি থাকে।

### ৪৯. License ফাইলের গুরুত্ব?
**উত্তর:** সফটওয়্যার ব্যবহারের শর্তাবলী নির্দেশ করে।

### ৫০. কিভাবে Contribution করব Open Source প্রজেক্টে?
**ধাপ:**
1. প্রজেক্ট Fork করুন
2. Clone করুন
3. পরিবর্তন করুন
4. Test করুন
5. Pull Request তৈরি করুন


# Git এবং GitHub: অতিরিক্ত ৫০ ইন্টারভিউ প্রশ্ন ও উত্তর (বাংলায়)

## **এডভান্সড Git কনসেপ্ট (৫১-১০০)**

### ৫১. Git Workflow কি এবং কয় ধরনের?
**উত্তর:** Git Workflow হল টিমে কীভাবে Git ব্যবহার করা হবে তার প্রক্রিয়া। প্রধান ধরণ:
- Git Flow
- GitHub Flow
- GitLab Flow
- Feature Branch Workflow
- Forking Workflow

### ৫২. Git Flow ব্যাখ্যা করুন
**উত্তর:**
```bash
main (production)
develop (development)
feature/ (new features)
release/ (pre-production)
hotfix/ (urgent fixes)
```

### ৫৩. Squash Commit কি?
**উত্তর:** একাধিক কমিটকে একটি কমিটে রূপান্তর করা।
```bash
git rebase -i HEAD~3  # শেষ ৩টি কমিট squash
```

### ৫৪. Git Bisect কি?
**উত্তর:** বাইনারি সার্চ ব্যবহার করে কোন কমিটে বাগ চলে এসেছে তা বের করা।
```bash
git bisect start
git bisect bad        # কারেন্ট ভার্সন bad
git bisect good v1.0  # আগের good ভার্সন
```

### ৫৫. Git Reflog কি?
**উত্তর:** রেফারেন্স লগ যা HEAD এবং ব্রাঞ্চ রেফারেন্সের পরিবর্তন ট্র্যাক করে।
```bash
git reflog            # সব রেফারেন্স লগ দেখায়
git reflog show --all # বিস্তারিত দেখায়
```

### ৫৬. Git Submodule কি?
**উত্তর:** একটি Git রিপোজিটরির ভিতরে অন্য Git রিপোজিটরি যোগ করা।
```bash
git submodule add <repository-url>
git submodule update --init --recursive
```

### ৫৭. Git Subtree কি?
**উত্তর:** Submodule-এর বিকল্প, একটি রিপোজিটরির অংশ অন্য রিপোজিটরিতে যোগ করা।

### ৫৮. Git Hooks-এর উদাহরণ দিন
**উত্তর:**
- pre-commit: কমিটের আগে টেস্ট রান করে
- pre-push: পুশের আগে ভ্যালিডেশন করে
- post-merge: মার্জের পর নির্দিষ্ট কাজ করে

### ৫৯. Git Attributes কি?
**উত্তর:** নির্দিষ্ট ফাইলের জন্য বিশেষ নিয়ম সেট করা।
```bash
# .gitattributes ফাইলে
*.txt text
*.jpg binary
```

### ৬০. Git Bundle কি?
**উত্তর:** সম্পূর্ণ রিপোজিটরি একটি ফাইলে সংরক্ষণ করা।
```bash
git bundle create repo.bundle --all
git clone repo.bundle
```

## **Git ইন্টারনালস (৬১-৭০)**

### ৬১. Git-এর তিনটি প্রধান এরিয়া কি?
**উত্তর:**
1. Working Directory
2. Staging Area (Index)
3. Git Directory (Repository)

### ৬২. Git Objects কয় প্রকার?
**উত্তর:** ৪ প্রকার:
1. Blob (বাইনারি লার্জ অবজেক্ট) - ফাইল ডেটা
2. Tree - ডিরেক্টরি স্ট্রাকচার
3. Commit - মেটাডেটা
4. Tag - নির্দিষ্ট কমিট রেফারেন্স

### ৬৩. SHA-1 Hash কি?
**উত্তর:** Git-এ প্রতিটি অবজেক্টের ৪০-ডিজিটের ইউনিক আইডেন্টিফায়ার।
```bash
# উদাহরণ
a1b2c3d4e5f67890123456789012345678901234
```

### ৬৪. Git-এ ডেটা কিভাবে স্টোর হয়?
**উত্তর:** Key-value ডেটাবেসে, যেখানে key হল SHA-1 hash এবং value হল অবজেক্ট কন্টেন্ট।

### ৬৫. Packfile কি?
**উত্তর:** একাধিক Git অবজেক্ট কমপ্রেস করে একটি ফাইলে রাখে।

### ৬৬. Git GC (Garbage Collection) কি?
**উত্তর:** আনউজড অবজেক্ট ক্লিন আপ করে।
```bash
git gc --auto
```

### ৬৭. Loose Object vs Packed Object?
**উত্তর:**
- **Loose:** আলাদা অবজেক্ট
- **Packed:** কমপ্রেসড অবজেক্ট প্যাকফাইলে

### ৬৮. Git-এ Branch কিভাবে কাজ করে?
**উত্তর:** ব্রাঞ্চ হল একটি পয়েন্টার যা একটি কমিটকে নির্দেশ করে। নতুন কমিট করলে পয়েন্টার মুভ হয়।

### ৬৯. Detached HEAD থেকে কিভাবে ফিরব?
**উত্তর:**
```bash
git checkout branch-name  # কোনো ব্রাঞ্চে ফিরতে
git checkout -b new-branch # নতুন ব্রাঞ্চ তৈরি করে
```

### ৭০. ORIG_HEAD কি?
**উত্তর:** ঝুঁকিপূর্ণ অপারেশনের আগের HEAD অবস্থা সংরক্ষণ করে।

## **Git সিকিউরিটি এবং বেস্ট প্র্যাকটিস (৭১-৮০)**

### ৭১. Git-এ সিকিউরিটি বেস্ট প্র্যাকটিস
**উত্তর:**
- SSH keys ব্যবহার
- .gitignore-এ সেন্সিটিভ ফাইল রাখা
- Regular security updates
- Signed commits

### ৭২. Signed Commit কি?
**উত্তর:** GPG key দিয়ে কমিট verify করা।
```bash
git commit -S -m "Signed commit"
```

### ৭৩. কিভাবে .gitignore ফাইল তৈরি করব?
**উত্তর:**
```bash
# .gitignore ফাইলে
node_modules/
.env
*.log
.DS_Store
```

### ৭৪. Global .gitignore কিভাবে সেট করব?
**উত্তর:**
```bash
git config --global core.excludesfile ~/.gitignore_global
```

### ৭৫. Commit message বেস্ট প্র্যাকটিস
**উত্তর:**
```
type(scope): subject

body

footer
```

### ৭৬. Conventional Commits কি?
**উত্তর:** স্ট্যান্ডার্ডাইজড কমিট মেসেজ ফরম্যাট:
- feat: নতুন ফিচার
- fix: বাগ ফিক্স
- docs: ডকুমেন্টেশন
- style: ফরম্যাটিং
- refactor: কোড রিফ্যাক্টর
- test: টেস্ট

### ৭৭. Git Large File Storage (LFS) কি?
**উত্তর:** বড় ফাইল (ভিডিও, ইমেজ) ম্যানেজ করার টুল।
```bash
git lfs install
git lfs track "*.psd"
```

### ৭৮. Shallow Clone কি?
**উত্তর:** শুধুমাত্র সর্বশেষ কমিট সহ ক্লোন করা।
```bash
git clone --depth 1 <repository-url>
```

### ৭৯. Git Archive কি?
**উত্তর:** রিপোজিটরি থেকে ফাইল এক্সপোর্ট করা।
```bash
git archive --format=zip HEAD > project.zip
```

### ৮০. Git-এ Backup কিভাবে নিব?
**উত্তর:**
```bash
git bundle create backup.bundle --all
git clone backup.bundle backup-folder
```

## **GitHub এডভান্সড (৮১-৯০)**

### ৮১. GitHub Pages কি?
**উত্তর:** স্ট্যাটিক ওয়েবসাইট হোস্ট করার সার্ভিস।
```bash
# Settings > Pages > Branch: gh-pages
```

### ৮২. GitHub Gist কি?
**উত্তর:** কোড স্নিপেট শেয়ার করার সার্ভিস।

### ৮৩. GitHub Organizations কি?
**উত্তর:** মাল্টিপল ইউজার এবং টিম ম্যানেজ করার টুল।

### ৮৪. GitHub Projects কি?
**উত্তর:** কানবান বোর্ড স্টাইল প্রজেক্ট ম্যানেজমেন্ট।

### ৮৫. GitHub Discussions কি?
**উত্তর:** কমিউনিটি ডিসকাশন ফোরাম।

### ৮৬. GitHub Sponsors কি?
**উত্তর:** ওপেন সোর্স ডেভেলপারদের স্পনসর করার সিস্টেম।

### ৮৭. GitHub Copilot কি?
**উত্তর:** AI-পাওয়ার্ড কোড কমপ্লিশন টুল।

### ৮৮. GitHub Actions Workflow ফাইল স্ট্রাকচার
```yaml
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: npm install
      - run: npm test
```

### ৮৯. GitHub Secrets কিভাবে সেট করব?
**উত্তর:** Settings > Secrets > New repository secret

### ৯০. GitHub Templates কি?
**উত্তর:** প্রি-ডিফাইন্ড ইস্যু, PR এবং রিপো টেমপ্লেট।

## **প্রবলেম সলভিং (৯১-১০০)**

### ৯১. Accidentally committed to wrong branch?
**উত্তর:**
```bash
# 1. নতুন ব্রাঞ্চে কমিট মুভ করুন
git checkout correct-branch
git cherry-pick <commit-hash>

# 2. পুরোনো ব্রাঞ্চ থেকে রিমুভ করুন
git checkout wrong-branch
git reset --hard HEAD~1
```

### ৯২. Accidentally committed large file?
**উত্তর:**
```bash
git filter-branch --tree-filter 'rm -f large-file.zip' HEAD
# অথবা
git filter-repo --path large-file.zip --invert-paths
```

### ৯৩. Commit message ভুল হয়েছে?
**উত্তর:**
```bash
git commit --amend -m "Correct message"
```

### ৯৪. Staged না করেই commit করেছি?
**উত্তর:**
```bash
git commit -m "Initial commit"
git add forgotten-file.txt
git commit --amend
```

### ৯৫. Git push --force-এর বিকল্প কি?
**উত্তর:** `git push --force-with-lease` (সেফার অপশন)

### ৯৬. Git-এ password কিভাবে সেভ করব না?
**উত্তর:**
```bash
# SSH keys ব্যবহার করুন
# অথবা credential helper
git config --global credential.helper cache
```

### ৯৭. Multiple remotes কিভাবে ম্যানেজ করব?
**উত্তর:**
```bash
git remote add upstream <original-repo>
git remote -v  # সব রিমোট দেখাবে
git fetch upstream
```

### ৯৮. Git-এ partial commit কিভাবে করব?
**উত্তর:**
```bash
git add -p  # ইন্টারেক্টিভ staging
```

### ৯৯. কিভাবে Git history clean করব?
**উত্তর:**
```bash
git rebase -i HEAD~10  # শেষ ১০ কমিট এডিট
```

### ১০০. Git-এর performance improve কিভাবে করব?
**উত্তর:**
```bash
git gc --aggressive  # গার্বেজ কালেকশন
git repack -a -d --depth=250 --window=250  # রিপ্যাক
```

