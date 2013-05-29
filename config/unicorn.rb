before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "/home/seeapp/apps/seearm/current/Gemfile"
end

root = "/home/seeapp/apps/seearm/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/err_unicorn.log"
stdout_path "#{root}/log/out_unicorn.log"

listen "/tmp/unicorn.seearm.sock"
worker_processes 2
timeout 30