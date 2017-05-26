class Scraping < ActiveRecord::Base
  class << self
    def scraping_clinics
      root_page = "https://nicoly.jp"
      clinic_page = root_page + "/clinic"
      agent = Mechanize.new
      agent.user_agent_alias = 'Windows Mozilla'
      page = agent.get(clinic_page)
      area_lists = page.search('.area-map-box ul.area-box')
      url_lists = []
      area_lists.each do |area|
        lists = area.search('li a')
        lists.each_with_index do |a, i|
          url_lists << a[:href]
        end
      end
      url_lists.each do |url|
        page = agent.get(root_page + url)
        get_city(page)
      end
    end

    def get_city(page)
      # 県取得
      prefecture_name = page.at('header .site-header .breadcrumb li:last').inner_text
      prefecture = Prefecture.find_by(name: prefecture_name)

      #市取得
      lists = page.search('.main-column-1 .contents.u-mt20 ul li')
      url_lists = []
      lists.each do |li|
        city_name = li.inner_text.gsub(/\((.+?)\)/, "")
        city = prefecture.cities.where(name: city_name).first_or_create
        get_clinic_url("https://nicoly.jp" + li.at('a')[:href]) if li.at('a').present?
      end
    end

    def get_clinic_url(url)
      agent = Mechanize.new
      page = agent.get(url)
      # 市取得
      city_name = page.at('header .site-header .breadcrumb li:last').inner_text
      city = City.find_by(name: city_name)

      while true
        page = agent.get(url)
        lists = page.search('.main-column-1 .contents.u-pr10 .col-12 h3.name > a')
        lists.each do |a|
          if a.parent.next.present?
            name = a.parent.next.inner_text
            group = Group.where(name: name).first_or_create
          end
          clinic_page = agent.get("https://nicoly.jp" + a[:href])
          group.present? ? get_clinic_grouped(clinic_page, city, group) : get_clinic(clinic_page, city)
        end

        if page.at('.pager-btn')
          if page.at('.pager-btn:last a').inner_text == "次へ"
            url = "https://nicoly.jp" + page.at('.pager-btn:last a')[:href]
          else
            break
          end
        else
          break
        end
      end
    end

    def get_clinic(page, city)
      clinic_name = page.at('tbody tr td').inner_text
      clinic = city.clinics.where(name: clinic_name).first_or_initialize
      tabel_rules = page.search('tbody tr')
      tabel_rules.each do |tr|
        case tr.at('th').inner_text
        when "医院名"
          clinic.name = tr.at('td').inner_text
        when "電話番号"
          clinic.phone_number = tr.at('td').inner_text.gsub("\n※お問い合わせの際は「ニコリーを見た」とお伝えいただければ幸いです。", "")
        when "住所"
          /\n/ =~ tr.at('td').inner_text
          clinic.address = $'
          clinic.postal_code = $`.gsub("〒", "")
        when "交通手段"
          clinic.transportation = tr.at('td').inner_text
        when "診療時間"
          clinic.office_hours = tr.at('td').inner_text
        when "休業日"
          clinic.holiday = tr.at('td').inner_text
        when "予約方法"
          clinic.reservation = tr.at('td').inner_text
        when "クレジットカード"
          clinic.credit_card = tr.at('td').inner_text
        when "メディカルローン"
          clinic.medical_loan = 1
        when "公式サイト"
          clinic.site_url = tr.at('td a')[:href]
        end
      end
      clinic.save
    end

    def get_clinic_grouped(page, city, group)
      clinic_name = page.at('tbody tr td').inner_text
      clinic = city.clinics.where(name: clinic_name).first_or_initialize
      group.clinics << clinic unless clinic.persisted?
      tabel_rules = page.search('tbody tr')
      tabel_rules.each do |tr|
        case tr.at('th').inner_text
        when "医院名"
          clinic.name = tr.at('td').inner_text
        when "電話番号"
          clinic.phone_number = tr.at('td').inner_text.gsub("\n※お問い合わせの際は「ニコリーを見た」とお伝えいただければ幸いです。", "")
        when "住所"
          /\n/ =~ tr.at('td').inner_text
          clinic.address = $'
          clinic.postal_code = $`.gsub("〒", "")
        when "交通手段"
          clinic.transportation = tr.at('td').inner_text
        when "診療時間"
          clinic.office_hours = tr.at('td').inner_text
        when "休業日"
          clinic.holiday = tr.at('td').inner_text
        when "予約方法"
          clinic.reservation = tr.at('td').inner_text
        when "クレジットカード"
          clinic.credit_card = tr.at('td').inner_text
        when "メディカルローン"
          clinic.medical_loan = 1
        when "公式サイト"
          clinic.site_url = tr.at('td a')[:href]
        end
      end
      clinic.save
    end

    def convert_url
      affiliate_url_to_root("affiliate")
      affiliate_url_to_root("accesstrade")
      affiliate_url_to_root("a8.net")
    end

    def affiliate_url_to_root(word)
      Clinic.where("site_url like '%" + word + "%'").map{|clinic|
        p clinic
        clinic.site_url = ""
        clinic.save
      }
    end
  end
end
