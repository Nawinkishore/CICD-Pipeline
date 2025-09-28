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
1. **Terminal showing Docker development startup**
   ```bash
   docker-compose up --build frontend-dev
   ```
   - Screenshot: Terminal output showing successful build and startup
   - Must show: Your name, current date/time, successful container startup

2. **Application running locally**
   - Screenshot: Browser showing http://localhost:5173
   - Must show: Task Management interface, your name, current date/time

3. **Docker containers status**
   ```bash
   docker ps
   ```
   - Screenshot: Terminal showing running containers
   - Must show: Container names, ports, status

### B. Code Quality and Testing
4. **Test execution with coverage**
   ```bash
   npm run test:ci
   ```
   - Screenshot: Terminal showing test results and coverage report
   - Must show: All tests passing, coverage percentages

5. **Build process**
   ```bash
   npm run build
   ```
   - Screenshot: Terminal showing successful production build
   - Must show: Build completion, generated files

### C. GitHub Repository Setup
6. **Repository with CI/CD files**
   - Screenshot: GitHub repository showing workflow files
   - Must show: `.github/workflows/ci-cd.yml`, `Dockerfile`, `docker-compose.yml`

7. **Push to trigger pipeline**
   ```bash
   git add .
   git commit -m "CI/CD Pipeline Implementation"
   git push origin main
   ```
   - Screenshot: Terminal showing successful push

### D. GitHub Actions Pipeline Execution
8. **GitHub Actions workflow overview**
   - Screenshot: GitHub Actions tab showing workflow run
   - Must show: Workflow name, trigger event, job status

9. **Frontend Build and Test Job**
   - Screenshot: Detailed view of frontend-build-test job
   - Must show: All steps completed successfully, test results

10. **Docker Build and Push Job**
    - Screenshot: Detailed view of docker-build-push job
    - Must show: Docker build steps, image push success

11. **Build summary and artifacts**
    - Screenshot: Workflow summary page
    - Must show: Job completion times, artifacts generated

### E. Container Registry
12. **GitHub Container Registry**
    - Screenshot: GitHub Packages tab showing published images
    - Must show: Docker images with tags, publication timestamps

13. **Image details**
    - Screenshot: Specific image details in GHCR
    - Must show: Image tags, platforms (AMD64/ARM64), size

### F. Pipeline Success Verification
14. **Complete pipeline success**
    - Screenshot: GitHub Actions showing all green checkmarks
    - Must show: Both jobs completed successfully

15. **Repository with successful CI/CD badge**
    - Screenshot: Repository README or main page
    - Must show: Workflow status badge (if configured)

## 📋 Screenshot Submission Checklist

Before submitting, verify each screenshot includes:
- [ ] Your full name clearly visible
- [ ] Current date and time visible
- [ ] Relevant terminal/browser content
- [ ] Clear, readable text
- [ ] Proper window/tab titles
- [ ] No sensitive information exposed

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

**🎉 Your CI/CD Pipeline is Ready for Demonstration! 🚀**
