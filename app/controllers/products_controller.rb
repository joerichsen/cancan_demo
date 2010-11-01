class ProductsController < InheritedResources::Base
  belongs_to :user, :optional => true
  load_and_authorize_resource

  def create
    create! { products_path }
  end
end
