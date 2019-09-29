require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

GITHUB_EVENT_PATH = ENV.fetch('GITHUB_EVENT_PATH')
GITHUB_TOKEN = ENV.fetch('GITHUB_TOKEN')
COLUMN_ID = ENV.fetch('INPUT_COLUMN_ID')

event_json = File.read(GITHUB_EVENT_PATH)
event = JSON.parse(event_json)

client = Octokit::Client.new(access_token: GITHUB_TOKEN)

# puts event_json
# puts ENV.reject { |k, v| k == 'GITHUB_TOKEN' }
# current_repo = Octokit::Repository.from_url(event["repository"]["html_url"])
# projects = client.projects(current_repo, accept: "application/vnd.github.inertia-preview+json")
# puts projects.inspect

if event['pull_request']
  content_id = event['pull_request']['id']
  content_type = 'PullRequest'
end

if event['issue']
  content_id = event['issue']['id']
  content_type = 'Issue'
end

if content_id && content_type
  client.create_project_card(COLUMN_ID, content_id: content_id, content_type: content_type, accept: "application/vnd.github.inertia-preview+json")
else
  puts "Skipping because trigger not a Pull Request or Issue"
end
