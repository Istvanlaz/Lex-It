class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # write something
  end

  def wishlist
    @all_wishlist_items = Book.where(wishlist: true)
    # ClassNotes.where(wishlist: true).each do |note|
    #   note << @all_wishlist_items
    # end
  end

  private

  def resource_name
    :user
  end
  helper_method :resource_name

  def resource
    @resource ||= User.new
  end
  helper_method :resource

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :devise_mapping

  def resource_class
    User
  end
  helper_method :resource_class
end
