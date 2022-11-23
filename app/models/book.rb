class Book < ActiveRecord::Base
  belongs_to :author

  validates_presence_of :content_name, :author_name, :year, :category, :title
  validates_numericality_of :pages, :average_rating, greater_than_or_equal_to: 0
  before_validation :set_author_name, if: Proc.new { |b| b.will_save_change_to_author_id? }

  def self.search(params)
    if params.blank?
      Book.all
    else
      search_by_filter(params)
    end
  end

  def self.search_by_filter(params)
    query_conditions  = []
    ransack_condition = params.except(:author_name,:years)

    if params['author_name'].present?
      author_names = params['author_name'].split(', ')
      author_conditions = []

      author_names.each do |name|
        author_conditions << "author_name like '%#{name}%'"
      end

      author_condition = author_conditions.join(" OR ")
      query_conditions << "( #{author_condition} )"
    end

    if params['year'].present?
      years = params['year'].split(', ')
      year_conditions = []

      years.each do |year|
        year_conditions << "year like '%#{year}%'"
      end

      year_condition = year_conditions.join(" OR ")
      query_conditions << "( #{year_condition} )"
    end

    query_condition = query_conditions.join(" AND ")

    Book.where(query_condition)
  end

  private

  def set_author_name
    self.author_name = Author.find(author_id).name
  end
end
