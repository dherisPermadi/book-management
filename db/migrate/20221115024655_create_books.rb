class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :author
      t.string   :content_name
      t.string   :author_name
      t.string   :year
      t.string   :category
      t.json     :genres
      t.json     :title
      t.float    :average_rating
      t.integer  :pages
      t.text     :description
      t.string   :language
      t.datetime :release_date
      t.timestamps
    end
  end
end
