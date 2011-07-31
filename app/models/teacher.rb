class Teacher < ActiveRecord::Base
  has_many :groups
  has_attached_file :full_photo,
                   :url           => "/attachments/trachers/:id/:attachment/:style/:basename.:extension",
                   :path          => ":rails_root/public:url",
                   :default_url   => "/images/stripes1.jpg"
  has_attached_file :avatar,
                  :url           => "/attachments/teachers/:id/:attachment/:style/:basename.:extension",
                  :path          => ":rails_root/public:url",
                  :default_url   => "/images/stripes1.jpg"
  
end
