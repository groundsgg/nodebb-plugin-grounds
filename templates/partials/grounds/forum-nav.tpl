<li><h6 class="dropdown-header">{{tx("global:header.navigation")}}</h6></li>
<li>
	<ul id="main-nav" class="list-unstyled">
		{{{ each navigation }}}
		{{{ if displayMenuItem(@root, @index) }}}
		<li class="nav-item {./class}">
			<a class="dropdown-item navigation-link" href="{{{ if ./dropdown }}}#{{{ else }}}{./route}{{{ end }}}" {{{ if ./id }}}id="{./id}"{{{ end }}}{{{ if ./targetBlank }}} target="_blank"{{{ end }}}>
				{{{ if ./iconClass }}}<i class="fa fa-fw {./iconClass}" data-content="{./content}"></i>{{{ end }}}
				<span>{{tx(./text)}}</span>
				<span component="navigation/count" class="grounds-menu-count {{{ if !./content }}}hidden{{{ end }}}">{./content}</span>
			</a>
			{{{ if ./dropdown }}}
			<ul class="list-unstyled ps-4">
				{{./dropdownContent}}
			</ul>
			{{{ end }}}
		</li>
		{{{ end }}}
		{{{ end }}}
	</ul>
</li>
