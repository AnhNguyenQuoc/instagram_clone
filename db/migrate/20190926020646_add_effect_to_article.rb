class AddEffectToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :effect, :text, null: true
  end
end
