xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @COMIC_TITLE
    xml.description "An enlightening web comic..."
    xml.link comics_url

    for comic in @all_comics
      xml.item do
        xml.title comic.title
        xml.description comic.body, :type => 'html'
        xml.pubDate comic.updated_at
        xml.image do
          xml.url comic.image
        end
        xml.link comic_url(comic)
        xml.guid comic_url(comic)
      end
    end
  end
end