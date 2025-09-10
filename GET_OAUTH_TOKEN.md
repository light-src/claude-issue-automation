# Claude Code OAuth Token 설정 가이드

## Claude Code 요금제를 사용하여 GitHub Action 실행하기

### 방법 1: Claude Code CLI에서 OAuth Token 얻기 (권장)

1. **Claude Code 터미널에서 실행:**
```bash
claude oauth
```

2. **생성된 토큰 복사**
   - 화면에 표시되는 OAuth 토큰을 복사합니다

3. **GitHub Secret에 추가:**
```bash
gh secret set CLAUDE_CODE_OAUTH_TOKEN --body="YOUR_OAUTH_TOKEN_HERE" --repo light-src/claude-issue-automation
```

### 방법 2: GitHub App 권한 사용 (더 간단)

Claude Code GitHub App이 이미 설치되어 있으므로, 워크플로우를 수정하여 GitHub App 권한을 직접 사용할 수 있습니다:

```yaml
- name: Implement feature with Claude
  uses: anthropics/claude-code-action@v1
  with:
    # OAuth token 또는 API key 없이 GitHub App 권한 사용
    github_token: ${{ secrets.GITHUB_TOKEN }}
```

### 현재 워크플로우 상태

워크플로우가 `claude_code_oauth_token`을 사용하도록 업데이트되었습니다:
- ✅ API 키 방식에서 OAuth 토큰 방식으로 변경
- ✅ Claude Code 요금제 사용 가능
- ⏳ OAuth 토큰 설정 필요

### OAuth Token 설정 후

1. OAuth 토큰을 GitHub Secret에 추가
2. 워크플로우가 자동으로 Claude Code 요금제를 사용하여 실행됩니다
3. API 크레딧 없이도 작동합니다!

## 주의사항

- Claude Code 요금제가 활성화되어 있어야 합니다
- OAuth 토큰은 주기적으로 갱신이 필요할 수 있습니다
- GitHub App이 레포지토리에 설치되어 있어야 합니다 (이미 완료)