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

workflow "Add Issues to Project Board" {
  on = "issues"
  resolves = ["Add "]
}

action "Add " {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
}
