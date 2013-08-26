class Direction < ActiveRecord::Base
#  audited
    attr_accessible :name, :link, :img, :desc, :position, :visible 
    mount_uploader :img, ImgDirectionUploader
end
