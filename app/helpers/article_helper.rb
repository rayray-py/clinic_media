module ArticleHelper
  def markdown_editor(form, property)
    helper = ActionView::Base.new
    code = form.text_area(property, id: "input_article_content", class: 'textarea', rows: "40", onKeyUp: "countLength(value, 'textlength');")
    code.gsub!(/">/, '" v-model="input" debounce="100" >')
    code.html_safe
  end

  def article_index(article_content)
    Nokogiri::HTML( markdown(article_content) ).css('.article_index').map{ |h| {tag_name: h.name, text: h.inner_text} }
  end
end
