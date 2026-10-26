<div class="dropdown usermenu">
	<button type="button" component="header/avatar" class="grounds-user" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="{{tx("user:user-menu")}}">
		{{buildAvatar(user, "28px", true)}}
		{{{ each user.selectedGroups }}}
		<span class="badge rounded-1 text-uppercase" data-rank="{./slug}" style="color: {./textColor}; background-color: {./labelColor};"><span class="badge-text">{./userTitle}</span></span>
		{{{ end }}}
		<span class="grounds-user-name" component="header/username">{user.username}</span>
	</button>
	<ul component="header/usercontrol" class="grounds-menu user-dropdown dropdown-menu dropdown-menu-end overscroll-behavior-contain">
		<li>
			<a class="dropdown-item" component="header/profilelink" href="{relative_path}/user/{user.userslug}">
				<i class="fa fa-fw fa-user"></i><span>{{tx("user:profile")}}</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item" component="header/profilelink/edit" href="{relative_path}/user/{user.userslug}/edit">
				<i class="fa fa-fw fa-edit"></i><span>{{tx("user:edit-profile")}}</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item" component="header/profilelink/settings" href="{relative_path}/user/{user.userslug}/settings">
				<i class="fa fa-fw fa-gear"></i><span>{{tx("user:settings")}}</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item" href="{relative_path}/notifications">
				<i class="fa fa-fw fa-bell"></i><span>{{tx("global:header.notifications")}}</span>
				<span component="notifications/count" class="grounds-menu-count {{{ if !unreadCount.notification }}}hidden{{{ end }}}">{unreadCount.notification}</span>
			</a>
		</li>
		{{{ if showModMenu }}}
		<li>
			<a class="dropdown-item" href="{relative_path}/flags">
				<i class="fa fa-fw fa-flag"></i><span>{{tx("pages:flagged-content")}}</span>
			</a>
		</li>
		{{{ end }}}
		{{{ if (showModMenu || postQueueEnabled) }}}
		<li>
			<a class="dropdown-item" href="{relative_path}/post-queue">
				<i class="fa fa-fw fa-list-alt"></i><span>{{tx("pages:post-queue")}}</span>
			</a>
		</li>
		{{{ end }}}
		<li role="presentation" class="dropdown-divider"></li>
		<!-- IMPORT partials/grounds/forum-nav.tpl -->
		<li role="presentation" class="dropdown-divider"></li>
		<li component="user/logout">
			<form method="post" action="{relative_path}/logout">
				<input type="hidden" name="_csrf" value="{config.csrf_token}">
				<input type="hidden" name="noscript" value="true">
				<button type="submit" class="dropdown-item">
					<i class="fa fa-fw fa-sign-out"></i><span>{{tx("global:logout")}}</span>
				</button>
			</form>
		</li>
	</ul>
</div>
