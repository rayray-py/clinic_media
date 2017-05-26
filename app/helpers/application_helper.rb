module ApplicationHelper
  @@markdown = Redcarpet::Markdown.new( Redcarpet::Render::CustomHTML,
    autolink: false,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true
  )

  def markdown(content)
    @@markdown.render(content).html_safe unless content.nil?
  end
end
