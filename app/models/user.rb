class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :authentications

  def self.find_by_provider_and_uid(provider, uid)
	where(provider: provider, uid: uid).first
  end
  
  def self.create_with_omniauth(auth)
	create! do |user|
	  user.provider = auth["provider"]
	  user.uid = auth["uid"]
	  user.name = auth["info"]["name"]
	end
  end  
end
