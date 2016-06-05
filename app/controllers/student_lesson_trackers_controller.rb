class StudentLessonTrackersController < ApplicationController
  before_action :set_student
  before_action :set_lesson_part, only: [:create]
  before_action :ensure_json_request  

  def show 
    
    # setting some standard response
    results = {}
    code = 204
	message = 'no results found'
        

    # assign the response in case of success
    if @student.present?
        results = @student
        code = 200
        message = 'success'
    end
    
    # sending back response with status and 
    # payload
    render :json => { 
          :status => { :code => code, :message => message }, 
          :result => results.as_json(
                          :except => [:created_at, :updated_at],
                          :include => { :lesson_parts => { :only => [:id, :lesson_id, :name, :sequence] } }
                      )
    }
    
    
  end

  # POST /students/:student_id/progress.json
  #
  # Requirement is to accept lesson and a part number
  # 
  # payload [:progress] => {
  #  :lesson_id,
  #  :sequence,
  # }
  def create

    results = {}
    code = 422
    message = 'can not be saved'
    
    @lesson_tracker = LessonTracker.new(lesson_tracker_params)
    @lesson_tracker.student_id = @student.id
    @lesson_tracker.lesson_id =  @lesson_part.lesson_id
    @lesson_tracker.completed_at = Time.zone.now
    
        
    if @lesson_tracker.save
        code = 200
        message = 'success'
        
        results = @lesson_tracker
    else
        results = @lesson_tracker.errors
    end
    
    # sending back response with status and 
    # payload
	render :json => { 
        :status => {:code => code, :message => message}, 
        :result => results.as_json(
                          :except => [:created_at, :updated_at]
                      )
    }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
        # to make a graceful find - expecting nil as opposed to exception if record not found
        @student = Student.find_by id: params[:id]
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_part
        @lesson_part = LessonPart.find_by lesson_id: lesson_tracker_params[:lesson_id], sequence: lesson_tracker_params[:sequence]
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_tracker_params
      params.require(:progress).permit(:lesson_id, :sequence)
    end
    

    # Making sure the non-json requests are responded with proper error
    def ensure_json_request
      unless request.format == :json
          render :nothing => true, :status => 406
      end
    end  
  
end
