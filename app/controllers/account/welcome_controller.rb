class Account::WelcomeController < Account::ApplicationController
  def index
    @items = Item.all
  end
end
