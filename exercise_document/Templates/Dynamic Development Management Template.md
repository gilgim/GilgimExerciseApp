<%*
/*
 * Dynamic Development Management Template
 * This script sets the file name based on user input or date.
 */
 
const vaultName = tp.app.vault.adapter.basePath.split(/\/|\\/).pop();

// 파일명을 입력받거나 기본값 설정
const userTitle = await tp.system.prompt("노트의 제목을 입력해주세요:", `Dev Management - ${tp.date.now("yyyy년 MM월 DD일")}`);

// 파일명이 비어있지 않으면, 입력한 제목을 사용하고, 비어있으면 기본값 사용
const title = userTitle && userTitle.trim() !== "" ? userTitle : `Dev Management - ${tp.date.now("yyyy년 MM월 DD일")}`;

// 파일명을 설정
await tp.file.rename(title);

// YAML 메타데이터 설정
tR += `---
title: ${title}
date: ${tp.date.now("yyyy-MM-DD")}
project: ${vaultName}
tags: [Development, Management]
---

## 📅 오늘의 Task
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

## 💻 커밋 이력
| 날짜 | 커밋 메시지 | 작성자 |
|------|-------------|--------|
| ${tp.date.now("yyyy-MM-dd")} | 커밋 메시지 1 | 커밋ID |
| ${tp.date.now("yyyy-MM-dd")} | 커밋 메시지 2 | 커밋ID |
| ${tp.date.now("yyyy-MM-dd")} | 커밋 메시지 3 | 커밋ID |

## 🛠 개발 내역
### 기능 추가
- **기능 1**: 상세 설명
- **기능 2**: 상세 설명

### 버그 수정
- **버그 1**: 상세 설명
- **버그 2**: 상세 설명

### 개선 사항
- **개선 1**: 상세 설명
- **개선 2**: 상세 설명

## 📌 추가 메모
`;
%>