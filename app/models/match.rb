class Match < ActiveRecord::Base
  belongs_to :enrolment
  validates :name, presence: true, length: { minimum: 3, maximum: 200 }
  validates :time, presence: true, uniqueness: true
  validates :rules, presence: true, length: { minimum: 10, maximum: 500 }

  def save_match(match_params)
    self.name = match_params[:name]
    self.time = Time.parse("#{match_params['time(1i)']}.-#{match_params['time(2i)']}-#{match_params['time(3i)']} #{match_params['time(4i)']}:#{match_params['time(5i)']}")
    self.rules = match_params[:rules]

    self.save
  end

  def permited_params(params)
    params.require(:match).permit(:name, :time, :rules)
  end
end
