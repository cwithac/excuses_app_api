class ApplicationController < ActionController::API

  def authenticate_token
    puts "AUTHENTICATE JWT"
    render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
  end

  def bearer_token
    puts "BEARER TOKEN"
    puts header = request.env["HTTP_AUTHORIZATION"]

    pattern = /^Bearer /
    puts "TOKEN WITHOUT BEARER"
    puts header.gsub(pattern, '') if header && header.match(pattern)
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def decode_token(token_input)
    puts "DECODE TOKEN, token input: #{token_input}"
    puts token = JWT.decode(token_input, ENV['JWT_SECRET'], true)
    JWT.decode(token_input, ENV['JWT_SECRET'], true)
  rescue
    render json: { status: 401, message: 'Unauthorized' }
  end

  def get_current_user
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    User.find(decoded_jwt[0]['user']['id'])
  end

  def authorize_user
    puts "AUTHORIZE USER"
    puts "user id: #{get_current_user.id}"
    puts "params: #{params[:id]}"
    render json: {status: 401, message: 'Unauthorized'} unless get_current_user.id == params[:id].to_i
  end

  def authorize_excuse_action
    puts "AUTHORIZE EXCUSE ACTION"
    puts "user id: #{get_current_user.id}"
    puts "params: #{params[:id]}"
    excuse = Excuse.find(params[:id])
    render json: {status: 401, message: 'Unauthorized'} unless get_current_user.id == excuse.user_id
  end

  def authorize_delete_action
    puts "AUTHORIZE DELETE ACTION"
    puts "user id: #{get_current_user.id}"
    puts "params: #{params[:id]}"
    relation = Relation.find(params[:id])
    entry = Excuse.find(relation.excuse_id)
    render json: {status: 401, message: 'Unauthorized'} unless get_current_user.id == entry.user_id
  end
end
