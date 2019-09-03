#bin/env bash


# Delayed job
# こちらはバックグラウンド起動する
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
