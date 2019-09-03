ターゲット環境が少し古いため、いくつかのgemで脆弱性が残っているようです。再利用する場合は適宜対策してください。
Gemfile*については、ターゲット環境にあわせるため不要なものが多く含まれています。

# Usage

1. `docker-compose up`
1. access to
    - `localhost/contents` ... ジョブ投入用画面
    - `localhost/delayed_job` ... ジョブ管理画面
