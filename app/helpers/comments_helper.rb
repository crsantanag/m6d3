module CommentsHelper
  Pagy::DEFAULT[:limit] = 1
  include Pagy::Frontend
end
