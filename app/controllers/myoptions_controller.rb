class MyoptionsController < ApplicationController
  before_action :set_myoption, only: [:show, :edit, :update, :destroy]

  # GET /myoptions
  # GET /myoptions.json
  def index
    @myoptions = Myoption.all
  end

  # GET /myoptions/1
  # GET /myoptions/1.json
  def show
    @poll = Poll.find(params[:id])
    @vote_option = @poll.answers
  end

  # GET /myoptions/new
  def new
    @myoption = Myoption.new
  end

  # GET /myoptions/1/edit
  def edit
  end

  # POST /myoptions
  # POST /myoptions.json
  def create
    @poll = Poll.find(params[:myoptions][:poll_id])
    ans_id = params[:option_answer]
    ans_title = Answer.find(ans_id).Title
    if user_signed_in?
      if Myoption.where(user_id: current_user.id, poll_id:  @poll.id).first.present?
        return redirect_to :back, notice: "You have already voting"
      else
        @myoption = Myoption.create!(poll_id:  @poll.id, user_id:current_user.id , title: ans_title ,answer_id: ans_id)
      end
    else
      if cookies[:vote_poll_id] && cookies[:vote_poll_id] == @poll.id.to_s
        return redirect_to :back, notice: "You have already voting"
      else
        @myoption = Myoption.create!(poll_id:  @poll.id , title: ans_title ,answer_id: ans_id)
        cookies[:poll_id] = @poll.id
      end
    end
    # @myoption = Myoption.create!(poll_id: poll_id, user_id:user_id , title: ans_title ,answer_id: ans_id)
    # @myoption = Myoption.new(myoption_params)

    redirect_to :back
    flash[:notice] = 'Myoption was successfully created.'   
    # respond_to do |format|
    #   if @myoption.save
    #     format.html { redirect_to @myoption, notice: 'Myoption was successfully created.' }
    #     format.json { render :show, status: :created, location: @myoption }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @myoption.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /myoptions/1
  # PATCH/PUT /myoptions/1.json
  def update
    respond_to do |format|
      if @myoption.update(myoption_params)
        format.html { redirect_to @myoption, notice: 'Myoption was successfully updated.' }
        format.json { render :show, status: :ok, location: @myoption }
      else
        format.html { render :edit }
        format.json { render json: @myoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myoptions/1
  # DELETE /myoptions/1.json
  def destroy
    @myoption.destroy
    respond_to do |format|
      format.html { redirect_to myoptions_url, notice: 'Myoption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myoption
      @myoption = Myoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def myoption_params
      params.require(:myoption).permit(:poll_id, :user_id, :title)
    end
end
