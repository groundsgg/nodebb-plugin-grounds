<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>
<div class="row flex-fill py-2">
	<div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
		{{{ if pagination.pages.length }}}
		<div><!-- IMPORT partials/category/selector-dropdown-left.tpl --></div>
		{{{ end }}}
		{{{ each sections }}}
		<section class="board-section">
			{{{ if ./head }}}
			<div class="board-section-head" data-cid="{./head.cid}">
				<h2 class="board-section-title">
					{{{ if ./head.isSection }}}
					{{tx(./head.name)}}
					{{{ else }}}
					<a class="text-reset" href="{{{ if ./head.link }}}{./head.link}{{{ else }}}{config.relative_path}/category/{./head.slug}{{{ end }}}">{{tx(./head.name)}}</a>
					{{{ end }}}
				</h2>
				{{{ if ./head.descriptionParsed }}}
				<div class="board-section-description">{{./head.descriptionParsed}}</div>
				{{{ end }}}
			</div>
			{{{ end }}}
			<ul class="categories-list list-unstyled" itemscope itemtype="http://www.schema.org/ItemList">
				{{{ each ./rows }}}
				<!-- IMPORT partials/categories/item.tpl -->
				{{{ end }}}
			</ul>
		</section>
		{{{ end }}}

		<!-- IMPORT partials/paginator.tpl -->
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{ each widgets.sidebar }}}
		{{widgets.sidebar.html}}
		{{{ end }}}
	</div>
</div>
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>
