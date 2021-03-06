# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include SslRequirement
  include AuthenticatedSystem

  before_filter :no_cache, :set_site,  :set_locale, :check_online , :except => [ :offline, "AdminController"]
  helper :all # include all helpers, all the time
  
  include SimpleCaptcha::ControllerHelpers
  
  def check_online
    setting = (Sitesettings.first).online
        @announcements = Announcements.find(:all)
   
    if !setting
      redirect_to offline_path
    
    end

      
  
end
  
def set_locale
  # if this is nil then I18n.default_locale will be used
  if logged_in? 
    session[:lang_pref] = case current_user.lang_pref
    when 1
      "english"
    when 2
      "tagalog"
    end
  end
    
  if session[:lang_pref].nil?
    session[:lang_pref] = "english"
   
      
  end
   
  I18n.locale = session[:lang_pref]
end

# See ActionController::RequestForgeryProtection for details
# Uncomment the :secret if you're not using the cookie session store
protect_from_forgery # :secret => '0f4c9180aa02a9e2e806a289f8376d03'
@key = "0f4c9180aa02a9e2e806a289f8376d03"
# See ActionController::Base for details 
# Uncomment this to filter the contents of submitted sensitive data parameters
# from your application log (in this case, all fields with names like "password"). 
# filter_parameter_logging :password

def generate_notifs follower, state
  begin
  @violations = Violation.find(:all, :from => "/violation/?idno=#{follower.idno}")
  @guidance =  Guidance.find(:all, :from => "/guidance/?idno=#{follower.idno}")
  @attendance=  Attendance.find(:all, :from => "/attendance/?idno=#{follower.idno}")
  @grades = Grade.find(:all, :from => "/grade/?idno=#{follower.idno}")
  @tf_assessment = Tfassessment.find(:all, :from => "/tfassessment/?idno=2067514")
  @tf_breakdown = Tfbreakdown.find(:all, :from => "/tfbreakdown/?idno=#{follower.idno}")
               
  if @violations.size>0
    if state.violation_rows  < @violations.size
      state.violation_rows =  @violations.size
      state.save
      notif =  Notification.new
      notif.delivered_at = Time.now
      notif.follower_id = follower.user_id
      notif.idno = follower.idno
      notif.details = "commited a violation."
      notif.notification = "Violation notice!"
      notif.new = true
      notif.save
    end
  end
        
  if @guidance.size>0
    if state.guidance_rows  < @guidance.size
      state.guidance_rows =  @guidance.size
      state.save
      notif =  Notification.new
      notif.delivered_at = Time.now
      notif.follower_id = follower.user_id
      notif.idno = follower.idno
      notif.details = " has a been guidanced."
      notif.notification = "guidace notice!"
      notif.new = true
      notif.save
    end
  end
        
  if @grades.size>0
    if state.grade_rows  < @grades.size
      state.grade_rows =  @grades.size
      state.save
      notif =  Notification.new
      notif.delivered_at = Time.now
      notif.follower_id = follower.user_id
      notif.idno = follower.idno
      notif.details = "'s grades are updated!"
      notif.notification = "grades notice!"
      notif.new = true
      notif.save
    end
  end

  if @tf_assessment.size >0
    if state.tf_assessment_rows < @tf_assessment.size
      state.tf_assessment_rows = @tf_assessment.size
      state.save
      notif = Notification.new
      notif.delivered_at = Time.now
      notif.idno = follower.idno
      notif.details = " has new assessment information"
      notif.notification = "assessment notice!"
      notif.new = true
      notif.save

    end
  end

  if  @tf_breakdown.size >0
    if state.tf_breakdown_rows<  @tf_breakdown.size
      state.tf_breakdown_rows=  @tf_breakdown.size
      state.save
      notif = Notification.new
      notif.delivered_at = Time.now
      notif.idno = follower.idno
      notif.details = " has new breakdown information"
      notif.notification = "breakdown"
      notif.new = true
      notif.save

    end
  end

  if @attendance.size >0
  
    if state.attendance_rows < @attendance.size
      state.attendance_rows = @attendance.size
      state.save
      notif = Notification.new
      notif.delivered_at = Time.now
      notif.idno = follower.idno
      notif.details = " was recorded absent!"
      notif.notification = "absence"
      notif.save
    end
  end
  rescue
  end
        
  ##      update admin variable for next generation
  #dont forget to generate the mails and send the cp messages

end
protected
def set_site
  site=( WebserviceAddress.first).address
 user = "slu"
password = "slu"

  Violation.site = site
  Violation.user=user
  Violation.password=password
  Profile.site = site
  Profile.user = user
  Profile.password = password
  Grade.site = site
  Grade.user = user
  Grade.password = password
  Attendance.site = site
    Attendance.user = user
  Attendance.password = password
  Guidance.site = site
    Guidance.user = user
  Guidance.password = password
  PaymentSchedule.site = site
PaymentSchedule.user = user
  PaymentSchedule.password = password
  Tfbreakdown.site = site
  Tfbreakdown.user = user
  Tfbreakdown.password = password
  Tfassessment.site = site
  Tfassessment.user = user
  Tfassessment.password = password
  ClassSchedule.site = site
  ClassSchedule.user = user
  ClassSchedule.password = password
  MobileNumber.site = site
  MobileNumber.user = user
  MobileNumber.password = password
end
  
def no_cache
  response.headers["Last-Modified"] = Time.now.httpdate
  response.headers["Expires"] = -1
  response.headers["Pragma"] = "no-cache"
  response.headers["Cache-Control"] = 'no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0'
  #it wont work without this ^   O.o
end
end
