# Git Attributes 설정 가이드

## 📋 개요

이 프로젝트는 **모노레포** 구조로 Next.js frontend, FastAPI backend, 그리고 Kubernetes 배포 설정을 포함하고 있습니다. `.gitattributes` 파일을 통해 **크로스 플랫폼 개발 환경**에서 일관된 파일 처리를 보장합니다.

## 🔧 주요 설정

### 1. 기본 설정
```
* text=auto eol=lf
```
- 모든 텍스트 파일을 자동 감지하고 LF로 정규화
- Windows에서도 Linux 컨테이너와 동일한 동작 보장

### 2. 프로젝트별 최적화

#### Next.js Frontend
- `.js`, `.jsx`, `.ts`, `.tsx` → LF 강s제
- `package.json`, `yarn.lock` → LF 강제
- CSS/SCSS 파일들 → LF 강제

#### FastAPI Backend  
- `.py`, `.pyi`, `.pyx` → LF 강제
- `requirements.txt`, `pyproject.toml` → LF 강제
- 환경변수 파일들 (`.env*`) → LF 강제

#### Kubernetes/Docker
- 모든 YAML 파일 → LF 강제
- `Dockerfile*` → LF 강제
- `k8s/*` 디렉토리 전체 → LF 강제

## 🚀 적용 방법

### 기존 프로젝트에 적용
```bash
# 1. .gitattributes 파일이 생성된 후
git add .gitattributes
git commit -m "Add .gitattributes for cross-platform compatibility"

# 2. 기존 파일들의 line ending 정규화
git add --renormalize .
git commit -m "Normalize line endings"
```

### 새 클론 시
```bash
# 클론 후 자동으로 올바른 line ending 적용됨
git clone <repository-url>
```

## ⚠️ 주의사항

### Windows 개발자
- **Git 설정 확인**: `git config --global core.autocrlf false`
- IDE 설정에서 LF 사용하도록 설정
- PowerShell 스크립트는 예외적으로 CRLF 유지

### 컨테이너 환경
- Docker 빌드 시 line ending 문제 방지
- Kubernetes manifest 파일 일관성 보장
- 셸 스크립트 실행 오류 방지

## 🔍 검증 방법

### Line Ending 확인
```bash
# Linux/Mac
file <파일명>

# Windows (PowerShell)
Get-Content <파일명> -Raw | ForEach-Object { $_.GetType() }
```

### Git에서 확인
```bash
# 파일의 Git 속성 확인
git check-attr -a <파일명>

# 변경사항 확인
git status --porcelain
```

## 📁 파일 타입별 처리

| 파일 타입 | 처리 방식 | 이유 |
|-----------|-----------|------|
| `.js/.ts/.py` | `text eol=lf` | 소스코드 통일성 |
| `.yaml/.yml` | `text eol=lf` | K8s 배포 안정성 |
| `Dockerfile` | `text eol=lf` | 컨테이너 빌드 안정성 |
| `.png/.jpg` | `binary` | 바이너리 파일 보호 |
| `.bat/.cmd` | `text eol=crlf` | Windows 스크립트 호환성 |

## 🎯 모범 사례

1. **팀 공유**: 모든 팀원이 동일한 `.gitattributes` 사용
2. **IDE 설정**: 에디터에서 LF 사용하도록 설정
3. **정기 검증**: CI/CD에서 line ending 검증 추가
4. **문서화**: 새 팀원을 위한 설정 가이드 제공

## 🔧 트러블슈팅

### 문제: Kubernetes 배포 시 YAML 파싱 오류
```bash
# 해결: YAML 파일의 line ending 확인 후 정규화
git add --renormalize k8s/
```

### 문제: Docker 빌드 시 스크립트 실행 실패
```bash
# 해결: 셸 스크립트 권한 및 line ending 확인
chmod +x script.sh
git add --renormalize script.sh
```

### 문제: Windows에서 Git 충돌
```bash
# 해결: Git 설정 변경
git config --global core.autocrlf false
git config --global core.eol lf
``` 