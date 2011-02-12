<%inherit file="_templates/site.mako" />

<h1>fuzzy notepad</h1>

<p>Greetings, weary traveler.  I'm <a href="http://veekun.com/about">Eevee</a> and this is some kind of personal website.</p>

<p>I'm not sure what all will go here, yet.  So far, it's just my blog:</p>

% for post in bf.config.controllers.blog.posts[:bf.config.blog.posts_per_page]:
<%include file="post_excerpt.mako" args="post=post" />
% endfor
