
|![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Warning.svg/156px-Warning.svg.png) | Deis Workflow will soon no longer be maintained.<br />Please [read the announcement](https://deis.com/blog/2017/deis-workflow-final-release/) for more detail. |
|---:|---|
| 09/07/2017 | Deis Workflow [v2.18][] final release before entering maintenance mode |
| 03/01/2018 | End of Workflow maintenance: critical patches no longer merged |

# Deis.io Website

This is the source code for our publicly viewable website, http://deis.io.

## Contributing

If you see a typo or something outdated on our website, send us a pull request!

To run the website locally for development:

    $ cd deis.io
    $ bundle install
    $ bundle exec jekyll serve --baseurl=''

And then head off to http://localhost:4000/ in your browser to view the site.

[v2.18]: https://github.com/deis/workflow/releases/tag/v2.18.0
