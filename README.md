# action-add-to-project
Github Action to add Pull Requests or Issues to Github Project Boards

```
workflow "Add PRs Project Board" {
  on = "pull_request"
  resolves = ["Add to Project Board"]
}

action "Add to Project Board" {
  uses = ["bensheldon/action-add-to-project@master"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    COLUMN_ID = "5199778"
  }
}
```

## Development

- Github Workflow events reference: https://developer.github.com/actions/managing-workflows/workflow-configuration-options/#events-supported-in-workflow-files
- Github Project API reference: https://developer.github.com/v3/projects/
- Octokit Project API documentation: https://www.rubydoc.info/gems/octokit/Octokit/Client/Projects
