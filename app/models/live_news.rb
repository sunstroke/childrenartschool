class LiveNews < ActiveRecord::Base
    mount_uploader :img, LiveUploader  
end
