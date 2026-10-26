<div component="notifications" class="dropdown notifications">
	<button type="button" class="grounds-icon" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-haspopup="true" aria-expanded="false" aria-label="{{tx("global:header.notifications")}}" title="{{tx("global:header.notifications")}}">
		<i component="notifications/icon" class="fa fa-fw {{{ if unreadCount.notification }}}fa-bell{{{ else }}}fa-bell-o{{{ end }}}" data-content="{unreadCount.notification}"></i>
		<span component="notifications/count" class="grounds-count {{{ if !unreadCount.notification }}}hidden{{{ end }}}">{unreadCount.notification}</span>
	</button>
	<ul class="notifications-dropdown dropdown-menu dropdown-menu-end p-1">
		{{{ if !config.hideReadNotifications }}}
		<li class="d-flex gap-1 align-items-center">
			<button type="button" class="btn btn-ghost btn-sm ff-secondary {{{ if !unreadCount.notification }}}active{{{ end }}} px-3" data-filter="all">{{tx("notifications:all")}}</button>
			<button type="button" class="btn btn-ghost btn-sm ff-secondary d-flex align-items-center gap-2 {{{ if unreadCount.notification }}}active{{{ end }}}" data-filter="unread">{{tx("unread:title")}} <span component="notifications/count" class="{{{ if !unreadCount.notification }}}hidden{{{ end }}}">{unreadCount.notification}</span></button>
		</li>
		<li class="dropdown-divider"></li>
		{{{ end }}}
		<li>
			<div component="notifications/list" class="list-container notification-list overscroll-behavior-contain pe-1 ff-base ghost-scrollbar">
				<div class="mb-2 p-1">
					<div class="d-flex gap-2 flex-grow-1 placeholder-wave">
						<div class="placeholder" style="width: 32px; height: 32px;"></div>
						<div class="flex-grow-1 text-sm">
							<span class="placeholder placeholder-sm col-4"></span>
							<span class="placeholder placeholder-sm col-6"></span>
							<span class="placeholder placeholder-sm col-5"></span>
						</div>
					</div>
				</div>
			</div>
		</li>
		<li class="dropdown-divider"></li>
		<li>
			<div class="d-flex justify-content-center gap-1 flex-wrap">
				<a role="button" href="#" class="btn btn-sm btn-light mark-all-read flex-fill text-nowrap text-truncate ff-secondary"><i class="fa fa-check-double"></i> {{tx("notifications:mark-all-read")}}</a>
				<a class="btn btn-sm btn-primary flex-fill text-nowrap text-truncate ff-secondary" href="{relative_path}/notifications"><i class="fa fa-list"></i> {{tx("notifications:see-all")}}</a>
			</div>
		</li>
	</ul>
</div>
