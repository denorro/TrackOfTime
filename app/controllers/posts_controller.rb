# frozen_string_literal: true

class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Post created successfully!'
      redirect_to @post
    else
      flash[:error] = 'Could not save post'
      render :new
    end
  end

  def show; end

  def edit; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:date, :rationale)
  end
end
