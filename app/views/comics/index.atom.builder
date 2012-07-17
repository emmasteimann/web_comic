atom_feed :language => 'en-US' do |feed|
  feed.title @COMIC_TITLE
  feed.updated @updated
  # binding.pry
  @all_comics.each do |comic|
    next if comic.updated_at.blank?

    feed.entry( comic ) do |entry|
      entry.url comic_url(comic)
      entry.title comic.title
      entry.content comic.body, :type => 'html'
      entry.link comic_url(comic)
      entry.guid comic_url(comic)
      # the strftime is needed to work with Google Reader.
      entry.updated(comic.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.media(:content, :url => comic.image, :type => "image/jpeg")
      entry.author do |author|
        author.name "Emma Steimann"
      end
    end
  end
end