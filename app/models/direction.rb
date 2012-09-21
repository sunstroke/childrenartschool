class Direction < ActiveRecord::Base
  audited
    mount_uploader :img, ImgDirectionUploader
end
