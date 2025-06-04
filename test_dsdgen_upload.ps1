# DSDGen Upload 엔드포인트 테스트 스크립트

Write-Host "🧪 POST /api/dsdgen/upload 엔드포인트 테스트 시작..." -ForegroundColor Green

# 테스트 URL과 데이터
$url = "http://localhost:8000/api/dsdgen/upload"
$body = @{
    corp_code = "005930"
} | ConvertTo-Json

$headers = @{
    "Content-Type" = "application/json"
}

try {
    Write-Host "📤 요청 URL: $url" -ForegroundColor Yellow
    Write-Host "📤 요청 Body: $body" -ForegroundColor Yellow
    
    # POST 요청 보내기
    $response = Invoke-WebRequest -Uri $url -Method POST -Headers $headers -Body $body -UseBasicParsing
    
    Write-Host "✅ 응답 상태: $($response.StatusCode)" -ForegroundColor Green
    Write-Host "📥 응답 내용:" -ForegroundColor Cyan
    $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 10
    
} catch {
    Write-Host "❌ 오류 발생: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.Exception.Response) {
        Write-Host "📥 오류 응답 상태: $($_.Exception.Response.StatusCode)" -ForegroundColor Red
        try {
            $errorResponse = $_.Exception.Response.GetResponseStream()
            $reader = New-Object System.IO.StreamReader($errorResponse)
            $errorContent = $reader.ReadToEnd()
            Write-Host "📥 오류 응답 내용: $errorContent" -ForegroundColor Red
        } catch {
            Write-Host "📥 오류 응답 내용을 읽을 수 없습니다." -ForegroundColor Red
        }
    }
}

Write-Host "🧪 테스트 완료!" -ForegroundColor Green 