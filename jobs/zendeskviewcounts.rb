require 'yaml'
require 'zendesk_api'

client = ZendeskAPI::Client.new do |config|
  configobject = YAML.load_file("config.yml")
  config.url = configobject['url']
  config.username = configobject['username']
  config.token = configobject['token']
  config.retry = true
end

# array of view IDs to check, these are your data-id's in your erb file.
  views = [27403332,29311566,75065288,360102654454,360107318794,37830066,163887427,360016776498,360016786957,360036902754]

  # TS Views
  # 27403332 - Unassigned
  # 29311566 - inbox (new)
  # 75065288 - 2 hours to breach
  # 360102654454 - urgent open
  
  # Internal Escalations
  # 163887427 - internal escalations (all time)
  # 360016776498 - Internal escalations in the last month
  # 360016786957 - tickets escalated internally, but not to devs, last month

  # CS Views
  # 37830066 - CS open tickets
  # 360036902754 - no ticket cause for all
  # 360107318794 - tickets breaching in 1 business day

SCHEDULER.every '1m', :first_in => 0 do |job|
  counts = client.view_counts(:ids => views, :path => 'views/count_many')
  counts.all do |ct|
    if ct.fresh
      puts "sending "+ct.view_id.to_s+" : "+ct.value.to_s
      send_event(ct.view_id.to_i, { current: ct.value.to_i })
    end
  end
end