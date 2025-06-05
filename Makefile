# 모든 명령어 앞에 'make' 를 붙여서 실행해야 함
# 🔧 공통 명령어
up:
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

restart:
	docker-compose down && docker-compose up -d --build

ps:
	docker-compose ps


# 🚀 마이크로서비스별 명령어

## gateway
build-gateway:
	docker-compose build gateway

up-gateway:
	docker-compose up -d gateway

down-gateway:
	docker-compose stop gateway

logs-gateway:
	docker-compose logs -f gateway

restart-gateway:
	docker-compose down gateway && docker-compose up -d --build gateway

## frontend
build-frontend:
	docker-compose build frontend

up-frontend:
	docker-compose up -d frontend

down-frontend:
	docker-compose stop frontend

logs-frontend:
	docker-compose logs -f frontend

restart-frontend:
	docker-compose down frontend && docker-compose up -d --build frontend

## dsdgen
build-dsdgen:
	docker-compose build dsdgen

up-dsdgen:
	docker-compose up -d dsdgen

down-dsdgen:
	docker-compose stop dsdgen

logs-dsdgen:
	docker-compose logs -f dsdgen

restart-dsdgen:
	docker-compose down dsdgen && docker-compose up -d --build dsdgen

## dsdcheck
build-dsdcheck:
	docker-compose build dsdcheck

up-dsdcheck:
	docker-compose up -d dsdcheck

down-dsdcheck:
	docker-compose stop dsdcheck

logs-dsdcheck:
	docker-compose logs -f dsdcheck

restart-dsdcheck:
	docker-compose down dsdcheck && docker-compose up -d --build dsdcheck

## postgres
build-postgres:
	docker-compose build postgres

up-postgres:
	docker-compose up -d postgres

down-postgres:
	docker-compose stop postgres

logs-postgres:
	docker-compose logs -f postgres

restart-postgres:
	docker-compose down postgres && docker-compose up -d --build postgres

# 🎯 쿠버네티스 관련 명령어
k8s-apply:
	kubectl apply -f k8s/

k8s-delete:
	kubectl delete -f k8s/

k8s-restart-gateway:
	kubectl rollout restart deployment/gateway -n dev

k8s-restart-frontend:
	kubectl rollout restart deployment/frontend -n dev

k8s-restart-dsdgen:
	kubectl rollout restart deployment/dsdgen -n dev

k8s-restart-dsdcheck:
	kubectl rollout restart deployment/dsdcheck -n dev

k8s-logs-gateway:
	kubectl logs -f deployment/gateway -n dev

k8s-logs-frontend:
	kubectl logs -f deployment/frontend -n dev

k8s-logs-dsdgen:
	kubectl logs -f deployment/dsdgen -n dev

k8s-logs-dsdcheck:
	kubectl logs -f deployment/dsdcheck -n dev

k8s-status:
	kubectl get pods -n dev

# 🔥 개발 환경 빠른 배포
dev-deploy-gateway:
	cd gateway_service && docker build -t haneull/gateway_service:latest . --no-cache && docker push haneull/gateway_service:latest && cd .. && kubectl rollout restart deployment/gateway -n dev

dev-deploy-frontend:
	cd frontend && docker build -t haneull/frontend:latest . --no-cache && docker push haneull/frontend:latest && cd .. && kubectl rollout restart deployment/frontend -n dev

dev-deploy-dsdgen:
	cd dsdgen_service && docker build -t haneull/dsdgen_service:latest . --no-cache && docker push haneull/dsdgen_service:latest && cd .. && kubectl rollout restart deployment/dsdgen -n dev

dev-deploy-dsdcheck:
	cd dsdcheck_service && docker build -t haneull/dsdcheck_service:latest . --no-cache && docker push haneull/dsdcheck_service:latest && cd .. && kubectl rollout restart deployment/dsdcheck -n dev

