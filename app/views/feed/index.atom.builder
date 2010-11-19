atom_feed do |feed|
  feed.title(@title)
  
  feed.updated(@updated)
  
  for pi in @portfolio_items
    next if pi.updated_at.blank?
    feed.entry(pi) do |entry|
      entry.title(pi.title)
      entry.content(pi.content, :type => 'html')
      
      entry.author "Brian Hicks"
    end
  end
end
