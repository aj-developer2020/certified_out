class BlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_block, only: [:show, :edit, :update, :destroy]


  # def index
  #   @blocks = Block.all
  # end

  def show
    @cohort = Cohort.find(params[:cohort_id])
  end

  # def new
  #   @block = Block.new
  # end

  def edit
    @cohort = Cohort.find(params[:cohort_id])
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @block = Block.new(block_params)
    @block.cohort = @cohort
    @block.user = current_user

    if @block.save
      redirect_to cohort_path(@cohort), notice: 'Block was successfully created.' 
    else
      @blocks = @cohort.blocks.order(created_at: :desc)
      render 'cohorts/show'
    end
    
  end

  def update
      if @block.update(block_params)
        redirect_to @block, notice: 'Block was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    @block = Block.find params[:id]
        if can? :crud, @block
          @block.destroy
          redirect_to cohort_path(@block.cohort)
        else
          redirect_to root_path, alert: 'Not authorized'
        end
      end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:date, :duration, :type_of_block, :title)
    end
end
