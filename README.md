# Task Management Frontend - CI/CD Pipeline

This repository demonstrates a complete CI/CD pipeline implementation for a React-based Task Management Frontend application using GitHub Actions and Docker containerization.

## 🎯 Project Purpose

This project showcases modern DevOps practices including:
- **Automated CI/CD Pipeline** with GitHub Actions
- **Docker Containerization** for consistent deployments
- **Multi-platform Image Builds** (AMD64/ARM64)
- **Container Registry Integration** with GitHub Container Registry
- **Automated Testing** and code quality checks
- **Production-ready Deployment** strategies

## 📋 Application Overview

**Task Management Frontend** - A React-based web application that provides:
- Task creation and management interface
- Search and filter functionality
- Task execution capabilities
- Responsive design with Tailwind CSS
- API integration for backend communication

## 🔧 Technology Stack

- **Frontend Framework**: React 19 with TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS
- **Testing**: Vitest + React Testing Library
- **Containerization**: Docker with multi-stage builds
- **CI/CD**: GitHub Actions
- **Container Registry**: GitHub Container Registry (GHCR)
- **Development**: Docker Compose

## 🐳 Docker Configuration

The application includes comprehensive Docker support for both development and production environments:

### Development Environment
```bash
# Start development server with hot reload
docker-compose up --build frontend-dev
# Access: http://localhost:5173
```

### Production Environment
```bash
# Start production server with Nginx
docker-compose --profile production up --build frontend-prod
# Access: http://localhost:80
```

### Docker Features
- **Multi-stage builds** for optimized production images
- **Hot reload** support for development
- **Volume mounting** for live code changes
- **Multi-platform support** (AMD64/ARM64)
- **Nginx optimization** for production serving

## 🏗️ CI/CD Pipeline Architecture

### Pipeline Triggers
The automated CI/CD pipeline runs on:
- **Push to main/master branch**
- **Pull requests to main/master branch**

### Pipeline Jobs

#### 1. Frontend Build and Test Job
- **Environment**: Ubuntu latest with Node.js 20
- **Dependencies**: Automated installation with npm caching
- **Code Quality**: ESLint linting and TypeScript compilation
- **Testing**: Vitest test suite with coverage reporting
- **Build**: Production asset compilation
- **Artifacts**: Build files uploaded for deployment

#### 2. Docker Build and Push Job
- **Multi-platform Builds**: AMD64 and ARM64 architectures
- **Container Registry**: GitHub Container Registry (GHCR)
- **Image Tagging**: Branch name, commit SHA, and 'latest'
- **Build Optimization**: Docker layer caching for faster builds
- **Security**: Automated vulnerability scanning

### Pipeline Features
- **Parallel Job Execution** for faster builds
- **Dependency Caching** for improved performance
- **Automated Testing** with coverage reports
- **Multi-platform Docker Images** for broad compatibility
- **Container Registry Integration** for image distribution

## 🧪 Testing and Quality Assurance

### Testing Framework
- **Test Runner**: Vitest with React Testing Library
- **Coverage Provider**: V8 for accurate coverage reporting
- **Test Types**: Unit tests, component tests, and integration tests

### Quality Checks
- **ESLint**: Code linting and style enforcement
- **TypeScript**: Static type checking
- **Test Coverage**: Automated coverage reporting
- **Build Validation**: Production build verification

### Running Tests Locally
```bash
# Run tests with coverage
npm run test:ci

# Run tests in watch mode
npm test

# Run linting
npm run lint

# Build for production
npm run build
```

## � Environment Configuration

### API Configuration
Configure the backend API URL using environment variables:

```bash
# Copy example environment file
cp .env.example .env

# Edit with your backend URL
VITE_API_URL=http://localhost:8080/tasks
```

## 🚀 Quick Start

### Local Development
```bash
# Install dependencies
npm install

# Start development server
npm run dev
# Access: http://localhost:5173
```

### Docker Development
```bash
# Start with Docker Compose
docker-compose up --build frontend-dev
# Access: http://localhost:5173
```

## 📸 CI/CD Pipeline Screenshots Required

**IMPORTANT**: You must take the following screenshots to demonstrate your CI/CD pipeline implementation. Ensure your **name and current date/time** are visible in all screenshots.

### A. Local Development Setup

#### A1. Docker Development Startup
**Command:** `docker-compose up --build frontend-dev`

![Docker Development Startup](screenshots/01-docker-dev-startup.png)
*Screenshot showing Docker build process and successful container startup with name and timestamp visible*

#### A2. Application Running in Browser
**URL:** http://localhost:5173

![Application Running](screenshots/02-application-browser.png)
*Screenshot showing Task Management interface running in browser with name and timestamp visible*

#### A3. Docker Containers Status
**Command:** `docker ps`

![Docker Containers Status](screenshots/03-docker-containers.png)
*Screenshot showing running Docker containers with names, ports, and status*

### B. Code Quality and Testing

#### B4. Test Execution with Coverage
**Command:** `npm run test:ci`

![Test Coverage Results](screenshots/04-test-coverage.png)
*Screenshot showing test execution with coverage report - all tests passing with coverage percentages*

#### B5. Production Build Process
**Command:** `npm run build`

![Production Build](screenshots/05-production-build.png)
*Screenshot showing successful production build with generated files and build completion*

### C. GitHub Repository Setup

#### C6. Repository with CI/CD Files
**Location:** GitHub repository main page

![Repository Structure](screenshots/06-repository-structure.png)
*Screenshot showing GitHub repository with CI/CD files: .github/workflows/ci-cd.yml, Dockerfile, docker-compose.yml*

#### C7. Git Push to Trigger Pipeline
**Commands:**
```bash
git add .
git commit -m "CI/CD Pipeline Implementation"
git push origin main
```

![Git Push Success](screenshots/07-git-push.png)
*Screenshot showing successful git push to trigger CI/CD pipeline*

### D. GitHub Actions Pipeline Execution

#### D8. GitHub Actions Workflow Overview
**Location:** GitHub Actions tab

![GitHub Actions Overview](screenshots/08-github-actions-overview.png)
*Screenshot showing GitHub Actions workflow run with workflow name, trigger event, and job status*

#### D9. Frontend Build and Test Job Details
**Job:** frontend-build-test

![Frontend Build Test Job](screenshots/09-frontend-build-test.png)
*Screenshot showing detailed view of frontend-build-test job with all steps completed successfully*

#### D10. Docker Build and Push Job Details
**Job:** docker-build-push

![Docker Build Push Job](screenshots/10-docker-build-push.png)
*Screenshot showing detailed view of docker-build-push job with Docker build steps and image push success*

#### D11. Build Summary and Artifacts
**Location:** Workflow summary page

![Build Summary](screenshots/11-build-summary.png)
*Screenshot showing workflow summary with job completion times and artifacts generated*

### E. Container Registry

#### E12. GitHub Container Registry
**Location:** GitHub Packages tab

![GitHub Container Registry](screenshots/12-github-packages.png)
*Screenshot showing GitHub Packages tab with published Docker images, tags, and publication timestamps*

#### E13. Docker Image Details
**Location:** Specific image in GHCR

![Docker Image Details](screenshots/13-image-details.png)
*Screenshot showing specific image details with tags, platforms (AMD64/ARM64), and image size*

### F. Pipeline Success Verification

#### F14. Complete Pipeline Success
**Location:** GitHub Actions workflow completion

![Pipeline Success](screenshots/14-pipeline-success.png)
*Screenshot showing GitHub Actions with all green checkmarks - both jobs completed successfully*

#### F15. Repository with CI/CD Success
**Location:** Repository main page

![Repository Success](screenshots/15-repository-success.png)
*Screenshot showing repository main page with successful CI/CD workflow status*

## � Screenshot Organization

All screenshots should be saved in the `screenshots/` directory with the following naming convention:

```
screenshots/
├── 01-docker-dev-startup.png
├── 02-application-browser.png
├── 03-docker-containers.png
├── 04-test-coverage.png
├── 05-production-build.png
├── 06-repository-structure.png
├── 07-git-push.png
├── 08-github-actions-overview.png
├── 09-frontend-build-test.png
├── 10-docker-build-push.png
├── 11-build-summary.png
├── 12-github-packages.png
├── 13-image-details.png
├── 14-pipeline-success.png
└── 15-repository-success.png
```

## �📋 Screenshot Submission Checklist

Before submitting, verify each screenshot includes:
- [ ] Your full name clearly visible
- [ ] Current date and time visible
- [ ] Relevant terminal/browser content
- [ ] Clear, readable text
- [ ] Proper window/tab titles
- [ ] No sensitive information exposed
- [ ] Saved with correct filename in screenshots/ directory

## 🎯 Demonstration Steps

1. **Setup**: Ensure Docker and Node.js are installed
2. **Local Testing**: Run the application locally and take screenshots A1-A3
3. **Quality Checks**: Run tests and builds, take screenshots B4-B5
4. **Repository**: Push code to GitHub, take screenshots C6-C7
5. **Pipeline**: Wait for CI/CD completion, take screenshots D8-D11
6. **Registry**: Verify images published, take screenshots E12-E13
7. **Verification**: Confirm success, take screenshots F14-F15

## ✅ Success Criteria

Your CI/CD pipeline demonstration is complete when:
- ✅ All 15 screenshots are captured with name/timestamp
- ✅ Local application runs successfully on port 5173
- ✅ All tests pass with coverage reporting
- ✅ GitHub Actions pipeline completes successfully
- ✅ Docker images are published to GitHub Container Registry
- ✅ Both frontend-build-test and docker-build-push jobs succeed

**Good luck with your CI/CD pipeline demonstration!** 🚀
---

## 🎯 **NEXT STEPS: Take Your Screenshots**

### **Step 1: Start Your Application**
```bash
# Start Docker development environment
docker-compose up --build frontend-dev
```

### **Step 2: Access Application**
Open browser to: **http://localhost:5173**

### **Step 3: Take Required Screenshots**
Follow the screenshot checklist above (A1-F15)

### **Step 4: Push to GitHub**
```bash
git add .
git commit -m "CI/CD Pipeline Implementation"
git push origin main
```

### **Step 5: Monitor CI/CD Pipeline**
- Go to GitHub Actions tab
- Wait for pipeline completion
- Take screenshots of successful execution

### **Step 6: Verify Container Registry**
- Check GitHub Packages tab
- Verify Docker images are published
- Take final screenshots

**Remember**: Your **name and current date/time** must be visible in ALL screenshots!

---

## 📝 Instructions for Adding Screenshots

### Step 1: Take Screenshots
Follow the demonstration steps above and take all 15 required screenshots.

### Step 2: Save Screenshots
Save each screenshot in the `screenshots/` directory with the exact filenames shown above:
- `01-docker-dev-startup.png`
- `02-application-browser.png`
- `03-docker-containers.png`
- etc.

### Step 3: Verify Screenshots
- Ensure your name and current date/time are visible in each screenshot
- Check that all images are clear and readable
- Verify correct filenames and locations

### Step 4: Commit Screenshots
```bash
git add screenshots/
git commit -m "Add CI/CD pipeline demonstration screenshots"
git push origin main
```

The README.md file will automatically display your screenshots once they are added to the screenshots/ directory.

---

**🎉 Your CI/CD Pipeline is Ready for Demonstration! 🚀**
