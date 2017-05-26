class ScrapingDoctor < ActiveRecord::Base
  class << self
    def shonan
      agent = Mechanize.new
      page = agent.get("http://www.s-b-c.net/doctor/index_dr.html")
      frms = page.search("#doctor-bg-wh .frm")
      frms.each do |frm|
        name = frm.at(".name").inner_text
        kana = frm.at(".furi").inner_text.scan(/[\p{Han}\p{Hiragana}\p{Katakana}，．、。ー・]+/).join
        position = frm.at(".subtitle").inner_text if frm.at(".subtitle")
        profile_url = "http://www.s-b-c.net" + frm.at(".icons a")[:href]
        page = agent.get(profile_url)
        table = page.at(".dr-table")
        table_data = table.search("tr") if table
        career = ""
        if table_data
          table_data.each do |tr|
            career += tr.inner_text.gsub("\t", "")
          end
        end
        doctor = Doctor.where(name: name, career: career).first_or_initialize
        doctor.update(kana: kana, position: position)
        doctor.build_doctor_image.update(profile_url: profile_url) unless doctor.doctor_image.present?
      end
    end
  end
end
