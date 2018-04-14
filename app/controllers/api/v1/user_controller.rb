class Api::V1::UserController < ApiController
  before_action :authenticate_api_v1_user!

  def index
    @users = User.all.sort
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    user = User.create(profile_params)
    if user.save
      render 'index'
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit!
  end
end
