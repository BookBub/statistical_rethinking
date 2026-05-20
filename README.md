# Statistical Rethinking Practice

A collaborative learning environment for working through [Statistical Rethinking](https://xcelab.net/rm/) exercises in Python using NumPyro.

## What's This Repository?

This is a shared workspace where group members can:
- Work through Statistical Rethinking problems from the book
- Use a consistent, reproducible Python environment via Nix
- Share their solutions with others (optional)
- Reference different approaches to the same problems


## Repository Structure

```
statistical-rethinking-practice/
├── shell.nix                      # Nix environment configuration
├── starter_template.ipynb         # Template to copy for each chapter
├── reference_solutions/           # Canonical solutions from external repos
│   ├── chapter_02_solutions.ipynb
│   ├── chapter_02_numpyro_guide.ipynb
│   ├── chapter_03_solutions.ipynb
│   └── chapter_03_numpyro_guide.ipynb
├── chapter_02/                    # Each chapter gets its own folder
│   ├── alice.ipynb               # Individual member solutions
│   └── bob.ipynb
├── chapter_03/
│   └── carol.ipynb
└── ...
```

When you work on a chapter, you'll create your own notebook from the starter template (such as, `chapter_02/yourname.ipynb`) in a chapter-specific folder. You can optionally share your solutions to let everyone see different approaches to the same problems.

---

## First Time Setup

You only need to do this once.

### Step 1: Open Terminal

On macOS:
1. Search for "Terminal" in Spotlight
2. A window will open with a command prompt (something like `yourname@computername ~ %`)

### Step 2: Clone the Repository And Go Into It

If you haven't already cloned this repository:

```bash
git clone <repository-url>
cd statistical-rethinking-practice
```

To confirm you're in the right place, type:

```bash
ls
```

You should see files like `shell.nix`, `README.md`, and `starter_template.ipynb` listed.

### Step 3: Enter the Nix Shell

Type this command and press Enter:

```bash
nix-shell
```

**What happens:** The first time you run this, it will:
- Download Python 3.11
- Create a virtual environment (a `.venv/` folder)
- Install Python packages: `arviz`, `matplotlib`, `jax`, `numpyro`, `jupyter`

**This will take several minutes.** You'll see a lot of text scrolling by. That's normal! Wait until you see:

```
==========================================
Statistical Rethinking environment ready!
Run 'jupyter notebook' to start.
==========================================
```

When you see your command prompt again (it might now have `(nix-shell)` or similar in front of it), the setup is complete.

**Note:** Every time you open a new Terminal window to work on this project, you'll need to:
1. Navigate to the project folder (`cd /path/to/statistical-rethinking-practice`)
2. Run `nix-shell` (it will be fast after the first time)

### Step 5: Test Jupyter

Still in Terminal, type:

```bash
jupyter notebook
```

**What happens:** Your web browser will open automatically, showing the Jupyter interface with a list of files in the project.

To test everything works:
1. Click on `starter_template.ipynb` to open it
2. Click on the first code cell (the one with all the `import` statements)
3. Press `Shift + Enter` to run it
4. You should see "Environment ready!" below the cell

**To stop Jupyter:** Go back to Terminal and press `Ctrl + C`, then type `y` and press Enter.

## Working on a New Chapter

This is what you'll do each time when starting a new chapter.

### Step 1: Get Up to Date Information and Start Nix

```bash
cd /path/to/statistical-rethinking-practice
git pull
nix-shell
```

If `git pull` throws an error, you probably need to tell git about your local work first. You can do this with

```bash
git add .
git commit -m "finished chapter 2 problems"
```

### Step 2: Create a Chapter Folder

If this is the first time anyone is working on this chapter, create a folder for it:

```bash
mkdir chapter_02
```

*Replace `02` with whatever chapter number you're working on.*

**What this does:** `mkdir` stands for "make directory" (directory = folder). This creates a new folder called `chapter_02`.

### Step 3: Copy the Starter Template

Copy the template and rename it with your name:

```bash
cp starter_template.ipynb chapter_02/yourname.ipynb
```

**What this does:** `cp` stands for "copy". This copies `starter_template.ipynb` into the `chapter_02` folder and names it `yourname.ipynb`.

**Example:**
```bash
cp starter_template.ipynb chapter_02/alice.ipynb
```

### Step 4: Start Jupyter

```bash
jupyter notebook
```

Your browser will open with the Jupyter file browser.

### Step 5: Open Your Notebook

1. In the Jupyter file browser, double-click the `chapter_02` folder
2. Click on your notebook (e.g., `alice.ipynb`) to open it
3. Run the first cell (the setup cell with imports) by clicking on it and pressing `Shift + Enter`
4. You should see "Environment ready!"

Now you're ready to add your own cells and work through problems!

---

## Working in Jupyter

### Running Cells

- **Run current cell and move to next:** `Shift + Enter`
- **Run current cell and stay on it:** `Ctrl + Enter`

### Adding Cells

There are two ways to add a new cell:

**Option 1: Using the toolbar**
- Click the `+` button in the toolbar at the top

**Option 2: Using keyboard shortcuts (in command mode)**
- Press `B` to insert a cell below
- Press `A` to insert a cell above

**Command mode vs Edit mode:**
- When you click inside a cell and can type, you're in "edit mode"
- Press `Esc` to enter "command mode" (cell has blue border)
- Press `Enter` to go back to edit mode

### Cell Types

**Code cells** (for Python code):
- This is the default
- When you run a code cell, Python executes the code and shows any output below
- Press `Y` in command mode to convert a cell to code

**Markdown cells** (for notes and explanations):
- Used for writing text, explanations, or formatting
- Press `M` in command mode to convert a cell to markdown
- After writing, run the cell (`Shift + Enter`) to render the formatted text

### Useful Jupyter Tips

- **Save your work:** `Cmd + S` (Jupyter auto-saves periodically too)
- **Restart if things get stuck:** In the menu, choose Kernel → Restart & Clear Output
- **See all keyboard shortcuts:** Press `H` in command mode

## Referencing Solutions

### Reference Solutions

Check the `reference_solutions/` folder for solutions from external repositories.

Later chapters don't have reference solutions publicly available in python, so we'll need to use each other if we want to check our work.

### Other Members' Solutions

To see how someone else approached a problem:
1. In Jupyter file browser, navigate to the chapter folder (e.g., `chapter_02/`)
2. Click on their notebook (e.g., `bob.ipynb`)
3. Look through their approach

This is great for learning different ways to solve the same problem!

To get an up to date version of other people's solutions, run

```bash
git pull
```

## Sharing Your Solutions (Optional)

Want to share your work with the group? Here's how:

### Step 1: Make Sure Jupyter is Saved

Save your notebook in Jupyter (`Cmd + S`), then you can close Jupyter (in Terminal: `Ctrl + C`, then `y`).

### Step 2: Check What Changed

In Terminal, type:

```bash
git status
```

This shows you which files have changed. You should see your notebook listed under "Untracked files" or "Changes not staged for commit" in red.

### Step 3: Stage Your Changes

```bash
git add chapter_02/yourname.ipynb
```
This tells git you want to include this file in your next save/commit.

You can also run

```bash
git add .
```

to tell git to add every local change.

### Step 4: Commit Your Changes

```bash
git commit -m "Add my solutions for chapter 2"
```

This creates a save point (called a "commit") with a message describing what you did.

### Step 5: Push to GitHub

```bash
git push
```

This uploads your commit to the shared repository so others can see it.

### Note: Sharing is Completely Optional!

You can keep your work local if you prefer. Only push when you're comfortable sharing.


## Common Workflows

### Starting a Work Session

```bash
# 1. Open Terminal
# 2. Navigate to project
cd /path/to/statistical-rethinking-practice

# 3. Get any updates from the repo
git pull

# 4. Start nix shell
nix-shell

# 5. Start Jupyter
jupyter notebook

# 6. Open your notebook and start working!
```

### Before You Finish

```bash
# 1. Save your work in Jupyter (Cmd + S)
# 2. Stop Jupyter (Ctrl + C in Terminal, then y)
# 3. Exit nix-shell (optional)
exit

# 4. If you want to share your work:
git add chapter_XX/yourname.ipynb
git commit -m "Description of what you did"
git push
```

## Troubleshooting

### "command not found: nix-shell"

Nix might not be installed. Check with the group about Nix installation on your machine.

### "I got a Python error when running code"

This is part of learning! Common issues:
- **NameError:** You might need to run earlier cells first (especially the imports cell)
- **SyntaxError:** Check for typos in your code
- Try restarting the kernel

### "Git says there's a merge conflict"

This happens if two people edited the same file. Since everyone works in their own notebook (`yourname.ipynb`), this should be rare. If it happens, ask for help!

### "The .venv folder appeared - should I commit it?"

No! The `.gitignore` file already excludes it. This folder is created locally on each person's machine and shouldn't be shared.

## Environment Details

### What's Installed

- **Python 3.11**
- **Jupyter Notebook** - Interactive coding environment
- **arviz** - Bayesian analysis and visualization
- **matplotlib** - Plotting and graphics
- **JAX** - Numerical computing (like NumPy but faster)
- **NumPyro** - Probabilistic programming (for Bayesian models)

### How the Environment Works

1. **Nix** provides Python 3.11 at the system level
2. **Python's venv** creates an isolated environment (the `.venv/` folder)
3. **pip** installs Python packages into that environment
4. **The shell hook** (in `shell.nix`) automatically activates everything when you run `nix-shell`

This means everyone in the group has exactly the same Python version and packages - your code will work the same on everyone's machine!

### Adding More Packages (Advanced)

If you need an additional Python package:

```bash
# While in nix-shell:
pip install package-name
```

It will install to your local `.venv/` folder. To make it permanent for everyone, the `shell.nix` file would need to be updated.

