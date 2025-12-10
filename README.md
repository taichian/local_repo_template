# Repository Template

## Purpose

This repository serves as a template for containerized development of projects. It provides a standardized setup that enables consistent, reproducible development environments across different machines and team members.

## Tech Stack

This project uses the following technologies and tools:

- **Language:** Python
- **Containerization:** Docker
- **Data versioning:** DVC
- **Packaging / deps:** `pyproject.toml`
- **Source control:** Git
- **Editor / Devtools:** VS Code (recommended), devcontainer-friendly

## Setup Instructions
### Using this repository as a template and initializing Git

This repository is intended to be used as a template for new projects. There are two common workflows:

- **Create a new repo from this template on GitHub:** use the "Use this template" button on GitHub to create a new repository under your account, then clone the new repo:

```bash
git clone git@github.com:YOUR_USERNAME/NEW_REPO.git
cd NEW_REPO
```

- **Clone locally and re-point remote:** clone the template, then change the remote to your new repository and push:

```bash
git clone git@github.com:taichian/repo_template.git my-project
cd my-project
git remote remove origin
git remote add origin git@github.com:YOUR_USERNAME/my-project.git
git branch -M main
git push -u origin main
```

After pushing, update `README.md`, `pyproject.toml`, and any project metadata to reflect your project name and authorship.

### Adding Python packages via `pyproject.toml`

This template uses `pyproject.toml` to manage packaging and dependencies. 
- **Using a PEP 621 / `build` backend:** add packages to the `dependencies` list under the `[project]` table, for example:

```toml
[project]
dependencies = [
  "requests>=2.31.0",
  "pandas>=2.0"
]
```

After editing `pyproject.toml` manually, rebuild the container in VS Code using "Dev Containers: Rebuild and Reopen in Container".

### Updating `dvc.yaml` so notebooks run when data changes

DVC tracks pipeline stages in `dvc.yaml`. To ensure a notebook (or any script) runs whenever specific data files change, declare a stage with the data files as `deps` and the generated artifacts as `outs`. For example, to run a preprocessing notebook via `papermill`:

```yaml
stages:
  preprocess:
    cmd: papermill notebooks/preprocess.ipynb notebooks/preprocess-output.ipynb
    deps:
      - data/raw_data/dataset.csv
      - notebooks/preprocess.ipynb
    outs:
      - data/processed/processed.csv
```

With this stage defined, run `dvc repro` to reproduce the pipeline; DVC will re-run the `preprocess` stage when any of the listed `deps` change. You can run a single stage with `dvc repro -s preprocess`.

