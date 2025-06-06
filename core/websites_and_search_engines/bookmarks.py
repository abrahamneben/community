import xml.etree.ElementTree as ET
from urllib import request, error
import ssl
from pathlib import Path

BOOKMARKS_URL = "https://macmini.thinlens.net/feeds/81a4d5b905cb4ce79b8bab497f45567483aeaaa8/all"

def update_bookmarks():
    """Load bookmarks from linkding"""

    context = ssl._create_unverified_context()
    req = request.Request(BOOKMARKS_URL)

    try:
        response = request.urlopen(req, context=context)
    except error.URLError:
        print('Unable to update bookmarks')
        return

    xml_data = response.read().decode('utf-8')

    root = ET.fromstring(xml_data)
    channel = root.find('channel')

    bookmarks_file = Path(__file__).parent / "website.talon-list"
    with open(bookmarks_file, "w") as f:
        f.write("list: user.website\n-\n")

        for item in channel.findall('item'):
            title = item.find('title').text
            link = item.find('link').text
            f.write(f"{title}: {link}\n")



