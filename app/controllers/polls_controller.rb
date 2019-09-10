class PollsController < ApplicationController

  # GET /polls
  # GET /polls.json
  def index
    if params[:search].present?
      @polls = Poll.where("lower(title) LIKE :prefix OR lower(description) LIKE :prefix", prefix: "%#{params[:search].downcase}%")
    elsif params[:category_id].present?
      @cat = Category.find(params[:category_id])
      @polls = @cat.polls
    else
      @polls = Poll.all.where("start_date <=?  AND end_date >= ?",Date.today,Date.today)
    end
    @categories = Category.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @poll = Poll.find(params[:id])

    @vote_option = @poll.answers
  end

  # GET /polls/new
  def new

    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
 @poll = Poll.find(params[:id])

  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.js {redirect_to new_poll_path, notice: 'Poll was successfully created.'}
      #   format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
      #   format.json { render :show, status: :created, location: @poll }
      # else
      #   format.html { render :new }
      #   format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
         @poll = Poll.find(params[:id])
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
     @poll = Poll.find(params[:id])
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def welcome
    @polls = Poll.all.where("start_date <=?  AND end_date >= ?",Date.today,Date.today)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:title, :description, :start_date, :end_date, :category_id, answers_attributes: [:id, :Title, :poll_id, :_destroy])
    end
end
