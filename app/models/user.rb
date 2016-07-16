class User
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :dob, type: String
  field :phone_number, type: Integer
  field :email
  field :oauth_token, type: String
  field :oauth_expires_at, type: Time

  def self.from_omniauth(auth_hash)
    where(auth_hash.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth_hash.provider
        user.uid = auth_hash.uid
        user.name = auth_hash.info.name
        user.oauth_token = auth_hash.credentials.token
        user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
        user.save!
    end
  end
end
