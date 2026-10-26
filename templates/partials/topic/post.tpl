<!-- IMPORT partials/topic/post-meta-tags.tpl -->

{{{ if (!./index && widgets.mainpost-header.length) }}}
<div data-widget-area="mainpost-header">
	{{{ each widgets.mainpost-header }}}
	{{widgets.mainpost-header.html}}
	{{{ end }}}
</div>
{{{ end }}}
{{{ if (./parent && !hideParent) }}}
<!-- IMPORT partials/topic/post-parent.tpl -->
{{{ end }}}
<div class="post-container-parent post-card">
	<div class="post-author">
		<a class="post-author-avatar d-inline-block position-relative text-decoration-none" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" aria-label="{{tx("aria:profile-page-for", txEscape(txDisplayname(./user)))}}">
			{{buildAvatar(posts.user, "64px", false, "", "user/picture")}}
			<!-- IMPORT partials/topic/user-status.tpl -->
		</a>
		<div class="post-author-name">
			{{{ each posts.user.selectedGroups }}}
			{{{ if posts.user.selectedGroups.slug }}}
			<!-- IMPORT partials/groups/badge.tpl -->
			{{{ end }}}
			{{{ end }}}
			<a class="text-truncate" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{{renderShortcodeEmoji(txDisplayname(posts.user), posts.user.fullnameEmoji)}}</a>
		</div>
		{{{ if posts.user.banned }}}
		<span class="post-author-banned badge rounded-1">{{tx("user:banned")}}</span>
		{{{ end }}}
		{{{ if posts.user.uid }}}
		<dl class="post-author-stats">
			<div><dt>{{tx("global:posts")}}</dt><dd>{formattedNumber(posts.user.postcount)}</dd></div>
			{{{ if !reputation:disabled }}}
			<div><dt>{{tx("global:reputation")}}</dt><dd>{formattedNumber(posts.user.reputation)}</dd></div>
			{{{ end }}}
			{{{ if posts.user.joindateISO }}}
			<div><dt>{{tx("user:joined")}}</dt><dd><span class="timeago" title="{posts.user.joindateISO}"></span></dd></div>
			{{{ end }}}
		</dl>
		{{{ end }}}
		{{{ if posts.user.custom_profile_info.length }}}
		<div class="post-author-info">
			{{{ each posts.user.custom_profile_info }}}
			{{posts.user.custom_profile_info.content}}
			{{{ end }}}
		</div>
		{{{ end }}}
	</div>
	<div class="post-container d-flex flex-column" style="min-width:0;">
		<div class="post-header">
			<a href="{config.relative_path}/post/{encodeURIComponent(./pid)}" class="post-time text-decoration-none"><span class="timeago" title="{posts.timestampISO}"></span></a>
			<i component="post/edit-indicator" class="fa fa-pen{{{ if privileges.posts:history }}} pointer{{{ end }}} edit-icon {{{ if !posts.editor.username }}}hidden{{{ end }}}" title="{{tx("global:edited-timestamp", isoTimeToLocaleString(./editedISO, config.userLang))}}"></i>
			<span data-editor="{posts.editor.userslug}" component="post/editor" class="visually-hidden">{{tx("global:last-edited-by", txEscape(posts.editor.username))}} <span class="timeago" title="{{isoTimeToLocaleString(posts.editedISO, config.userLang)}}"></span></span>
			<span class="bookmarked opacity-0 text-primary ms-auto"><i class="fa fa-bookmark-o"></i></span>
			<a href="{config.relative_path}/post/{encodeURIComponent(./pid)}" class="post-index text-decoration-none">#{increment(./index, "1")}</a>
		</div>

		<div class="content text-break" component="post/content" itemprop="text">
			{{{ if posts.contentWarning }}}
			<details class="content-warning">
			<summary>{posts.contentWarning}</summary>
			{{{ if posts.txContent }}}{{tx(posts.content)}}{{{ else }}}{{posts.content}}{{{ end }}}
			</details>
			{{{ else }}}
			{{{ if posts.txContent }}}{{tx(posts.content)}}{{{ else }}}{{posts.content}}{{{ end }}}
			{{{ end }}}
		</div>

		<div component="post/footer" class="post-footer">
			{{{ if posts.user.signature }}}
			<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{{posts.user.signature}}</div>
			{{{ end }}}

			<div class="d-flex flex-wrap-reverse gap-2 {{{ if (hideReplies || !posts.replies.count) }}}justify-content-end{{{ else }}}justify-content-between{{{ end }}}">
				{{{ if !hideReplies }}}
				<a component="post/reply-count" data-target-component="post/replies/container" href="#" class="d-flex gap-2 align-items-center btn btn-ghost ff-secondary border rounded-1 p-1 text-muted text-decoration-none text-xs {{{ if (!./replies || shouldHideReplyContainer(@value)) }}}hidden{{{ end }}}">
					<span component="post/reply-count/avatars" class="d-flex gap-1 {{{ if posts.replies.hasMore }}}hasMore{{{ end }}}">
						{{{each posts.replies.users}}}
						<span>{{buildAvatar(posts.replies.users, "20px", true, "avatar-tooltip")}}</span>
						{{{end}}}
						{{{ if posts.replies.hasMore}}}
						<span style="height: 20px; line-height: 20px;"><i class="fa fa-ellipsis"></i></span>
						{{{ end }}}
					</span>

					<span class="ms-2 replies-count fw-semibold text-nowrap" component="post/reply-count/text" data-replies="{posts.replies.count}">{{tx(posts.replies.text)}}</span>
					<span class="ms-2 replies-last hidden-xs fw-semibold">{{tx("topic:last-reply-time")}} <span class="timeago" title="{posts.replies.timestampISO}"></span></span>

					<i class="fa fa-fw fa-chevron-down" component="post/replies/open"></i>
				</a>
				{{{ end }}}
				<div component="post/actions" class="d-flex flex-wrap flex-grow-1 align-items-center justify-content-end gap-1 post-tools">
					<!-- IMPORT partials/topic/reactions.tpl -->
					<div class="d-flex gap-1 align-items-center">
						<a component="post/reply" href="#" class="btn btn-ghost btn-sm {{{ if !privileges.topics:reply }}}hidden{{{ end }}}" title="{{tx("topic:reply")}}"><i class="fa fa-fw fa-reply"></i><span class="post-action-label">{{tx("topic:reply")}}</span></a>
						<a component="post/quote" href="#" class="btn btn-ghost btn-sm {{{ if !privileges.topics:reply }}}hidden{{{ end }}}" title="{{tx("topic:quote")}}"><i class="fa fa-fw fa-quote-right"></i><span class="post-action-label">{{tx("topic:quote")}}</span></a>

						{{{ if ./announces }}}
						<a component="post/announce-count" href="#" class="btn btn-ghost btn-sm d-flex gap-2 align-items-center" title="{{tx("topic:announcers")}}"><i class="fa fa-share-alt"></i> {./announces}</a>
						{{{ end }}}

						{{{ if !reputation:disabled }}}
						<div class="d-flex gap-0 votes align-items-center">
							<a component="post/upvote" href="#" class="btn btn-ghost btn-sm{{{ if posts.upvoted }}} upvoted{{{ end }}}" title="{{tx("topic:upvote-post")}}">
								<i class="fa fa-fw fa-chevron-up"></i>
							</a>

							<meta itemprop="upvoteCount" content="{posts.upvotes}">
							<meta itemprop="downvoteCount" content="{posts.downvotes}">
							<a href="#" class="px-2 btn btn-ghost btn-sm" component="post/vote-count" data-votes="{posts.votes}" title="{{tx("global:voters")}}">{posts.votes}</a>

							{{{ if !downvote:disabled }}}
							<a component="post/downvote" href="#" class="btn btn-ghost btn-sm{{{ if posts.downvoted }}} downvoted{{{ end }}}" title="{{tx("topic:downvote-post")}}">
								<i class="fa fa-fw fa-chevron-down"></i>
							</a>
							{{{ end }}}
						</div>
						{{{ end }}}

						<!-- IMPORT partials/topic/post-menu.tpl -->
					</div>
				</div>
			</div>

			<div component="post/replies/container" class="my-2 border rounded-1 p-3 hidden-empty"></div>
		</div>
	</div>
</div>

{{{ if (!./index && widgets.mainpost-footer.length) }}}
<div data-widget-area="mainpost-footer">
	{{{ each widgets.mainpost-footer }}}
	{{widgets.mainpost-footer.html}}
	{{{ end }}}
</div>
{{{ end }}}
