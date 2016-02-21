module ApplicationHelper
  def header(text)
    content_for(:header) { text.to_s }
  end

  def featured(text)
    content_for(:featured) { text.to_s }
  end

  def default_title
    'Le Socialist'
  end

  def default_meta_description
  end

  def copyright
    'Le Socialist Inc.'
  end

  def meta_description(description)
    return '' if description.blank?
    description = strip_tags(description).split[0...80].join(' ')
    content_for(:meta_description) { "#{description}" }
  end

  def title(page_title)
    content_for(:title) { "#{page_title} : #{default_title}" }
  end
end
