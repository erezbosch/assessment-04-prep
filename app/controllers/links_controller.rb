class LinksController < ApplicationController
  before_action :redirect_unless_logged_in

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments
    render :show
  end

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def index
    @links = Link.all
    render :index
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def add_comment
    @link = Link.find(params[:id])
    comment = Comment.new(comment_params)

    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end
    
    redirect_to link_url(@link)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
