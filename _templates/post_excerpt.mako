<%inherit file="post.mako" />
<%def name="post_prose(post)">
<div class="prose excerpt">
    ${post.excerpt}
</div>
% if post.excerpt != post.content:
<p><a href="${post.permalink}">(read the rest of this)</a></p>
% endif
</%def>
