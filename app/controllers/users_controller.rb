class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_user, except: [:login, :create, :index]

  # login action
  def login
    # find user based on the username entered
    user = User.find_by(username:params[:user][:username])
    # check if a user by that username was found and if the password entered
    # matches
    if user && user.authenticate(params[:user][:password])
      # create webtoken
      token = create_token(user.id, user.username)
      # edit user data so that no password information will be send to frontend
      editedUser = user
      editedUser.password_digest = ''
      # send success response to server
      render json: {status: 200, token: token, user: editedUser}
    else
      # if no match was found, send fail message to server
      render json: {status: 401, message: "Unauthorized"}
    end
  end

  # GET /users/1
  def show
    render json: get_current_user
  end

  # POST /users
  def create
    @user = User.new(username:params[:user][:username], password:params[:user][:password])
    if @user.save
      # edit user data so that no password information will be send to frontend
      editedUser = @user
      editedUser.password_digest = ''
      render json: {status: 201, user: editedUser}
    else
      # edit user data so that no password information will be send to frontend
      editedUser = @user
      editedUser.password_digest = ''
      render json: {status: 422, user: editedUser}
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      editedUser = @user
      editedUser.password_digest = ''
      render json: {status: 200, user: editedUser}
    else
      editedUser = @user
      editedUser.password_digest = ''
      render json: {status: 422, user: editedUser}
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: {status: 204}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password_digest)
    end

    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
    {
      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
    end
end
