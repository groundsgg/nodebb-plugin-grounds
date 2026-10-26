<div class="grounds-actions d-none d-lg-flex align-items-center gap-1 flex-shrink-0">
	{{{ if (config.searchEnabled && user.privileges.search:content) }}}
	<div component="sidebar/search" class="dropdown">
		<button type="button" class="grounds-icon" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="{{tx("global:search")}}" title="{{tx("global:search")}}">
			<i class="fa fa-fw fa-search"></i>
		</button>
		<div class="search-dropdown dropdown-menu dropdown-menu-end p-2">
			<form component="search/form" class="d-flex justify-content-end align-items-center" role="search" method="GET">
				<div component="search/fields" class="w-100">
					<div class="d-flex gap-1">
						<input autocomplete="off" type="text" class="form-control" placeholder="{{tx("global:search")}}" name="query" value="" aria-label="{{tx("search:type-to-search")}}">
						<a class="btn btn-ghost advanced-search-link p-2" href="{config.relative_path}/search" title="{{tx("search:advanced-search")}}">
							<i class="fa fa-gears text-muted"></i>
						</a>
					</div>
					<div id="quick-search-container" class="quick-search-container d-block mt-2 hidden">
						<div class="form-check filter-category mb-2 ms-2">
							<input class="form-check-input" type="checkbox" checked>
							<label class="form-check-label name text-sm"></label>
						</div>
						<div class="text-center loading-indicator"><i class="fa fa-spinner fa-spin"></i></div>
						<div class="quick-search-results-container"></div>
					</div>
					<button type="submit" class="btn btn-outline-secondary hide">{{tx("global:search")}}</button>
				</div>
			</form>
		</div>
	</div>
	{{{ end }}}

	{{{ if config.loggedIn }}}
	{{{ if groundsCanPost }}}
	<button type="button" component="grounds/new-topic" class="grounds-icon" aria-label="{{tx("category:new-topic-button")}}" title="{{tx("category:new-topic-button")}}">
		<i class="fa fa-fw fa-plus"></i>
	</button>
	{{{ end }}}

	<!-- IMPORT partials/grounds/drafts.tpl -->
	<!-- IMPORT partials/grounds/notifications.tpl -->
	<!-- IMPORT partials/sidebar/user-menu.tpl -->
	{{{ else }}}
	<div class="dropdown">
		<button type="button" class="grounds-icon" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="{{tx("global:header.navigation")}}" title="{{tx("global:header.navigation")}}">
			<i class="fa fa-fw fa-bars"></i>
		</button>
		<ul class="grounds-menu dropdown-menu dropdown-menu-end">
			<!-- IMPORT partials/grounds/forum-nav.tpl -->
		</ul>
	</div>
	<a class="grounds-sign-in btn btn-sm" href="{relative_path}/login">{{tx("global:login")}}</a>
	{{{ end }}}
</div>
