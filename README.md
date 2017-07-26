# BAM API Documentation

[![build status](https://readthedocs.org/projects/bam-x/badge/?version=latest)
](https://readthedocs.org/projects/bam-x/)


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
[project page](https://readthedocs.org/projects/bam-x/builds/) .

Then, view your documentation on https://bam-x.readthedocs.io/en/latest/
or on http://docs.bam-x.com/en/latest/


## Releasing a New Version

Releases are managed using Github tags. Use semantic versioning.
