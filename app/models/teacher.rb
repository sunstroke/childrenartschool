class Teacher < ActiveRecord::Base
  has_many :groups
  has_many :program, :through=>:groups
  validates_presence_of :full_photo, :message => "не может быть пустым"
  has_attached_file :full_photo,
                    :styles => {
                      :i1600=>"1600x1000#",
                      :i1440=>"1440x900#",                      
                      :i1280=>"1280x800#",
                      :i1024=>"1024x640#",
                      :i800=>"800x500#",
                      :small=>"200x200>"
                    },
                   :url           => "/attachments/teachers/:id/:attachment/:style/:basename.:extension",
                   :path          => ":rails_root/public:url",
                   :default_url   => "/images/stripes1.jpg"
  has_attached_file :avatar,
                  :styles=>{
                    :small=>"200x200>"
                  },
                  :url           => "/attachments/teachers/:id/:attachment/:style/:basename.:extension",
                  :path          => ":rails_root/public:url",
                  :default_url   => "/images/stripes1.jpg"
  
end
