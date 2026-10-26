<div component="sidebar/drafts" class="dropdown grounds-drafts">
	<button type="button" class="grounds-icon" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="{{tx("global:header.drafts")}}" title="{{tx("global:header.drafts")}}">
		<i component="drafts/icon" class="fa fa-fw fa-pen-to-square"></i>
		<span component="drafts/count" class="grounds-count hidden">0</span>
	</button>
	<ul class="drafts-dropdown dropdown-menu dropdown-menu-end p-1">
		<li>
			<div component="drafts/list" class="list-container draft-list list-unstyled d-flex flex-column overscroll-behavior-contain gap-1 pe-1 ghost-scrollbar">
				<div class="dropdown-item rounded-1 p-2 d-flex gap-2 placeholder-wave">
					<div class="d-flex flex-grow-1 flex-column w-100">
						<div class="text-xs placeholder col-3">&nbsp;</div>
						<div class="text-sm placeholder col-11">&nbsp;</div>
						<div class="text-xs placeholder col-4">&nbsp;</div>
					</div>
				</div>
				<div class="hidden no-drafts text-center p-4 d-flex flex-column">
					<div class="p-4"><i class="fa-solid fa-wind fs-2 text-muted"></i></div>
					<div class="text-xs fw-semibold text-muted">{{tx("modules:composer.no-drafts")}}</div>
				</div>
				<div class="draft-item-container"></div>
			</div>
		</li>
	</ul>
</div>
