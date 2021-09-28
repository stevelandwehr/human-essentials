class CreateOrganizationFaqs < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_faqs do |t|
      t.references :organization, foreign_key: true
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
