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

