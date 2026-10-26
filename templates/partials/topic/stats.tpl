{{{ if ./crossposts.length }}}
<span class="topic-stat position-relative">
	<span component="topic/crosspost-count" title="{formattedNumber(crossposts.length)}">{humanReadableNumber(crossposts.length)}</span>
	<span class="text-lowercase">{{tx("global:crossposts")}}</span>
	<a href="#" aria-label="{{tx("aria:show-crossposts")}}" id="show-crossposts" class="stretched-link"></a>
</span>
{{{ end }}}
<span class="topic-stat">
	<span component="topic/post-count" title="{formattedNumber(postcount)}">{humanReadableNumber(postcount)}</span>
	<span class="text-lowercase">{{tx("global:posts")}}</span>
</span>
<span class="topic-stat">
	<span title="{formattedNumber(postercount)}">{humanReadableNumber(postercount)}</span>
	<span class="text-lowercase">{{tx("global:posters")}}</span>
</span>
<span class="topic-stat">
	<span title="{formattedNumber(viewcount)}">{humanReadableNumber(viewcount)}</span>
	<span class="text-lowercase">{{tx("global:views")}}</span>
</span>
{{{ if ./followercount }}}
<span class="topic-stat">
	<span title="{formattedNumber(followercount)}">{humanReadableNumber(followercount)}</span>
	<span class="text-lowercase">{{tx("global:watching")}}</span>
</span>
{{{ end }}}
