class Association < ApplicationRecord
    belongs_to :certificate
    belongs_to :associate, :class_name => "Certificate"
    
end
