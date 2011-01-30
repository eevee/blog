<%page args="post, show_title=True"/>

<%
import re
post_id = re.sub("[ ?]","-",post.title.lower()) %>

% if show_title:
<a class="blog_post_title" name="${post.title}" />
<h1 class="blog_post_title"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h1>
% endif
<%
   if post.draft:
       # For drafts, we don't write to the category dirs, so just write the categories as text
       category_links = [category.name for category in post.categories]
   else:
       category_links = [
            "<a href='%s'>%s</a>" % (category.path, category.name)
            for category in post.categories
        ]
%>
<div class="doorhanger">
    ${post.date.strftime("%B %d, %Y at %I:%M %p")}
    % if category_links:
    in ${", ".join(category_links)}
    % endif

    % if bf.config.blog.disqus.enabled:
    <a href="${post.permalink}#disqus_thread">View comments</a>
    % endif
</div>
<div class="prose">
    ${self.post_prose(post)}
</div>

<%def name="post_prose(post)">
  ${post.content}
</%def>
