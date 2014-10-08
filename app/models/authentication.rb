class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid
  belongs_to :user

  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.create_with_omniauth(auth , user)
    create! do |authentication|
      authentication.provider = auth['provider']
      authentication.uid = auth['uid']
      authentication.user_id = user.id
    end
  end
end
