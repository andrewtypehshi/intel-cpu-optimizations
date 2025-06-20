# GitHub Repository Setup Instructions

## Creating the Repository on GitHub

1. **Go to GitHub**: Navigate to [github.com](https://github.com) and sign in to your account

2. **Create New Repository**: Click the "+" button in the upper right corner and select "New repository"

3. **Repository Settings**:
   - **Repository name**: `intel-cpu-optimizations`
   - **Description**: `Comprehensive Windows batch script for optimizing Intel CPU performance through power management and system configuration`
   - **Visibility**: Select "Public" (as requested)
   - **Initialize options**: 
     - ✅ Do NOT initialize with README (we already have one)
     - ✅ Do NOT add .gitignore (we already have one)
     - ✅ Do NOT add license (we already have one)

4. **Create Repository**: Click "Create repository"

## Connecting Your Local Repository

After creating the repository on GitHub, you'll see a page with instructions. Use these commands in your terminal:

```bash
# Navigate to your project directory
cd "C:\Users\andrew\Desktop\intel-cpu-optimizations"

# Add the GitHub repository as remote origin
git remote add origin https://github.com/YOUR_USERNAME/intel-cpu-optimizations.git

# Rename the default branch to main (GitHub's default)
git branch -M main

# Push your code to GitHub
git push -u origin main
```

**Replace `YOUR_USERNAME` with your actual GitHub username**

## Alternative: Using GitHub Desktop

If you prefer a GUI approach:

1. Download and install [GitHub Desktop](https://desktop.github.com/)
2. Open GitHub Desktop
3. Click "Add an Existing Repository from your Hard Drive"
4. Select the folder: `C:\Users\andrew\Desktop\intel-cpu-optimizations`
5. Click "Publish repository"
6. Ensure "Keep this code private" is UNCHECKED for a public repository
7. Click "Publish Repository"

## Repository Features to Enable

After pushing to GitHub, consider enabling these features:

1. **Issues**: For bug reports and feature requests
2. **Discussions**: For community questions and support
3. **Wiki**: For additional documentation
4. **Releases**: For version tracking (tag v1.0.0)
5. **Topics**: Add relevant tags like `intel`, `cpu-optimization`, `windows`, `performance`, `batch-script`

## Recommended GitHub Topics

Add these topics to your repository for better discoverability:
- `intel`
- `cpu-optimization`
- `windows`
- `performance`
- `batch-script`
- `power-management`
- `system-optimization`
- `gaming-performance`

## Creating Your First Release

1. Go to your repository on GitHub
2. Click "Releases" on the right side
3. Click "Create a new release"
4. Tag version: `v1.0.0`
5. Release title: `Intel CPU Optimization Script v1.0.0`
6. Description: Copy from CHANGELOG.md
7. Click "Publish release"

