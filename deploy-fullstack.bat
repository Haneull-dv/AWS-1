@echo off
echo ========================================
echo 🚀 Full Stack Deployment Script
echo ========================================
echo.

echo ========================================
echo 1️⃣ Building Docker Images
echo ========================================
echo.

echo 📦 Building gateway_service...
cd gateway_service
docker build -t haneull/gateway_service:latest .
if %errorlevel% neq 0 (
    echo ❌ Failed to build gateway_service
    pause
    exit /b 1
)
cd ..
echo ✅ gateway_service build completed
echo.

echo 📦 Building dsdgen_service...
cd dsdgen_service
docker build -t haneull/dsdgen_service:latest .
if %errorlevel% neq 0 (
    echo ❌ Failed to build dsdgen_service
    pause
    exit /b 1
)
cd ..
echo ✅ dsdgen_service build completed
echo.

echo 📦 Building dsdcheck_service...
cd dsdcheck_service
docker build -t haneull/dsdcheck_service:latest .
if %errorlevel% neq 0 (
    echo ❌ Failed to build dsdcheck_service
    pause
    exit /b 1
)
cd ..
echo ✅ dsdcheck_service build completed
echo.

echo 📦 Building frontend...
cd frontend
docker build -t haneull/frontend:latest .
if %errorlevel% neq 0 (
    echo ❌ Failed to build frontend
    pause
    exit /b 1
)
cd ..
echo ✅ frontend build completed
echo.

echo ========================================
echo 2️⃣ Pushing Images to Docker Hub
echo ========================================
echo.

echo 🚀 Pushing gateway_service to Docker Hub...
docker push haneull/gateway_service:latest
if %errorlevel% neq 0 (
    echo ❌ Failed to push gateway_service
    pause
    exit /b 1
)
echo ✅ gateway_service pushed successfully
echo.

echo 🚀 Pushing dsdgen_service to Docker Hub...
docker push haneull/dsdgen_service:latest
if %errorlevel% neq 0 (
    echo ❌ Failed to push dsdgen_service
    pause
    exit /b 1
)
echo ✅ dsdgen_service pushed successfully
echo.

echo 🚀 Pushing dsdcheck_service to Docker Hub...
docker push haneull/dsdcheck_service:latest
if %errorlevel% neq 0 (
    echo ❌ Failed to push dsdcheck_service
    pause
    exit /b 1
)
echo ✅ dsdcheck_service pushed successfully
echo.

echo 🚀 Pushing frontend to Docker Hub...
docker push haneull/frontend:latest
if %errorlevel% neq 0 (
    echo ❌ Failed to push frontend
    pause
    exit /b 1
)
echo ✅ frontend pushed successfully
echo.

echo ========================================
echo 3️⃣ Deploying to Kubernetes
echo ========================================
echo.

echo 🎯 Applying Kubernetes configurations...
kubectl apply -f k8s/
if %errorlevel% neq 0 (
    echo ❌ Failed to deploy to Kubernetes
    pause
    exit /b 1
)
echo ✅ Kubernetes deployment completed
echo.

echo ========================================
echo 🎉 Full Stack Deployment Completed!
echo ========================================
echo.
echo All services have been successfully:
echo ✅ Built as Docker images
echo ✅ Pushed to Docker Hub (haneull)
echo ✅ Deployed to Kubernetes cluster
echo.

pause 