# Engineering Management Space

### Quick info

This site is hosted at [Netlify](https://www.netlify.com/). The them is at
my own fork at [hugo-theme-even](https://github.com/donbonifacio/hugo-theme-even).

Currently the blog runs against hugo `0.32.2`. That is defined at `netlify.toml`.

### How to

Pages are on the `content/` directory. The top menu that references pages is
defined at `config.toml`.

Posts can be created with: `hugo new post/post-name.md`.

The local server can be started with `hugo server -D`. The `-D` option is to
also include posts tagged as draft.
