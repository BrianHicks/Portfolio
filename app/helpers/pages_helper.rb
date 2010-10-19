module PagesHelper
  def title(string = nil)
    separator = "|"
    title = "Brian Hicks"
    if string.nil?
      title
    else
      "#{title} #{separator} #{string}"
    end
  end
end
