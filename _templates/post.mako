<%page args="post, headerlevel=1"/>

<%
import re
post_id = re.sub("[ ?]","-",post.title.lower()) %>

<h${headerlevel} class="blog_post_title"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h${headerlevel}>
<div class="blog_post" id="${post_id}">
  <a class="blog_post_title" name="${post.title}" />
  <small>${post.date.strftime("%B %d, %Y at %I:%M %p")} | categories:
<%
   category_links = []
   for category in post.categories:
       if post.draft:
           #For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category.name)
       else:
           category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>
${", ".join(category_links)}
% if bf.config.blog.disqus.enabled:
 | <a href="${post.permalink}#disqus_thread">View Comments</a>
% endif
  </small>
</div>
<div class="prose">
    ${self.post_prose(post)}
</div>

<%def name="post_prose(post)">
  ${post.content}
</%def>
