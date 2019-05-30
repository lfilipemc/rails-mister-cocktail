class RemoveAmountFromDoses < ActiveRecord::Migration[5.2]
  def change
    remove_column :doses, :amount, :string
  end
end
