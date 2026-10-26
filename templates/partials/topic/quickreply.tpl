{{{ if (privileges.topics:create || privileges.topics:reply) }}}
<div component="topic/quickreply/container" class="quick-reply post-card">
	<div class="post-author">
		<a class="post-author-avatar d-inline-block position-relative text-decoration-none" href="{{{ if loggedInUser.userslug }}}{config.relative_path}/user/{loggedInUser.userslug}{{{ else }}}#{{{ end }}}" data-uid="{loggedInUser.uid}">
			{{buildAvatar(loggedInUser, "64px", false, "", "user/picture")}}
		</a>
		<div class="post-author-name">
			<span class="text-truncate">{loggedInUser.username}</span>
		</div>
	</div>
	<form class="post-container d-flex flex-column gap-2" method="post" action="{config.relative_path}/compose">
		<input type="hidden" name="tid" value="{tid}" />
		<input type="hidden" name="_csrf" value="{config.csrf_token}" />
		<div class="quickreply-message position-relative">
			<textarea rows="4" name="content" component="topic/quickreply/text" class="form-control mousetrap" placeholder="{{tx("modules:composer.textarea.placeholder")}}"></textarea>
			<div class="imagedrop"><div>{{tx("topic:composer.drag-and-drop-images")}}</div></div>
		</div>
		<div class="d-flex justify-content-end align-items-center gap-2">
			<div class="me-auto hidden" component="topic/quickreply/category-selector">
				<!-- IMPORT partials/category/selector-dropdown-left.tpl -->
			</div>
			<button type="button" component="topic/quickreply/upload/button" class="btn btn-ghost btn-sm" title="{{tx("global:upload")}}"><i class="fa fa-upload"></i></button>
			<button type="button" component="topic/quickreply/expand" class="btn btn-ghost btn-sm" title="{{tx("topic:open-composer")}}"><i class="fa fa-expand"></i></button>
			<button type="submit" component="topic/quickreply/button" class="btn btn-sm btn-primary">
				{{{ if tid }}}{{tx("topic:post-quick-reply")}}{{{ else }}}{{tx("topic:post-quick-create")}}{{{ end }}}
			</button>
		</div>
	</form>
	<form class="d-none" component="topic/quickreply/upload" method="post" enctype="multipart/form-data">
		<input type="file" name="files[]" multiple class="hidden"/>
	</form>
</div>
{{{ end }}}
