<% import urlparse %>
<div id="header" onclick="location.href='${bf.util.site_path_helper()}';" style="cursor: pointer;">
  <div id="title">${bf.config.blog.name}</div>
  <div id="search">
    <form id="searchform" method="get" action="http://www.google.com/search">
      <input type="hidden" name="ie" value="UTF-8">
      <input type="hidden" name="oe" value="UTF-8">
      <input type="hidden" name="domains" value="${urlparse.urlparse(bf.config.site.url)[1]}">
      <input type="hidden" name="sitesearch" value="${urlparse.urlparse(bf.config.site.url)[1]}">
      <input name="q" id="q" size="20" placeholder="search" type="text">
    </form>
  </div>
</div>
<ul id="navbar">
    <li><a href="http://veekun.com/">← Return to veekun</a></li>
    <li><a href="/">Home</a></li>
    <li>
      <a href="${bf.config.util.site_path_helper(bf.config.blog.path)}">Blog ▾</a>
      <ul>
          % for post in bf.config.blog.posts[:5]:
          <li><a href="${post.path}">${post.title}</a></li>
          % endfor
      </ul>
    </li>
    <li>
        <a href="/todo">Blog categories ▾</a>
        <ul>
            % for category, num_posts in bf.config.blog.all_categories:
            <li>
                <a href="${category.path}">${category} (${num_posts})</a>
                <!--(<a href="${category.path}/feed">rss</a>)-->
            </li>
            % endfor
        </ul>
    </li>
    <li>
        <a href="/todo">Blog archives ▾</a>
        <ul>
            % for link, name, num_posts in bf.config.blog.archive_links:
            <li><a href="${bf.util.site_path_helper(bf.config.blog.path,link)}/1" title="${name}">${name} (${num_posts})</a></li>
% endfor
        </ul>
    </li>
</ul>
