class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @post = Post.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @posts = Post.all

  end

  # POST /posts
  # POST /posts.json
  def create
    @post_new = Post.new(post_params)
    respond_to do |format|
      if @post_new.save
        # format.html { redirect_to posts_url }
        # format.json { head :no_content }
        format.js { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @post_new.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post=Post.find(params[:id])
   
    respond_to do |format|
    @post.update_attributes(post_params)
    format.js 
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      # format.html { redirect_to posts_url }
      # format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title)
    end
end
