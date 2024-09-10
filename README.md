# bu-spark.github.io
The start of Spark! Tech Resources


## Upgrades
Ruby, gems and bundler are very conservative about upgrades.
We are now using [`pages-gem`](https://github.com/github/pages-gem) and [`just-the-docs`](https://just-the-docs.com/) as our only gem dependencies and, hopefully, it will upgrade more nicely.

## Running the application

### Production
The github pages site will update automatically on every commit to main.
The jekyll config is managed in `/_config.prod.yml` as you can see in the [GitHub Workflow](https://github.com/BU-Spark/bu-spark/blob/main/.github/workflows/build-jekyll.yml).
The use of a non-standard file is to support a need for a separate config (in the standard place) for dev.

## Development

### Via GitHub Codespaces
By far the easiest mechanism to make changes.

1. Click on the big green "<> Code>" button, click to the 2nd tab (Codespaces), click the "+" sign.
2. Once it is done warming up, you should be able to open a terminal and run `./launch.sh`.
3. However, if you get an error about dependencies, run `bundle update` then run `./launch.sh`.
4. Copy the url to your codespace which will look something like `https://obscure-dollop-qsdadASD.github.dev/`
5. Open a new browser window or tab and paste the url.
6. Before hitting enter modify it to be `https://obscure-dollop-qsdadASD-4000.app.github.dev/` (NOTE: you are adding `-4000.app` kind of in the middle).

You should now be able to hit enter and see your changes.

If anyone has any bright ideas about how to make this a launch configuration I would love to include it.


### Via Local VS Code
1. Install `docker` or `podman` and `make`.
2. Find the URI for the repo under the big green "<> Code>" button.
3. `git clone` the repo somewhere.
4. Open the folder in VS Code.
5. In a terminal run `make build` or `make build-podman` as appropriate.
6. run `make run` or `make run-podman`.
7. You should be able to go to a browser and goto [http://localhost:4000](http://localhost:4000) and see the site.

### Notes
* You should always be making a branch for your changes
* You should not use a fork as then the preview automation won't work
* Once you are pretty happy with your code, create a PR from your branch (after you pushed to GitHub) and add `WIP` to the beggining of the name of the PR. Go to your PR and you should see a link to preview of the site (it can take awhile).
