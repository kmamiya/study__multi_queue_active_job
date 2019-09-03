#bin/env bash

# docker-composeを止めた時 tmp/pids 内がうまく消えない(各プロセス終了前にcontainerが止まっている？)ので強制的に削除しておく
rm -f tmp/pids/*.pid tmp/pids/worker1/*.pid tmp/pids/worker2/*.pid

# Delayed job
# こちらはバックグラウンド起動する
# worker_name はループ処理などにしたいが一先ず毎回変数をセットする形式
# worker1は長時間重プロセス想定、同時実行数を減らしてかつ優先度低
# worker2は短時間軽プロセス想定、同寺実行数を増やして優先度も高め
worker_name='worker1'
bin/delayed_job --queue=queue1 --prefix ${worker_name} --pid-dir=tmp/pids/${worker_name} -n 4 --max-priority 10 start
worker_name='worker2'
bin/delayed_job --queue=queue2 --prefix ${worker_name} --pid-dir=tmp/pids/${worker_name} -n 8 --max-priority 5 start

# Rails
bin/rails s -b '0.0.0.0' -p 3000

# Stop delayed job
# RailsがCTRL+C停止されたらdelayed_jobのバックグラウンドプロセスを止める
bin/delayed_job --pid-dir=tmp/pids/worker1 stop
sleep 5
bin/delayed_job --pid-dir=tmp/pids/worker2 stop
sleep 5
