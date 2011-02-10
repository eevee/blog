<%inherit file="site.mako" />
<%include file="post.mako" args="post=post, show_title=False" />
% if bf.config.blog.disqus.enabled:
<div id="disqus_thread"></div>
<script type="text/javascript">
    var disqus_url = "${post.permalink}";
    var disqus_title = "${post.title.replace("\\", "\\\\").replace('"', '\\"')}";
</script>
<script type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/embed.js"></script>
<noscript>
    <p>Apologies, but I'm using <a href="http://disqus.com/">Disqus</a> comments, which rely on JavaScript.</p>
    <p>If can't or would prefer not to run their code, you can always <a href="mailto:eevee.fuzzynotepad@veekun.com">email me</a> with your feedback.</p>
</noscript>
% endif
