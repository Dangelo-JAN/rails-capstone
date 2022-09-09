class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    redirect_to group_index_path if user_signed_in?
  end
end