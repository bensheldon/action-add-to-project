# action-add-to-project
Github Action to add Pull Requests or Issues to Github Project Boards

```
name: Add Issues and PRs to Project Board
on:
  issues:
    types: [opened]
  pull_request:
    types: [opened]
jobs:
  add_to_column:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Add to Column
        uses: "bensheldon/action-add-to-project@master"
        with:
          column_id: "9999999"
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Development

- Github Workflow events reference: https://developer.github.com/actions/managing-workflows/workflow-configuration-options/#events-supported-in-workflow-files
- Github Project API reference: https://developer.github.com/v3/projects/
- Octokit Project API documentation: https://www.rubydoc.info/gems/octokit/Octokit/Client/Projects
- Github Actions Docker Documention (including icons): https://developer.github.com/actions/creating-github-actions/creating-a-docker-container
