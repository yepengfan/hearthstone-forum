class Enrolment < ActiveRecord::Base
  has_many :matches
  # validate account with Chinese, English and Korean
  validates :account, presence: true, length: { minimum: 8, maximum: 20 }, format: { with: /([A-Za-z\u4e00-\u9fa5\u2E80-\u9FFF\uac00-\ud7ff]{3,12}#\d{4,10})/ }

  def export_enrolment(m_id)
    list = Enrolment.where(:match_id => m_id)
    output = File.open("./private/enrol_list.csv", "w")
    list.each do |item|
      output << "#{item.account}\n"
    end

    output.close
  end
end
