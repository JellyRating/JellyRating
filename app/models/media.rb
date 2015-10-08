class Media < ActiveRecord::Base
    before_save {self.title = title.downcase};
    validates :title, presence: true;
    validates :release_date, presence: true;

    has_many :media_avaliations
    has_many :users, :through => :media_avaliations
end