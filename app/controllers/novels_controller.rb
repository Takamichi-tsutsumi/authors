class NovelsController < ApplicationController
  before_action :set_novel, only: [:show, :update, :destroy]

  # GET /novels
  def index
    @novels = Novel.all

    render json: @novels
  end

  # GET /novels/1
  def show
    render json: @novel
  end

  # POST /novels
  def create
    @novel = Novel.new(novel_params)
    print novel_params

    if @novel.save
      render json: @novel, status: :created, location: @novel
    else
      render json: @novel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /novels/1
  def update
    if @novel.update(novel_params)
      render json: @novel
    else
      render json: @novel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /novels/1
  def destroy
    @novel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novel
      @novel = Novel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def novel_params
      params.require(:novel).permit(:title, :author_id)
    end
end
