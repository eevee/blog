<div id="sidebar">
  <div id="contact">
  <h3>Contact</h3>
  Blogofile is written by <a href="http://www.enigmacurry.com" rel="external" target="_blank">Ryan McGuire</a>
  </div>
  <div id="blog_post_list">
  <h3>Latest blog posts</h3>
  <ul>
% for post in bf.config.blog.posts[:5]:
    <li><a href="${post.path}">${post.title}</a></li>
% endfor
  </ul>
  </div>

  <div id="categories">
    <h3>Categories</h3>
    <ul>
% for category, num_posts in bf.config.blog.all_categories:
     <li><a href="${category.path}">${category}</a> (<a href="${category.path}/feed">rss</a>) (${num_posts})</li>
% endfor
    </ul>
  </div>

  <div id="archives">
    <h3>Archives</h3>
    <ul>
% for link, name, num_posts in bf.config.blog.archive_links:
      <li><a href="${bf.util.site_path_helper(bf.config.blog.path,link)}/1" title="${name}">${name}</a>&nbsp;(${num_posts})</li>
% endfor
    </ul>
  </div>
</div>
