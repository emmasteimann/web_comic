xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @COMIC_TITLE
    xml.description "An enlightening web comic..."
    xml.link comics_url

    for comic in @all_comics
      xml.item do
        xml.title comic.title
        xml.content comic.body, :type => 'html'
        xml.pubDate comic.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")
        xml.media(:content, :url => comic.image, :type => "image/jpeg")
        xml.link comic_url(comic)
        xml.guid comic_url(comic)
      end
    end
  end
end