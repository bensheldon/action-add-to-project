require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

GITHUB_TOKEN = ENV.fetch('GITHUB_TOKEN')
COLUMN_ID = ENV.fetch('COLUMN_ID')

PULL_REQUEST_VALID_ACTIONS = ['opened']
ISSUE_VALID_ACTIONS = ['opened']

event_json = File.read(ENV['GITHUB_EVENT_PATH'])
event = JSON.parse(event_json)

client = Octokit::Client.new(access_token: GITHUB_TOKEN)
# current_repo = Octokit::Repository.from_url(event["repository"]["html_url"])

# projects = client.projects(current_repo, accept: "application/vnd.github.inertia-preview+json")
# puts projects.inspect

if event['pull_request'] && PULL_REQUEST_VALID_ACTIONS.include?(event['action'])
  content_id = event['pull_request']['id']
  content_type = 'PullRequest'
end

if event['issue'] && ISSUE_VALID_ACTIONS.include?(event['action'])
  content_id = event['issue']['id']
  content_type = 'Issue'
end

if content_id && content_type
  client.create_project_card(COLUMN_ID, content_id: content_id, content_type: content_type, accept: "application/vnd.github.inertia-preview+json")
end
