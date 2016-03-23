class Course < ActiveRecord::Base
  has_many :enrollments,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  has_one :prerequisite,
    foreign_key: :id,
    primary_key: :prereq_id,
    class_name: :Course

  belongs_to :instructor,
    foreign_key: :instructor_id,
    primary_key: :id,
    class_name: :User
end
