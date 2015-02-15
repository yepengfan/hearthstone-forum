class Enrolment < ActiveRecord::Base
  has_many :matches
  # validate account with Chinese, English and Korean
  validates :account, :presence => { :message => "canot be blank!!!"},
                      :length => { :within => 6..20, :message => "must be realistic!" },
                      :format => { with: /([A-Za-z\u4e00-\u9fa5\u2E80-\u9FFF\uac00-\ud7ff]{3,12}#\d{4,10})/, :message => "format should be like [Account#BattleTag] !!!" }
  validate :unique_enrolment_for_matches

  def unique_enrolment_for_matches
    result = Enrolment.where(account: self.account, match_id: self.match_id).first

    if result
      errors.add(:enrolment, " account has already enroled!!!")
    end
  end

  def export_enrolment(m_id)
    list = Enrolment.where(:match_id => m_id)
    output = File.open("./private/enrol_list.csv", "w")
    list.each do |item|
      output << "#{item.account}\n"
    end

    output.close
  end

  def permited_params(params)
    params.require(:enrolment).permit(:account, :match_id)
  end
end
