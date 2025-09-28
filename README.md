# Task Management Frontend - CI/CD Pipeline

This repository contains a React-based Task Management Frontend application with a complete CI/CD pipeline implemented using GitHub Actions.

## 🚀 Project Overview

This project demonstrates a modern CI/CD pipeline for a React frontend application that includes:
- Automated building and testing
- Docker containerization
- Multi-platform image builds
- Container registry integration
- Comprehensive error handling and reporting

## 📋 Application Features

The Task Management Frontend provides:
- **Task Creation**: Add new tasks with ID, name, owner, and command
- **Task Management**: View, search, and delete tasks
- **Task Execution**: Execute task commands and view output
- **Responsive UI**: Built with React and Tailwind CSS
- **API Integration**: Connects to backend REST API for task operations

## 🔧 Technology Stack

- **Frontend**: React 19, TypeScript, Vite
- **Styling**: Tailwind CSS
- **Testing**: Vitest, React Testing Library
- **Containerization**: Docker with multi-stage builds
- **CI/CD**: GitHub Actions
- **Container Registry**: GitHub Container Registry (GHCR)

## 🏗️ CI/CD Pipeline Architecture

### Pipeline Overview

The CI/CD pipeline consists of two main jobs that run automatically on:
- Push to `main` or `master` branch
- Pull requests to `main` or `master` branch

### Job 1: Frontend Build and Test (`frontend-build-test`)

This job handles the application build and testing process:

1. **Environment Setup**
   - Runs on Ubuntu latest
   - Sets up Node.js 20 with npm caching

2. **Code Quality Checks**
   - Installs dependencies with `npm ci`
   - Runs ESLint for code linting
   - Executes test suite with coverage reporting

3. **Build Process**
   - Compiles TypeScript and builds production assets
   - Uploads build artifacts for later use

### Job 2: Docker Build and Push (`docker-build-push`)

This job creates and publishes Docker images:

1. **Docker Setup**
   - Sets up Docker Buildx for multi-platform builds
   - Authenticates with GitHub Container Registry

2. **Image Building**
   - Creates multi-stage Docker image
   - Supports both AMD64 and ARM64 architectures
   - Implements build caching for faster builds

3. **Image Publishing**
   - Tags images with branch name, commit SHA, and 'latest'
   - Pushes to GitHub Container Registry
   - Generates build summary report

## 🐳 Docker Configuration

### Multi-Stage Dockerfile

The application uses a multi-stage Docker build:

```dockerfile
# Stage 1: Build (Node.js)
FROM node:20-alpine AS builder
# Install dependencies and build application

# Stage 2: Production (Nginx)
FROM nginx:alpine AS production
# Serve built assets with Nginx
```

### Image Tagging Strategy

Images are automatically tagged with:
- `latest` (for main branch)
- `{branch-name}-{commit-sha}` (for all builds)
- `{branch-name}` (for branch builds)
- `pr-{number}` (for pull requests)

## 📦 Build Artifacts and Caching

### Dependency Caching
- **npm cache**: Automatically cached by GitHub Actions
- **Docker layer cache**: Uses GitHub Actions cache for faster builds

### Build Artifacts
- **Frontend build**: Stored for 7 days
- **Docker images**: Published to GHCR with retention policies

## 🔐 Security and Secrets Management

### Required Secrets
The pipeline uses the following automatically available secrets:
- `GITHUB_TOKEN`: For authentication with GitHub Container Registry

### Permissions
The workflow requires:
- `contents: read` - To checkout code
- `packages: write` - To push Docker images to GHCR

## 📊 Pipeline Monitoring and Reporting

### Build Status
- Real-time build status in GitHub Actions tab
- Build summaries with key information
- Artifact links and download options

### Error Handling
- Comprehensive error reporting
- Failed job notifications
- Detailed logs for troubleshooting

## 🚀 Getting Started

### Prerequisites
- Node.js 20 or higher
- npm or yarn
- Docker (for local container builds)
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd CICD-Pipeline
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Run development server**
   ```bash
   npm run dev
   ```

4. **Run tests**
   ```bash
   npm run test
   ```

5. **Build for production**
   ```bash
   npm run build
   ```

### Local Docker Build

1. **Build Docker image**
   ```bash
   docker build -t task-management-frontend .
   ```

2. **Run container**
   ```bash
   docker run -p 80:80 task-management-frontend
   ```

## 📸 Pipeline Screenshots

> **Note**: Please add screenshots showing successful pipeline runs with your name and current date/time visible.

### Required Screenshots:

1. **Successful Pipeline Run Overview**
   - [ ] Screenshot of GitHub Actions workflow run showing all jobs completed successfully
   - [ ] Include your name and current date/time in the screenshot

2. **Frontend Build and Test Job Details**
   - [ ] Screenshot showing the frontend-build-test job execution
   - [ ] Display test results and build artifacts
   - [ ] Include your name and current date/time in the screenshot

3. **Docker Build and Push Job Details**
   - [ ] Screenshot showing the docker-build-push job execution
   - [ ] Display Docker image creation and push to registry
   - [ ] Include your name and current date/time in the screenshot

4. **GitHub Container Registry**
   - [ ] Screenshot of the published Docker images in GHCR
   - [ ] Show image tags and metadata
   - [ ] Include your name and current date/time in the screenshot

5. **Build Summary Report**
   - [ ] Screenshot of the generated build summary
   - [ ] Show build details and artifact information
   - [ ] Include your name and current date/time in the screenshot

### Instructions for Taking Screenshots:

1. **Setup Display Name**: Ensure your GitHub profile name is visible in the screenshots
2. **Show Timestamp**: Include current date/time in the screenshot (visible in GitHub Actions logs)
3. **Full Workflow View**: Capture the complete workflow run showing all jobs
4. **Detailed Job Views**: Show individual job execution details and logs
5. **Registry Evidence**: Demonstrate successful image publication to container registry

## 🔧 Configuration Files

### Key Configuration Files:

- **`.github/workflows/ci-cd.yml`**: Main CI/CD pipeline configuration
- **`Dockerfile`**: Multi-stage container build configuration
- **`nginx.conf`**: Nginx configuration for serving the application
- **`package.json`**: Node.js dependencies and scripts
- **`vitest.config.ts`**: Test configuration
- **`vite.config.ts`**: Build tool configuration

## 🐛 Troubleshooting

### Common Issues:

1. **Build Failures**
   - Check Node.js version compatibility
   - Verify all dependencies are properly installed
   - Review test failures in the logs

2. **Docker Build Issues**
   - Ensure Dockerfile syntax is correct
   - Check for missing files in build context
   - Verify base image availability

3. **Registry Push Failures**
   - Confirm GITHUB_TOKEN permissions
   - Check repository package settings
   - Verify registry authentication

## 📈 Performance Optimizations

The pipeline includes several optimizations:
- **Dependency Caching**: npm packages cached between runs
- **Docker Layer Caching**: Reuses unchanged layers
- **Multi-platform Builds**: Efficient cross-platform compilation
- **Parallel Job Execution**: Independent jobs run concurrently

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Ensure tests pass
5. Submit a pull request

The CI/CD pipeline will automatically run on your pull request to validate changes.

## 📄 License

This project is for educational and demonstration purposes.

---

**Built with ❤️ for CI/CD learning and demonstration**
