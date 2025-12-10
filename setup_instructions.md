## Instructions on how to set up reproducible repository

### Initialising repo
1. GitHub & Initial Setup
    Clone your new, empty repository
    - git clone https://github.com/your-username/your-project-name.git
    - select template
    - cd your-project-name

2. Update pyproject.toml
    - Update description and add modules

3. Update .gitignore to ignore DVC tracked items (if not done so already)
    # DVC
    .dvc/cache/
    .dvc/tmp/

    # Data & Models (Track with DVC, not Git)
    data/

### Setting up DVC
4. Initialise DVC
    # Initialize DVC
    dvc init

    # Set up your DVC remote storage (e.g., S3, GCS, Azure Blob)
    dvc remote add -d sharepoint_remote /path/to/your/local/sharepoint/folder
    
    # Add some data
    dvc add data/raw/sample.csv

    # Commit these changes to Git
    git add .
    git commit -m "feat: Initial project setup with DVC and UV"

5. Update dvc.yaml to include entire pipeline - this is done at the packaging stage after experimentation is complete

6. Run DVC pipeline and commit to git
    # Run all stages defined in dvc.yaml
    dvc repro

    # Push your DVC-tracked data and models to your remote storage
    dvc push

    # Commit your new pipeline definitions and metrics to Git
    git add .
    git commit -m "build: Create full data and training pipeline"
    git push

### Installing modules
7. Update pyproject.toml file with required module
8. Rebuild container - F1 - Dev Containers: Rebuild Container
9. Git commit changes
    git add pyproject.toml
    git commit -m "feat: Add seaborn dependency"
    git push

### Adding VS Code extensions
10. Add them to devcontainer.json