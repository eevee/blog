<%inherit file="site.mako" />

% if category_title:
<h1>${category_title}</h1>
% endif

% for post in posts:
  <%include file="post.mako" args="post=post, headerlevel=2" />
% if bf.config.blog.disqus.enabled:
  <div class="after_post"><a href="${post.permalink}#disqus_thread">Read and Post Comments</a></div>
% endif
% endfor

% if prev_link:
 <a href="${prev_link}">« Previous Page</a>
% endif
% if prev_link and next_link:
  --  
% endif
% if next_link:
 <a href="${next_link}">Next Page »</a>
% endif
