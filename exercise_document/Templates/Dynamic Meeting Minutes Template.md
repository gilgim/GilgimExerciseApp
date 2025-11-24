<%*
/*
 * Dynamic Meeting Minutes Template
 * This script sets the file name based on user input or date.
 */

// 사용자로부터 회의 제목을 입력받습니다.
const vaultName = tp.app.vault.adapter.basePath.split(/\/|\\/).pop();
const userTitle = await tp.system.prompt("회의 노트의 제목을 입력해주세요:", `${vaultName} - ${tp.date.now("yyyy년 MM월 DD일")}`);

// 파일명이 비어있지 않으면, 입력한 제목을 사용하고, 비어있으면 현재 날짜를 사용합니다.
const title = userTitle && userTitle.trim() !== "" ? userTitle : `${vaultName} - ${tp.date.now("yyyy년 MM월 DD일")}`;

// 파일명을 설정합니다.
await tp.file.rename(title);

// YAML 메타데이터 설정
tR += `---
title: ${title}
date: ${tp.date.now("yyyy-MM-DD")}
project: ${vaultName}
tags: [MeetingMinutes]
attendees: 
  - 
  - 
  - 
---
## 회의 정보
- **회의 제목**: ${title}
- **날짜**: ${tp.date.now("yyyy-MM-dd")}
- **장소**: 
- **참석자**:
  - 
  - 
  - 

## 회의 안건
1. 
2. 
3. 

## 회의 내용

### 1. 안건 1
- **논의 내용**:
  
### 2. 안건 2
- **논의 내용**:
  
### 3. 안건 3
- **논의 내용**:
  
## 결정 사항
1. 
2. 
3. 
`;
%>