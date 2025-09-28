# Task Management Frontend - CI/CD Pipeline with Docker

This repository contains a React-based Task Management Frontend application with a complete CI/CD pipeline implemented using GitHub Actions and comprehensive Docker support.

## 🚀 Project Overview

This project demonstrates a modern CI/CD pipeline for a React frontend application that includes:
- Automated building and testing with GitHub Actions
- Docker containerization for development and production
- Multi-platform image builds (AMD64/ARM64)
- Container registry integration (GitHub Container Registry)
- Local development with Docker Compose
- Mock backend for testing
- Comprehensive error handling and reporting

## 📋 Application Features

The Task Management Frontend provides:
- **Task Creation**: Add new tasks with ID, name, owner, and command
- **Task Management**: View, search, and delete tasks
- **Task Execution**: Execute task commands and view output
- **Responsive UI**: Built with React and Tailwind CSS
- **API Integration**: Connects to backend REST API for task operations
- **Environment Configuration**: Flexible API endpoint configuration

## 🔧 Technology Stack

- **Frontend**: React 19, TypeScript, Vite
- **Styling**: Tailwind CSS
- **Testing**: Vitest, React Testing Library
- **Containerization**: Docker with multi-stage builds
- **Development**: Docker Compose for local development
- **CI/CD**: GitHub Actions
- **Container Registry**: GitHub Container Registry (GHCR)

## 🐳 Docker Setup and Usage

### Quick Start with Docker

#### Option 1: Development Mode (Recommended for Development)
```bash
# Run frontend in development mode on http://localhost:5173
docker-compose up --build frontend-dev
```

#### Option 2: Development with Mock Backend
```bash
# Run frontend + mock backend for testing
docker-compose --profile mock up --build frontend-dev mock-backend
```

#### Option 3: Production Mode
```bash
# Run frontend in production mode on http://localhost:80
docker-compose --profile production up --build frontend-prod
```

#### Option 4: Using Helper Scripts
```bash
# Make scripts executable (Linux/Mac)
chmod +x scripts/*.sh

# Development mode
./scripts/docker-dev.sh

# Development with mock backend
./scripts/docker-with-mock.sh

# Production mode
./scripts/docker-prod.sh
```

### Docker Configuration Details

#### Development Container
- **Port**: 5173 (Vite development server)
- **Hot Reload**: Enabled with volume mounting
- **Environment**: Development optimized
- **Access**: http://localhost:5173

#### Production Container
- **Port**: 80 (Nginx server)
- **Optimization**: Multi-stage build with Nginx
- **Environment**: Production optimized
- **Access**: http://localhost:80

#### Mock Backend Container
- **Port**: 8080 (JSON Server)
- **Purpose**: Testing without real backend
- **API**: RESTful endpoints for tasks
- **Access**: http://localhost:8080

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

## 🔧 Environment Configuration

### Backend API Configuration

The frontend connects to a backend API. Configure the API URL using environment variables:

#### Local Development (.env file)
```bash
# Copy the example file
cp .env.example .env

# Edit the .env file with your backend URL
VITE_API_URL=http://localhost:8080/tasks
```

#### Docker Environment Variables
```bash
# For Docker development
VITE_API_URL=http://localhost:8080/tasks

# For Docker with mock backend
VITE_API_URL=http://localhost:8080/tasks

# For Docker internal network
VITE_API_URL=http://mock-backend:8080/tasks
```

#### Production Environment
```bash
# For production deployment
VITE_API_URL=https://your-production-api.com/tasks
```

## 🐳 Docker Configuration Details

### Multi-Stage Dockerfile

The application uses a multi-stage Docker build with three targets:

```dockerfile
# Stage 1: Development (Node.js with Vite dev server)
FROM node:20-alpine AS development
# Runs on port 5173 with hot reload

# Stage 2: Builder (Node.js build process)
FROM node:20-alpine AS builder
# Compiles and builds the application

# Stage 3: Production (Nginx)
FROM nginx:alpine AS production
# Serves built assets with Nginx on port 80
```

### Image Tagging Strategy

Images are automatically tagged with:
- `latest` (for main branch)
- `{branch-name}-{commit-sha}` (for all builds)
- `{branch-name}` (for branch builds)
- `pr-{number}` (for pull requests)

### Docker Compose Services

#### `frontend-dev`
- **Purpose**: Development with hot reload
- **Port**: 5173
- **Volume**: Source code mounted for live editing
- **Target**: development stage

#### `frontend-prod`
- **Purpose**: Production-ready container
- **Port**: 80
- **Optimization**: Nginx with built assets
- **Target**: production stage

#### `mock-backend`
- **Purpose**: Testing without real backend
- **Port**: 8080
- **Technology**: JSON Server
- **Data**: Mock task data

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
- Docker and Docker Compose
- Git

### Method 1: Local Development (Without Docker)

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd CICD-Pipeline
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Configure environment**
   ```bash
   cp .env.example .env
   # Edit .env file with your backend API URL
   ```

4. **Run development server**
   ```bash
   npm run dev
   # Access at http://localhost:5173
   ```

5. **Run tests**
   ```bash
   npm run test
   ```

6. **Build for production**
   ```bash
   npm run build
   ```

### Method 2: Docker Development (Recommended)

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd CICD-Pipeline
   ```

2. **Start development environment**
   ```bash
   # Option A: Frontend only
   docker-compose up --build frontend-dev

   # Option B: Frontend + Mock Backend
   docker-compose --profile mock up --build frontend-dev mock-backend

   # Option C: Using helper script
   ./scripts/docker-dev.sh
   ```

3. **Access the application**
   - Frontend: http://localhost:5173
   - Mock Backend API: http://localhost:8080 (if using mock profile)

### Method 3: Production Docker Build

1. **Build and run production container**
   ```bash
   # Using Docker Compose
   docker-compose --profile production up --build frontend-prod

   # Using Docker directly
   docker build -t task-management-frontend .
   docker run -p 80:80 task-management-frontend

   # Using helper script
   ./scripts/docker-prod.sh
   ```

2. **Access the application**
   - Production Frontend: http://localhost:80

## 📸 Required Screenshots for Submission

> **IMPORTANT**: You must take the following screenshots to complete your CI/CD pipeline demonstration. Make sure your name and current date/time are visible in all screenshots.

### 📋 Screenshot Checklist

#### 1. Local Docker Development Screenshots

**A. Docker Development Server Running**
- [ ] Screenshot of terminal showing `docker-compose up --build frontend-dev` command
- [ ] Show the build process and successful startup
- [ ] Include your name in terminal prompt or window title
- [ ] Show current date/time in terminal or system clock

**B. Frontend Application in Browser**
- [ ] Screenshot of http://localhost:5173 showing the Task Manager interface
- [ ] Show the browser URL bar clearly displaying localhost:5173
- [ ] Include your name visible somewhere (browser bookmark, tab title, or open notepad)
- [ ] Show current date/time in system taskbar/menu bar

**C. Docker Containers Running**
- [ ] Screenshot of `docker ps` command showing running containers
- [ ] Show container names, ports, and status
- [ ] Include your name in terminal prompt
- [ ] Show current date/time

#### 2. CI/CD Pipeline Screenshots

**D. Successful GitHub Actions Workflow**
- [ ] Screenshot of GitHub Actions tab showing successful workflow run
- [ ] Show all jobs completed with green checkmarks
- [ ] Include your GitHub username visible in the interface
- [ ] Show workflow run timestamp

**E. Frontend Build and Test Job Details**
- [ ] Screenshot of the frontend-build-test job execution details
- [ ] Show test results, linting, and build steps
- [ ] Display job duration and success status
- [ ] Include your GitHub username and timestamp

**F. Docker Build and Push Job Details**
- [ ] Screenshot of the docker-build-push job execution details
- [ ] Show Docker image build process and registry push
- [ ] Display successful completion with image tags
- [ ] Include your GitHub username and timestamp

**G. GitHub Container Registry (GHCR)**
- [ ] Screenshot of GitHub Packages tab showing published Docker images
- [ ] Show image tags, sizes, and publication dates
- [ ] Include your GitHub username visible
- [ ] Show current date/time

#### 3. Additional Demonstration Screenshots

**H. Docker Production Mode**
- [ ] Screenshot of production container running on http://localhost:80
- [ ] Show Nginx serving the built application
- [ ] Include your name and current date/time visible

**I. Mock Backend Integration (Optional)**
- [ ] Screenshot showing frontend connected to mock backend
- [ ] Display API calls working at http://localhost:8080
- [ ] Show task creation/management functionality
- [ ] Include your name and current date/time

### 📝 Screenshot Instructions

#### Before Taking Screenshots:

1. **Set Up Your Identity**
   ```bash
   # Set your name in terminal prompt (Linux/Mac)
   export PS1="[YOUR_NAME] \w $ "

   # Or create a text file with your name
   echo "YOUR_NAME - $(date)" > ~/name_and_date.txt
   ```

2. **Prepare Browser**
   - Add bookmark with your name
   - Open notepad/text editor with your name and date
   - Ensure system clock is visible

3. **Start Docker Services**
   ```bash
   # Development mode
   docker-compose up --build frontend-dev

   # Production mode
   docker-compose --profile production up --build frontend-prod

   # With mock backend
   docker-compose --profile mock up --build frontend-dev mock-backend
   ```

#### Taking Screenshots:

1. **Full Screen Captures**: Include browser/terminal window borders
2. **Clear Visibility**: Ensure text is readable and not blurred
3. **Multiple Angles**: Show both overview and detailed views
4. **Timestamp Evidence**: System clock, terminal timestamps, or GitHub timestamps
5. **Name Visibility**: Your name should be clearly visible in each screenshot

#### After Taking Screenshots:

1. **Organize Files**: Name screenshots clearly (e.g., `01-docker-dev-running.png`)
2. **Verify Quality**: Check that all text is readable
3. **Backup**: Save screenshots in multiple locations
4. **Document**: Create a summary document listing what each screenshot shows

### 🎯 Quick Start for Screenshots

1. **Start Docker Development**
   ```bash
   docker-compose up --build frontend-dev
   ```

2. **Open Browser to http://localhost:5173**

3. **Take Screenshot A & B**

4. **Check Running Containers**
   ```bash
   docker ps
   ```

5. **Take Screenshot C**

6. **Push Code to GitHub to Trigger CI/CD**

7. **Take Screenshots D, E, F, G from GitHub Actions**

8. **Test Production Mode**
   ```bash
   docker-compose --profile production up --build frontend-prod
   ```

9. **Take Screenshot H**

**Remember**: Your name and current date/time must be visible in ALL screenshots!

## 🔧 Configuration Files

### Key Configuration Files:

- **`.github/workflows/ci-cd.yml`**: Main CI/CD pipeline configuration
- **`Dockerfile`**: Multi-stage container build configuration (dev/prod)
- **`docker-compose.yml`**: Docker Compose services configuration
- **`nginx.conf`**: Nginx configuration for serving the application
- **`package.json`**: Node.js dependencies and scripts
- **`vitest.config.ts`**: Test configuration
- **`vite.config.ts`**: Build tool configuration with Docker support
- **`.env.example`**: Environment variables template
- **`scripts/`**: Helper scripts for Docker operations

### Docker Files Structure:

```
├── Dockerfile                 # Multi-stage build (dev/prod)
├── Dockerfile.simple         # Simple development build
├── docker-compose.yml        # Services orchestration
├── nginx.conf               # Production web server config
├── .dockerignore           # Docker build exclusions
└── scripts/
    ├── docker-dev.sh       # Development mode script
    ├── docker-prod.sh      # Production mode script
    └── docker-with-mock.sh # Development with mock backend
```

## 🐛 Troubleshooting

### Common Issues:

#### Docker Issues:

1. **Port Already in Use**
   ```bash
   # Check what's using the port
   lsof -i :5173
   netstat -tulpn | grep 5173

   # Kill the process or use different port
   docker-compose down
   ```

2. **Docker Build Failures**
   ```bash
   # Clean Docker cache
   docker system prune -a

   # Rebuild without cache
   docker-compose build --no-cache frontend-dev
   ```

3. **Volume Mount Issues (Windows)**
   ```bash
   # Ensure Docker Desktop has access to your drive
   # Check Docker Desktop Settings > Resources > File Sharing
   ```

4. **Hot Reload Not Working**
   ```bash
   # Ensure polling is enabled in vite.config.ts
   # Check that volumes are properly mounted in docker-compose.yml
   ```

#### Application Issues:

5. **API Connection Failures**
   ```bash
   # Check environment variables
   cat .env

   # Verify backend is running
   curl http://localhost:8080/tasks
   ```

6. **Build Failures**
   - Check Node.js version compatibility (20+)
   - Verify all dependencies are properly installed
   - Review test failures in the logs
   - Check TypeScript errors

7. **Test Failures**
   ```bash
   # Run tests locally first
   npm test

   # Check test configuration
   cat vitest.config.ts
   ```

#### CI/CD Issues:

8. **GitHub Actions Failures**
   - Check workflow file syntax
   - Verify secrets are properly configured
   - Review job logs for specific errors

9. **Registry Push Failures**
   - Confirm GITHUB_TOKEN permissions
   - Check repository package settings
   - Verify registry authentication

#### Quick Fixes:

```bash
# Reset everything
docker-compose down -v
docker system prune -a
docker-compose up --build frontend-dev

# Check logs
docker-compose logs frontend-dev

# Access container shell
docker-compose exec frontend-dev sh
```

## 📈 Performance Optimizations

The pipeline includes several optimizations:
- **Dependency Caching**: npm packages cached between runs
- **Docker Layer Caching**: Reuses unchanged layers
- **Multi-platform Builds**: Efficient cross-platform compilation
- **Parallel Job Execution**: Independent jobs run concurrently

## 🚀 Deployment Options

### Local Development
- **Frontend**: http://localhost:5173 (Vite dev server)
- **Mock Backend**: http://localhost:8080 (JSON Server)

### Production
- **Frontend**: http://localhost:80 (Nginx)
- **CI/CD**: Automatic deployment via GitHub Actions
- **Registry**: GitHub Container Registry (ghcr.io)

### Cloud Deployment
The Docker images can be deployed to:
- **Kubernetes**: Use the GHCR images
- **Docker Swarm**: Use docker-compose for orchestration
- **Cloud Platforms**: AWS ECS, Google Cloud Run, Azure Container Instances
- **Heroku**: Using container registry

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with Docker:
   ```bash
   docker-compose up --build frontend-dev
   npm test
   ```
5. Ensure CI/CD pipeline passes
6. Submit a pull request

The CI/CD pipeline will automatically run on your pull request to validate changes.

## 📚 Additional Resources

### Docker Learning
- [Docker Official Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Multi-stage Builds](https://docs.docker.com/develop/dev-best-practices/)

### CI/CD Learning
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Container Registry Guide](https://docs.github.com/en/packages)

### React/Vite Learning
- [Vite Documentation](https://vitejs.dev/)
- [React Documentation](https://react.dev/)
- [Vitest Testing](https://vitest.dev/)

## 📄 License

This project is for educational and demonstration purposes.

---

## 🎯 Summary

This project demonstrates:
- ✅ **Complete CI/CD Pipeline** with GitHub Actions
- ✅ **Docker Development Environment** with hot reload
- ✅ **Docker Production Build** with Nginx optimization
- ✅ **Multi-platform Support** (AMD64/ARM64)
- ✅ **Container Registry Integration** (GHCR)
- ✅ **Mock Backend** for testing
- ✅ **Comprehensive Testing** with Vitest
- ✅ **Code Quality** with ESLint and TypeScript
- ✅ **Environment Configuration** for different deployments

**Built with ❤️ for CI/CD and Docker learning and demonstration**

---

### 🎬 Next Steps for You:

1. **Start Docker Development**:
   ```bash
   docker-compose up --build frontend-dev
   ```

2. **Access Application**: http://localhost:5173

3. **Take Required Screenshots** (see checklist above)

4. **Push to GitHub** to trigger CI/CD pipeline

5. **Take CI/CD Screenshots** from GitHub Actions

6. **Submit with Screenshots** showing your name and timestamps

**Good luck with your CI/CD pipeline demonstration! 🚀**
