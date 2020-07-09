# Narrativ API Documentation

[![build status](https://readthedocs.com/projects/narrativ-narrativ/badge/?version=latest)
](https://readthedocs.com/projects/narrativ-narrativ/)


## Local Development Workflow

Build the latest documentation using the docker container:
```sh
make docker-pull-latest
make docker-sphinx
```

This outputs documentation in the `html` and `singlehtml` formats.
View these files in your web browser:
```
docs/_build/html/index.html
docs/_build/singlehtml/index.html

# Shortcut for previewing HTML in Chrome
$ make preview SECTION=smartlink # opens docs/_build/html/smartlink.html
```

To build specific formats only:
```sh
make docker-sphinx-html
```

To delete the build directory and start fresh:
```sh
make docker-sphinx-clean
```


## Code Style

Write your documentation in reStructuredText, or possibly markdown.

For reStructuredText, please follow the [Python documentation style guide
](https://docs.python.org/devguide/documenting.html#style-guide) .
Files should be indented using 3 spaces (except for code blocks).


## Reading the Docs

Once your pull request is merged into master, an automated build will
be triggered on Read the Docs. Check the status of your build on our
[project page](https://readthedocs.com/projects/narrativ-narrativ/builds/) .

Then, view your documentation on https://narrativ-narrativ.readthedocs-hosted.com/
or on http://docs.narrativ.com/


## Releasing a New Version

Update the version number in `docs/conf.py` to one minor release bump from the last tagged version.

Releases are managed using Github tags. Use semantic versioning.
