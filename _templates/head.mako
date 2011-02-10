<%
    title_parts = []
    if title_in_page:
        title_parts.append(title_in_page)
    if breadcrumbs:
        for url, label in breadcrumbs:
            title_parts.append(label)
    title_parts.append(bf.config.blog.name)
%>\
<title>${u' - '.join(title_parts)}</title>
<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed')}" />
<link rel="alternate" type="application/atom+xml" title="Atom 1.0"
href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom')}" />

% for css_file in bf.config.filters.syntax_highlight.mod.css_files_written:
<link rel='stylesheet' href='${css_file}' type='text/css' />
% endfor
<link rel='stylesheet' href='/css/site.css' type='text/css' />
<link rel='stylesheet' href='/css/jquery.tweet.css' type='text/css' />

<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/js/site.js"></script>
