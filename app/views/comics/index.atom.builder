atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @comics.each do |comic|
    next if comic.updated_at.blank?

    feed.entry( comic ) do |entry|
      entry.url comic_url(comic)
      entry.title comic.title
      entry.content comic.body, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(comic.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.author do |author|
        author.name "Emma"
      end
    end
  end
end