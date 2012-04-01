class Direction < ActiveRecord::Base
    mount_uploader :img, ImgDirectionUploader
end
