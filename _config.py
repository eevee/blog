######################################################################
# This is the main Blogofile configuration file.
# www.Blogofile.com
#
# This file has the following ordered sections:
#  * Basic Settings
#  * Intermediate Settings
#  * Advanced Settings
#
#  You really only _need_ to change the Basic Settings.
######################################################################
import sys, os
import subprocess
import shutil
import shlex
import tempfile
import subprocess

import logging
logger = logging.getLogger("blogofile.config")

######################################################################
# Basic Settings
#  (almost all sites will want to configure these settings)
######################################################################
## site_url -- Your site's full URL
# Your "site" is the same thing as your _site directory.
#  If you're hosting a blogofile powered site as a subdirectory of a larger
#  non-blogofile site, then you would set the site_url to the full URL
#  including that subdirectory: "http://www.yoursite.com/path/to/blogofile-dir"
site.url         = "http://me.veekun.com"

#### Blog Settings ####
blog = controllers.blog

## blog_enabled -- Should the blog be enabled?
#  (You don't _have_ to use blogofile to build blogs)
blog.enabled = True

## blog_path -- Blog path.
#  This is the path of the blog relative to the site_url.
#  If your site_url is "http://www.yoursite.com/~ryan"
#  and you set blog_path to "/blog" your full blog URL would be
#  "http://www.yoursite.com/~ryan/blog"
#  Leave blank "" to set to the root of site_url
blog.path = "/blog"

## blog_name -- Your Blog's name.
# This is used repeatedly in default blog templates
blog.name        = "veekun: fuzzy notepad"

## blog_description -- A short one line description of the blog
# used in the RSS/Atom feeds.
blog.description = "a lot of words, sometimes of interest"

## blog_timezone -- the timezone that you normally write your blog posts from
blog.timezone    = "US/Pacific"

## blog_posts_per_page -- Blog posts per page
blog.posts_per_page = 10

# Automatic Permalink
# (If permalink is not defined in post article, it's generated
#  automatically based on the following format:)
# Available string replacements:
# :year, :month, :day -> post's date
# :title              -> post's title
# :uuid               -> sha hash based on title
# :filename           -> article's filename without suffix
blog.auto_permalink.enabled = True
# This is relative to site_url
blog.auto_permalink.path    = "/blog/:year/:month/:day/:title"

######################################################################
# Intermediate Settings
######################################################################
#### Disqus.com comment integration ####
blog.disqus.enabled = True
blog.disqus.name    = "veekun"

### Syntax highlighter ###
# You can change the style to any builtin Pygments style
# or, make your own: http://pygments.org/docs/styles
filters.syntax_highlight.style   = "murphy"
filters.syntax_highlight.css_dir = "/css"
filters.syntax_highlight.preload_styles = ["murphy","monokai"]
#### Custom blog index ####
# If you want to create your own index page at your blog root
# turn this on. Otherwise blogofile assumes you want the
# first X posts displayed instead
blog.custom_index = False

#Post excerpts
#If you want to generate excerpts of your posts in addition to the
#full post content turn this feature on
blog.post_excerpts.enabled     = True
blog.post_excerpts.word_length = 250
#Also, if you don't like the way the post excerpt is generated
#You can define a new function
#below called post_excerpt(content, num_words)

def post_excerpt(content, num_words):
    """Generate a post excerpt, better."""
    # Need a number of characters, not a number of words.  Five letters per
    # word, plus a space, is a good guess.
    # TODO Should HTML really count against this limit?  Ehh.
    import lxml.html
    num_characters = num_words * 6

    if len(content) <= num_characters:
        return content

    broken_html = content[:num_characters]
    fragment = lxml.html.fromstring(broken_html)

    # Insert an ellipsis at the end of the last node with text
    last_text_node = None
    last_tail_node = None
    # Need to find the last node with a tail, OR the last node with
    # text if it's later
    for node in fragment.iter():
        if node.tail:
            last_tail_node = node
            last_text_node = None
        elif node.text:
            last_text_node = node
            last_tail_node = None

    if last_text_node is not None:
        last_text_node.text += '...'
    if last_tail_node is not None:
        last_tail_node.tail += '...'

    # Serialize
    return lxml.html.tostring(fragment)

#### Blog pagination directory ####
# blogofile places extra pages of your blog or category in
# a secondary directory like the following:
# http://www.yourblog.com/blog_root/page/4
# http://www.yourblog.com/blog_root/category_1/page/4
# You can rename the "page" part here:
blog.pagination_dir = "page"

#### Blog category directory ####
# blogofile places extra pages of your or categories in
# a secondary directory like the following:
# http://www.yourblog.com/blog_root/category/your-topic/4
# You can rename the "category" part here:
blog.category_dir = "category"

######################################################################
# Advanced Settings
######################################################################
# These are the default ignore patterns for excluding files and dirs
# from the _site directory
# These can be strings or compiled patterns.
# Strings are assumed to be case insensitive.
site.file_ignore_patterns = [
    r".*([\/]|[\\])_.*",   #All files that start with an underscore
    r".*([\/]|[\\])#.*",   #Emacs temporary files
    r".*([\/]|[\\])\.#.*", #Emacs temporary files
    r".*~$]",              #Emacs temporary files
    r".*([\/]|[\\])\.git", #Git VCS dir
    r".*([\/]|[\\])\.hg",  #Mercurial VCS dir
    r".*([\/]|[\\])\.bzr", #Bazaar VCS dir
    r".*([\/]|[\\])\.svn", #Subversion VCS dir
    r".*([\/]|[\\])CVS"    #CVS dir
    ]

#### Default post filters ####
# If a post does not specify a filter chain, use the 
# following defaults based on the post file extension:
blog.post_default_filters = {
    "markdown": "syntax_highlight, markdown, paragraph_permalinks",
    "textile": "syntax_highlight, textile, paragraph_permalinks",
    "org": "syntax_highlight, org, paragraph_permalinks",
    "rst": "syntax_highlight, rst, paragraph_permalinks",
    "html": "syntax_highlight, paragraph_permalinks"
}


### Pre/Post build hooks:

def pre_build():
    # Compile CSS from SASS
    subprocess.call(['sass',
        '--scss',
        '--style', 'compressed',
        '--update', '_scss/site.scss:css/site.css',
    ])

def post_build():
    #Do whatever you want after the _site is built
    pass

#Build the example photo_gallery controller
controllers.photo_gallery.enabled = True
