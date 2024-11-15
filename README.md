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

### Development

#### Via GitHub Codespaces
By far the easiest mechanism to make changes.

1. Click on the big green "<> Code" button, click to the 2nd tab (Codespaces), click the "+" sign.
2. Once it is done warming up, you should be able to open a terminal and run `./launch.sh`.
3. However, if you get an error about dependencies, run `bundle update` then run `./launch.sh`.
4. Copy the url to your codespace which will look something like `https://obscure-dollop-qsdadASD.github.dev/`
5. Open a new browser window or tab and paste the url.
6. Before hitting enter, modify it to be `https://obscure-dollop-qsdadASD-4000.app.github.dev/` (NOTE: you are adding `-4000.app` kind of in the middle).

You should now be able to hit enter and see your changes.

If anyone has any bright ideas about how to make this a launch configuration I would love to include it.


#### Via Local VS Code
1. Install `docker` or `podman` and `make`.
2. Find the URI for the repo under the big green "<> Code" button.
3. `git clone` the repo somewhere.
4. Open the folder in VS Code.
5. In a terminal run `make build` or `make build-podman` as appropriate.
6. run `make run` or `make run-podman`.
7. You should be able to go to a browser and goto [http://localhost:4000](http://localhost:4000) and see the site.

### Notes
* Make a new branch for your changes
* You should not use a fork, as then the preview automation won't work
* Once you are pretty happy with your code, create a PR from your branch (after you pushed to GitHub) and add `WIP` to the begining of the name of the PR. Go to your PR and you should see a link to preview of the site (it can take awhile). When you think everything is correct, delete the `WIP` from the name of the PR and tag some reviewers.
<hr/>

### Running into problems getting the docker / podman container to start? 

#### The Issue
* Hypothesis is that jekyll is not playing well with containers, possible due to the fact that it predates the modern adoption of containers. 
* To get around its shortcomings for now, please follow the steps below

#### Steps
* In all of these steps be sure to change `docker` --> `podman` if you are using it instead. Make sure you are running docker (or podman) when doing this.
1. `docker rm -f bu-spark`: remove the old image to avoid errors
2. `make -n run`: outputs what the command would have been if you ran `make run`, which is not working
3. **Copy everything from `buspark` to the end**: this is the path which is relative to your computer
4. `docker run -it --entrypoint /bin/bash --name < paste copied part here >`: this will run an interative version of the command, allowing us to interact manually with the container
5. **Run a few lines from `./launch.sh`**: We will manually run parts of the launch script for codespaces (they work for localhost too)
    - `bundle check || bundle install`: install dependencies
    - `bundle exec jekyll build`: build jekyll site which helps us create static HTML and CSS files
    - `bundle exec jekyll serve --host 0.0.0.0 --livereload --baseurl=""`: host the site locally with hot reload

#### In case you'd like the comamnds all in one block:
```
docker rm -f bu-spark
make -n run
docker run -it --entrypoint /bin/bash --name < paste copied part here >
bundle check || bundle install
bundle exec jekyll build
bundle exec jekyll serve --host 0.0.0.0 --livereload --baseurl=""
```
