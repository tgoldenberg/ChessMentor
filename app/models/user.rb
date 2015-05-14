class User < ActiveRecord::Base
  attr_accessor :avatar
  searchkick word_start: [:name]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  crop_attached_file :avatar

  has_many :conversations, foreign_key: 'sender_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'

  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email            = auth.info.email
      user.password         = Devise.friendly_token[0,20]
      user.name             = auth.info.name   # assuming theuser model has a name
      user.remote_avatar    = auth.info.image
      user.avatar           = process_uri(auth.info.image)
      user.city             = auth.extra.raw_info.locale.split('_')[1]
      user.country          = auth.info.location
    end
  end

  def self.process_uri(uri)
   require 'open-uri'
   require 'open_uri_redirections'
   open(uri, :allow_redirections => :safe) do |r|
     r.base_uri.to_s
   end
  end
end
