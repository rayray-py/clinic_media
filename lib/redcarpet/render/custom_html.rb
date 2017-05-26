class Redcarpet::Render::CustomHTML < Redcarpet::Render::HTML
  def header(text, header_level)
    if [2, 3].include?(header_level)
      %Q{<h#{header_level} class="article_index" id="#{text.downcase.gsub(/ |　|：|:/, "-")}">#{text}</h#{header_level}>}.html_safe
    else
      %Q{<h#{header_level}>#{text}</h#{header_level}>}.html_safe
    end
  end

  def postprocess(full_document)
    full_document.gsub(/\[clinic:(.+),(.+),(.+),(.+),(.+)\]/) do |match|
      id = $1
      name = $2
      treatment_name = $3
      treatment_price = $4
      site_url = $5
      "<div class='card'>
        <div class='card-content'>
          <div class='media'>
            <div class='media-left'>
              <span class='icon is-large is-text-primary'>
                <i class='fa fa-hospital-o'></i>
              </span>
            </div>
            <div class='media-content'>
              <a class='title' href=\"/clinics/#{id}\">#{name}</a>
            </div>
          </div>
          <hr>
          <div class='content'>
            <div style='display: flex; flex-wrap: wrap;'>
              <span class='is-marginless'>
                #{treatment_name}
              </span>
              <strong class='is-text-danger' style='margin-left: auto;'>
                #{treatment_price}円〜
              </strong>
            </div>
            <hr>
            <a target='_blank' class='button is-primary is-large' href=#{site_url} style='white-space: normal; width: 100%;'>#{name}の公式HPから予約する▶</a>
          </div>
        </div>
      </div>".html_safe
    end
  end
end
