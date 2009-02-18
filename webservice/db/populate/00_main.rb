# To change this template, choose Tools | Templates
# and open the template in the editor.
puts Rails.root

#announcement working!
#=begin
puts "start announcements"
ann_date = '%d.%m.%Y'
File.open(Rails.root+"/CSV/announcement.csv").each {|line|
  temp = line.split(',')  
  ann = Announcement.new
  ann.eventDate = DateTime.strptime(temp[0], ann_date)
  ann.event = temp[1]
  ann.memoDetail = temp[2]
  ann.save
}
puts "end announcements"
#=end

#this is working!
#=begin
puts "start attendance"
File.open(Rails.root+"/CSV/attendance.csv").each {|line|
  temp = line.split(',')
  att = Attendance.new
  att.idNo = temp[0].to_i
  att.code = temp[1].to_i
  att.courseNo = temp[2]
  att.absences = temp[3].to_i
  att.attendanceStatus = temp[4]
  att.asOfDate = Date.parse(temp[5])
  att.save
}
puts "end attendance"
#=end

#this is working
#=begin
puts "start class schedule"
File.open(Rails.root+"/CSV/class schedule.csv").each {|line|
  temp = line.split(',')
  cs = ClassSchedule.new
  cs.idNo = temp[0].to_i
  cs.code = temp[1].to_i
  cs.courseNo = temp[2]
  cs.descriptiveTitle = temp[3]
  cs.units = temp[4].to_i
  cs.time = temp[5]
  cs.day = temp[6]
  cs.room = temp[7]
  cs.save
}
puts "end class schedule"
#=end

#this is working!
#=begin
puts "start course offerings"
File.open(Rails.root+"/CSV/course offerings.csv").each {|line|
  temp = line.split(',')
  co = CourseOfferings.new
  co.semester = temp[0].to_i
  co.endSchYr = temp[1].to_i
  co.college = temp[2]
  co.code = temp[3].to_i
  co.courseNo = temp[4]
  co.descriptiveTitle = temp[5]
  co.time = temp[6]
  co.day = temp[7]
  co.room = temp[8]
  co.save
}
puts "end course offerings"
#=end

#this is working!
#=begin
puts "start grades"
File.open(Rails.root+"/CSV/grade.csv").each {|line|
  temp = line.split(',')
  g = Grade.new
  g.idNo = temp[0].to_i
  g.semester = temp[1].to_i
  g.endSchYr = temp[2].to_i
  g.courseNo = temp[3]
  g.descriptiveTitle = temp[4]
  g.units = temp[5].to_i
  g.grade = temp[6]
  g.remark = temp[7]
  g.save
}
puts "end grades"
#=end

#this is working!
#=begin
puts "start guidance"
File.open(Rails.root+"/CSV/guidance.csv").each {|line|
  temp = line.split(',')
  g = Guidance.new
  g.idNo = temp[0].to_i
  g.time = temp[1]
  g.day = temp[2]
  g.room = temp[3]
  g.guidanceStatus = temp[4]
  g.save
}
puts "end guidance"
#=end

#this is working!
#=begin
puts "start payment schedule"
pay_date = '%d.%m.%Y'
File.open(Rails.root+"/CSV/payment schedule.csv").each {|line|
  temp = line.split(',')
  pay = PaymentSchedule.new
  pay.idNo = temp[0].to_i
  pay.dateOfPayment = DateTime.strptime(temp[1], pay_date)
  Amt = temp[2]
  Amt["P"] = " "
  pay.amt = Amt.strip.to_f
  pay.textDetail = temp[3]
  pay.save
}
puts "end payment schedule"
#=end

#this is working!
#=begin
puts "start profile"
File.open(Rails.root+"/CSV/profile.csv").each {|line|
  temp = line.split(',')
  profile = Profile.new
  profile.idNo = temp[0].to_i
  profile.familyName = temp[1]
  profile.givenName = temp[2]
  profile.middleName = temp[3]
  profile.gender = temp[4]
  profile.course = temp[5]
  profile.yearLevel = temp[6].to_i
  profile.college = temp[7]
  profile.address = temp[8]
  profile.email = temp[9]
  profile.mobileNumber = temp[10]
  profile.fatherName = temp[11]
  profile.motherName = temp[12]
  profile.guardianName = temp[13]
  profile.relationshipToGuardian = temp[14]
  profile.save
}
puts "end profile"
#=end

#wahhh!! mali ung csv file!! wla siyang as of date!!
=begin
puts "start tuition fee assessment"
tfa_date = 
File.open(Rails.root+"/CSV/tuition fee assessment.csv").each {|line|
  temp = line.split(',')
  tfa = TuitionFeeAssessment.new
  tfa.idNo = temp[0].to_i
  tfa.gradingTerm = temp[].to_i
  payAmt = temp[2]
  payAmt["P"] = " "
  tfa.payAmt = payAmt.strip.to_f
  tfa.balanceAsOf = DateTime.strptime(temp[3], tfa_date)
  tfa.save
}
puts "end tuition fee assessment"
=end

#this is working! hahaha!
#=begin
puts "start tuition fee breakdown"
File.open(Rails.root+"/CSV/tuition fee breakdown.csv").each {|line|
  temp = line.split(',')
  tfb = Tfbreakdown.new
  tfb.idNo = temp[0].to_i
  tfb.item = temp[1]
  feeAmt = temp[2]
  feeAmt["P"] = " "
  tfb.feeAmt = feeAmt.strip.to_f
  tfb.save
}
puts "end tuition fee breakdown"
#=end

#this is working din!! hahaha
#=begin
puts "start violations"
vio_date = '%d.%m.%Y'
File.open(Rails.root+"/CSV/violations.csv").each {|line|
  temp = line.split(',')
  violation = Violation.new
  violation.idNo = temp[0].to_i
  violation.dateOfViolation = DateTime.strptime(temp[1], vio_date)
  violation.offense = temp[2]
  violation.memoDetail = temp[3]
  violation.save
}
puts "end violations"
#=end
