#Give every paragraph an id if it doesn't have one.
#This allows you to reference individual paragraphs by permalink:
# http://yourblog.com/blog/this-is-a-post#p5

# Modified to also give headers their own ids for permalinking purposes,
# because that seems particularly more useful.

from lxml import etree
from pyquery import PyQuery as pq

import re

def run(content):
    # pyquery needs this wrapped in some tag, otherwise it loses the top-most
    # tag when .html() is run, so just wrap in <xml>.
    d = pq("<xml>%s</xml>" % content)

    # Paragraphs get numbers
    p_num = 1
    for p in d("p"):
        if not p.attrib.has_key("id"):
            p.set('id',"p"+str(p_num))
        p_num += 1

    # Headers get real permalink-ish names
    h_num = 1
    for h in d("h1, h2, h3"):
        if h.attrib.has_key("id"):
            continue

        id = re.sub(u'[^a-zA-Z0-9]+', u'-',
            etree.tostring(h, encoding=unicode, method='text'))
        id = id.lower().strip(u'-')

        # Default to a number
        if not id:
            id = "h%d" % h_num
            h_num += 1

        h.set('id', id)

        # Wrap the contents of the header tag with an anchor link
        link = etree.Element('a')
        link.set('href', '#' + id)
        # This moves nodes; no need to delete originals
        link[:] = h[:]
        link.text = h.text
        h.text = u''
        h.append(link)

    return d.html()
