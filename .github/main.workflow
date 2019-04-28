workflow "On Pull Request" {
  resolves = ["Add PR to Project Board"]
  on = "pull_request"
}

action "Add PR to Project Board" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
  env = {
    COLUMN_ID = "5199778"
  }
}

workflow "On Issue" {
  resolves = ["Add Issue to Project Board"]
  on = "issues"
}

action "Add Issue to Project Board" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
  env = {
    COLUMN_ID = "5199778"
  }
}

