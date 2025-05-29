'use client';

export default function EsgPage() {
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-6">ESG 공시 DSD 생성</h1>
      <div className="bg-white rounded-lg shadow p-6">
        <p className="text-gray-600 mb-4">
          ESG 공시 데이터를 DSD(Data Structure Definition) 형식으로 변환하여 
          표준화된 데이터 구조를 생성합니다.
        </p>
        <div className="mt-4">
          <a
            href="/guide/esg-dsd"
            className="inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition-colors"
          >
            ESG DSD 가이드 보기
          </a>
        </div>
      </div>
    </div>
  );
} 