# nodebb-plugin-grounds

The board index of [forum.grounds.gg](https://forum.grounds.gg) for NodeBB 4 with the Harmony theme.

Every top-level category becomes a boxed section: its name (and description) is the title bar, its child categories are the board rows inside, each with icon, title, description, links to its own subcategories, topic and post counts and the last post. Top-level categories without children are rows themselves; consecutive ones share one box without a title bar.

Structure categories in the ACP accordingly: top-level categories are headings (mark them "section" if they should hold no topics of their own), boards are their children, and a third level shows up as links under the board.

## What it overrides

- `templates/categories.tpl` — Harmony's index page, rendered from `sections` instead of `categories`. Rows still use Harmony's `partials/categories/item.tpl`; the widget areas, paginator and `component=` attributes are unchanged.
- `templates/partials/categories/lastpost.tpl` — the last post column shows the topic title, the author and the time instead of a post excerpt. Harmony uses this partial for subcategory rows on category pages too.
- `filter:categories.build` (`library.js`) — groups the tree into `sections`, loads the boards' own subcategories back (NodeBB trims them on the index) and gives boards a teaser like top-level categories get.

The styling lives in the forum's custom CSS, not here.

## Deployment

Not published to npm. The forum installs it from a GitHub tarball of a pinned commit and lists `nodebb-plugin-grounds` in `plugins.active` of `config.json`, since NodeBB's build takes templates only from active plugins:

```sh
npm install nodebb-plugin-grounds@https://codeload.github.com/groundsgg/nodebb-plugin-grounds/tar.gz/<commit sha>
```

## License

MIT
