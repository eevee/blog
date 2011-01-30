<%inherit file="base.mako" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
  </head>
  <body>
    ${self.header()}
    % if breadcrumbs:
    <ul id="breadcrumbs">
        % for url, label in breadcrumbs:
        <li><a href="${url}">${label}</a></li>
        % endfor
    </ul>
    % endif
    <div id="main">
      <div id="content">
        % if title_in_page:
        <h1>${title_in_page}</h1>
        % endif
        ${next.body()}
      </div> <!-- End Content -->
      ${self.sidebar()}
    </div>
    ${self.footer()}
  </body>
</html>
<%def name="head()">
  <%include file="head.mako" />
</%def>
<%def name="header()">
  <%include file="header.mako" />
</%def>
<%def name="footer()">
  <%include file="footer.mako" />
</%def>
<%def name="sidebar()">
  <%include file="sidebar.mako"  args="posts=posts" />
</%def>
