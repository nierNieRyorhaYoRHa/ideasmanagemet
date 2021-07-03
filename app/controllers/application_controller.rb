class ApplicationController < ActionController::Base
  def response_success(class_name1, class_name2, action_name)
    render status: 201, json: { status: 201, message: "Success #{class_name1.capitalize} #{class_name2.capitalize} #{action_name.capitalize}" }
  end
  def response_not_found(class_name = 'page')
    render status: 404, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
  end
  def response_unprocessable_entity(class_name = 'page')
    render status: 422, json: { status: 422, message: "#{class_name.capitalize} Unprocessable Entity" }
  end
end
