class CreateFaqs < ActiveRecord::Migration[6.1]
  def change
    create_table :faqs do |t|
      t.references :partner, foreign_key: true
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
