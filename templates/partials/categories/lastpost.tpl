<div class="lastpost border-start border-2 lh-sm h-100" style="border-color: {./bgColor}!important;">
	{{{ each ./posts }}}
	{{{ if @first }}}
	<div component="category/posts" class="lastpost-item ps-2 text-xs d-flex gap-2 h-100">
		<a class="lastpost-avatar flex-shrink-0 text-decoration-none" href="{config.relative_path}/user/{./user.userslug}" aria-hidden="true" tabindex="-1">{{buildAvatar(./user, "32px", true)}}</a>
		<div class="d-flex flex-column gap-1 overflow-hidden">
			<a class="lastpost-topic text-reset fw-semibold text-truncate" href="{config.relative_path}/topic/{./topic.slug}{{{ if ./index }}}/{./index}{{{ end }}}" title="{./topic.title}">{./topic.title}</a>
			<div class="lastpost-meta text-muted text-truncate">
				<a class="lastpost-author text-reset" href="{config.relative_path}/user/{./user.userslug}">{{txDisplayname(./user)}}</a>
				<a class="permalink text-muted timeago" href="{config.relative_path}/topic/{./topic.slug}{{{ if ./index }}}/{./index}{{{ end }}}" title="{./timestampISO}" aria-label="{{tx("global:lastpost")}}"></a>
			</div>
		</div>
	</div>
	{{{ end }}}
	{{{ end }}}

	{{{ if !./posts.length }}}
	<div component="category/posts" class="ps-2">
		<div class="post-content overflow-hidden text-xs">
			{{tx("category:no-new-posts")}}
		</div>
	</div>
	{{{ end }}}
</div>
