# The Issue
Hypothesis is that jekyll is not playing well with containers, possible due to the fact that it predates the modern adoption of containers. 

To get around its shortcomings for now, please follow the steps below

## Steps
In all of these steps be sure to change `docker` --> `podman` if you are using it instead.
1. `docker rm -f bu-spark`: remove the old image to avoid errors
2. `make -n run`: outputs what the command would have been if you ran `make run`, which is not working
3. **Copy everything from `buspark` to the end**: this is the path which is relative to your computer
4. `docker run -it --entrypoint /bin/bash --name < paste copied part here >`: this will run an interative version of the command, allowing us to interact manually with the container
5. **Run a few lines from `./launch.sh`**: We will manually run parts of the launch script for codespaces (they work for localhost too)
    - `bundle check || bundle install`: install dependencies
    - `bundle exec jekyll build`: build jekyll site which helps us create static HTML and CSS files
    - `bundle exec jekyll serve --host 0.0.0.0 --livereload --baseurl=""`: host the site locally with hot reload


### In case you'd like the comamnds all in one block:
```
docker rm -f bu-spark
make -n run
docker run -it --entrypoint /bin/bash --name < paste copied part here >
bundle check || bundle install
bundle exec jekyll build
bundle exec jekyll serve --host 0.0.0.0 --livereload --baseurl=""
```