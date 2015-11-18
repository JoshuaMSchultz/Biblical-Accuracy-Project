class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :verses

  after_validation :compile_best_translation, on: :show

  def compile_best_translation
    @chapter = Chapter.find(self.id)
    @verses = @chapter.verses.pluck(:order_id).uniq.sort
    @accurate_verse = []
    @verses.each do |verse|
      translations = @chapter.verses.where(order_id: verse)
      most_accurate = translations.max_by { |x| x.vote_count }
      @accurate_verse << most_accurate
    end
    @accurate_verse
  end

end
