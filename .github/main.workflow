workflow "Add PRs Project Board" {
  on = "pull_request"
  resolves = ["Add to Project Board"]
}

action "Add to Project Board" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
  env = {
    COLUMN_ID = "5199778"
  }
}
