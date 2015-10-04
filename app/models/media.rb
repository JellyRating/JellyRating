class Media < ActiveRecord::Base
    before_save {self.title = title.downcase};
    validates :title, presence: true;
    validates :release_date, presence: true;
end