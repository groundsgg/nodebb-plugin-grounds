# nodebb-plugin-grounds

The board index, topic posts and top bar of [forum.grounds.gg](https://forum.grounds.gg) for NodeBB 4 with the Harmony theme.

Every top-level category becomes a boxed section: its name (and description) is the title bar, its child categories are the board rows inside, each with icon, title, description, links to its own subcategories, topic and post counts and the last post. Top-level categories without children are rows themselves; consecutive ones share one box without a title bar.

Structure categories in the ACP accordingly: top-level categories are headings (mark them "section" if they should hold no topics of their own), boards are their children, and a third level shows up as links under the board.

On a topic, every post is a box with an author column on the left (avatar, rank badge, name, post count, reputation, joined) and the post on the right: a header line with the time, the edited marker and the `#n` permalink, the body, and a footer with reply, quote, votes and the post menu. The quick reply uses the same box.

## What it overrides

- `templates/categories.tpl` — Harmony's index page, rendered from `sections` instead of `categories`. Rows still use Harmony's `partials/categories/item.tpl`; the widget areas, paginator and `component=` attributes are unchanged.
- `templates/partials/categories/lastpost.tpl` — the last post column shows the topic title, the author and the time instead of a post excerpt. Harmony uses this partial for subcategory rows on category pages too.
- `templates/partials/topic/post.tpl` — Harmony's post, rearranged into the author column and the post column; every `component=` attribute, `data-*` and widget area of Harmony's partial is kept, so post tools, quoting, replying, votes, editing, replies and the navigator work unchanged. Also renders posts added live and replies opened under a post.
- `templates/partials/topic/quickreply.tpl` — the quick reply in the same box, with the reader's avatar as author column. Harmony also shows it on `/world`.
- `templates/partials/topic/stats.tpl` — the topic's posts, posters, views and watchers as one line of text instead of badges.
- `templates/partials/header/brand.tpl` — the Grounds bar instead of Harmony's brand header: the `brand-header` widget area (the forum puts its logo and hub links there), then from 992px wide search, new topic, drafts (only while there are some), notifications and the user menu (`partials/grounds/`). Search, notifications and drafts keep Harmony's `component=` hooks, so quick search, the live notification count and the drafts list work unchanged. Guests get the forum navigation behind a menu button and a login link.
- `templates/partials/sidebar/user-menu.tpl` — the user menu: avatar, rank badge and name as the button; profile, edit profile, settings, notifications, moderator links, the forum navigation (Harmony's left sidebar, with its unread counts) and logout. Harmony's bottom bar uses it on phones too.
- `templates/partials/sidebar-left.tpl`, `templates/partials/sidebar-right.tpl` — empty: their contents are in the bar, so the content takes the full width. Below 992px Harmony's bottom bar stays as it is.
- `filter:middleware.renderHeader` (`library.js`) — the reader's rank badge (their selected group, loaded as for posts) and whether they may start a topic in any category, for the bar; `public/grounds.js` opens the composer from the new-topic button.
- `filter:categories.build` (`library.js`) — groups the tree into `sections`, loads the boards' own subcategories back (NodeBB trims them on the index) and gives boards a teaser like top-level categories get.
- `filter:posts.addUserFields` (`library.js`) — loads post authors' `joindate` for the author column.

The styling lives in the forum's custom CSS, not here.

## Deployment

Not published to npm. The forum installs it from a GitHub tarball of a pinned commit and lists `nodebb-plugin-grounds` in `plugins.active` of `config.json`, since NodeBB's build takes templates only from active plugins:

```sh
npm install nodebb-plugin-grounds@https://codeload.github.com/groundsgg/nodebb-plugin-grounds/tar.gz/<commit sha>
```

## License

MIT
