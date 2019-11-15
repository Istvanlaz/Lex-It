class AddDomainToBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :domain
  end
end
