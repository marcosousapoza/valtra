#!/bin/bash

# Set project name
PROJECT_NAME="valtra"

# Create project directory structure
echo "🚀 Setting up $PROJECT_NAME project..."

mkdir -p $PROJECT_NAME
mkdir -p tests
touch $PROJECT_NAME/__init__.py
touch $PROJECT_NAME/dataloader.py
touch tests/test_dataloader.py
touch setup.py
touch pyproject.toml
touch README.md
touch LICENSE
touch .gitignore

# Add content to .gitignore
echo "__pycache__/
*.pyc
*.pyo
*.pyd
dist/
build/
*.egg-info/" > .gitignore

# Add content to setup.py
cat <<EOL > setup.py
from setuptools import setup, find_packages

setup(
    name="$PROJECT_NAME",
    version="0.1.0",
    author="Your Name",
    author_email="your.email@example.com",
    description="A PyTorch DataLoader wrapper for dynamic train-test switching.",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/$PROJECT_NAME",  # Update this
    packages=find_packages(),
    install_requires=["torch>=1.10.0"],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.7",
)
EOL

# Add content to pyproject.toml
echo "[build-system]
requires = [\"setuptools\", \"wheel\"]
build-backend = \"setuptools.build_meta\"" > pyproject.toml

# Add content to LICENSE (MIT License)
cat <<EOL > LICENSE
MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
EOL

# Add content to README.md
cat <<EOL > README.md
# Valtra (Validation - Train)

Valtra is a mini-project I created because I got sick of keeping track of train and validation/test datasets separately.  
It dynamically switches between training and validation/test data using a simple wrapper around PyTorch’s \`DataLoader\`.

## 📌 Why "Valtra"?
The name comes from **Val**idation and **Tra**in. Plus, it has a nice ring to it. 😉

## 🚀 Installation
\`\`\`bash
pip install valtra
\`\`\`

## 🔧 Usage
\`\`\`python
import torch
from valtra.dataloader import DynamicDataLoader

# Create dummy data
data = torch.randn(1000, 10)
labels = torch.randint(0, 5, (1000,))

# Create DynamicDataLoader
dataloader = DynamicDataLoader.from_tensors(data, labels, split_ratio=0.8, batch_size=32)

# Training loop (default behavior is training mode)
for batch in dataloader():
    print("Train batch:", batch[0].shape)

# Evaluation loop
for batch in dataloader(test=True):
    print("Test batch:", batch[0].shape)
\`\`\`

## 📜 License
MIT License
EOL

# Initialize Git repository
echo "🔧 Initializing Git repository..."
git init
git add .
git commit -m "Initial commit: Setup Valtra project structure"

echo "✅ Project setup complete! You can now build and publish \`valtra\`."
