class LiveNews < ActiveRecord::Base
    audited
    mount_uploader :img, LiveUploader  
end
