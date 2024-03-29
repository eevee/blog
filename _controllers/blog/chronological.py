# Write all the blog posts in reverse chronological order
import os
from blogofile.cache import bf

blog = bf.config.controllers.blog

def run():
    write_blog_chron(posts=blog.posts,
                     root=blog.pagination_dir.lstrip("/"))
    write_blog_first_page()

def write_blog_chron(posts,root):
    page_num = 1
    post_num = 0
    html = []
    while len(posts) > post_num:
        #Write the pages, num_per_page posts per page:
        page_posts = posts[post_num:post_num+blog.posts_per_page]
        post_num += blog.posts_per_page
        if page_num > 1:
            prev_link = "../" + str(page_num - 1)
        else:
            prev_link = None
        if len(posts) > post_num:
            next_link = "../" + str(page_num + 1)
        else:
            next_link = None
        page_dir = bf.util.path_join(blog.path,root,str(page_num))
        fn = bf.util.path_join(page_dir,"index.html")
        bf.writer.materialize_template("chronological.mako", fn,
            { "posts":page_posts,
              "next_link":next_link,
              "prev_link":prev_link,
              "breadcrumbs": [
                  (blog.path, "Blog"),
              ],
              "title_in_page": posts[0].date.strftime("%B %Y"),
        })
        page_num += 1
        
def write_blog_first_page():
    if not blog.custom_index:
        page_posts = blog.posts[:blog.posts_per_page]
        path = bf.util.path_join(blog.path,"index.html")
        blog.logger.info("Writing blog index page: "+path)
        if len(blog.posts) > blog.posts_per_page:
            next_link = bf.util.site_path_helper(blog.path,blog.pagination_dir+"/2")
        else:
            next_link = None
        bf.writer.materialize_template("chronological.mako", path, {
            "posts": page_posts,
            "next_link": next_link,
            "prev_link": None,
            "title_in_page": bf.config.blog.name,
        })
