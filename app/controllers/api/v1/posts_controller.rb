module Api
  module V1
class PostsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :destroy,:update]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order('created_at DESC')
    render json: @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by(params[:id])
    if @post
      render json: @post
    else
      render json: {post: "not found"}, status: :not_found
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @user.posts.new(post_params)
    if @post.save
        render json: @post, status: :created
    else
        render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = @user.posts.find_by(params[:id])
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = @user.posts.find_by(params[:id])
    if @post
      @post.destroy
    else
      render json: {post: "not found"}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
 
    def authenticate
        authenticate_or_request_with_http_token do |token, options|
        @user = User.find_by(token: token)
        end
    end
end
end
end