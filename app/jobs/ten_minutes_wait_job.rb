class TenMinutesWaitJob < ActiveJob::Base
  queue_as :queue1

  def perform(*args)
    logger.info "Start job; #{Time.current.strftime('%Y-%m-%d %H:%M:%S.%s')}, job_id: #{job_id}, queue_name: #{queue_name}"
    sleep(10 + 60)
    logger.info "End job; #{Time.current.strftime('%Y-%m-%d %H:%M:%S.%s')}, job_id: #{job_id}, queue_name: #{queue_name}"
  end
end
