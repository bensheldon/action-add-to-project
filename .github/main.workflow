workflow "Add PRs to Project Board" {
  resolves = ["Add to Project Board"]
  on = "pull_request"
}

action "Add to Project Board" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
  env = {
    COLUMN_ID = "5199778"
  }
}

workflow "Add Issues to Project Board" {
  resolves = ["Add "]
  on = "issues"
}

action "Add " {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
}
