class ConditionsController < ApplicationController

  def parse_oracle_error(message)
    start_position = message.index("ORA-20000:") + 10
    end_position = message.index("ORA-",start_position+1) - 1
    message[start_position..end_position]
  end

  # GET /conditions
  # GET /conditions.json
  def index
    @conditions = Condition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conditions }
    end
  end

  # GET /conditions/1
  # GET /conditions/1.json
  def show
    @condition = Condition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @condition }
    end
  end

  # GET /conditions/new
  # GET /conditions/new.json
  def new
    @condition = Condition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @condition }
    end
  end

  # GET /conditions/1/edit
  def edit
    @condition = Condition.find(params[:id])
  end

  # POST /conditions
  # POST /conditions.json
  def create
    @condition = Condition.new(params[:condition])

    respond_to do |format|
      begin
        result = @condition.save
      rescue Exception => e
        #Pass e.message back to user
        if e.message.index("ORA-20000:")
          @condition.errors.add(:conditionid, parse_oracle_error(e.message))
        else
          @condition.errors.add(:conditionid, e.message)
        end

      end
      if result
        format.html { redirect_to @condition, notice: 'Condition was successfully created.' }
        format.json { render json: @condition, status: :created, location: @condition }

      else
        format.html { render action: "new" }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conditions/1
  # PUT /conditions/1.json
  def update
    @condition = Condition.find(params[:id])

    respond_to do |format|
      if @condition.update_attributes(params[:condition])
        format.html { redirect_to @condition, notice: 'Condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conditions/1
  # DELETE /conditions/1.json
  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy

    respond_to do |format|
      format.html { redirect_to conditions_url }
      format.json { head :no_content }
    end
  end
end
