# Action Runner

This project build a [GitHub Action Runner](https://github.com/actions/runner) image with a tool cache and an Action archive cache.
The image will be pushed to ghcr.io. Feel free to pull and repush to your own registry.

## Development

This solution is from [this blog](https://www.kenmuse.com/blog/building-github-actions-runner-images-with-an-action-archive-cache/)

### Adding new actions

add to `.github/workflows/release.yml`, the `Action archive cache` section.
You don't need to specify the version of the action, it will be added automatically.

### Adding new tools

add to `.github/workflows/release.yml`, the `create-tool-cache` section.
