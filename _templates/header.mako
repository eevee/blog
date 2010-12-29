<% import urlparse %>
<div id="header" onclick="location.href='${bf.util.site_path_helper()}';" style="cursor: pointer;">
  <div id="title">${bf.config.blog.name}</div>
  <div id="search">
    <form id="searchform" method="get" action="http://www.google.com/search">
      <input type="hidden" name="ie" value="UTF-8">
      <input type="hidden" name="oe" value="UTF-8">
      <input type="hidden" name="domains" value="${urlparse.urlparse(bf.config.site.url)[1]}">
      <input type="hidden" name="sitesearch" value="${urlparse.urlparse(bf.config.site.url)[1]}">
      <input name="q" id="q" size="20" value="search in blog..." onfocus="if(this.value==this.defaultValue) this.value='';" type="text">
    </form>
  </div>
</div>
<ul id="navbar">
  <li>Blog</li>
  <li><a href="/">Back to veekun</a></li>
  <li><a href="/">Home</a></li>
  <li><a href="${bf.util.site_path_helper('/documentation')}">Documentation</a></li>
  <li><a href="${bf.util.site_path_helper('/community')}">Community</a></li>
  <li><a href="${bf.config.util.site_path_helper(bf.config.blog.path)}">Blog</a></li>
</ul>
