ActiveRecord::Base.connection.execute(Views::HealthSystem::PatientRegistry::DROP_VIEW)
ActiveRecord::Base.connection.execute(Views::HealthSystem::AssessmentOverviewUtility::DROP_VIEW)
ActiveRecord::Base.connection.execute(Views::HealthSystem::AssessmentScoresUtility::DROP_VIEW)
ActiveRecord::Base.connection.execute(Views::HealthSystem::CareTeamSummaryUtility::DROP_VIEW)

ActiveRecord::Base.connection.execute(Views::HealthSystem::AssessmentScoresUtility::QUERY)
ActiveRecord::Base.connection.execute(Views::HealthSystem::AssessmentScoresUtility::ADD_INDEX)

ActiveRecord::Base.connection.execute(Views::HealthSystem::AssessmentOverviewUtility::QUERY)
ActiveRecord::Base.connection.execute(Views::HealthSystem::AssessmentOverviewUtility::ADD_INDEX)

ActiveRecord::Base.connection.execute(Views::HealthSystem::CareTeamSummaryUtility::QUERY)
ActiveRecord::Base.connection.execute(Views::HealthSystem::CareTeamSummaryUtility::ADD_INDEX)

ActiveRecord::Base.connection.execute(Views::HealthSystem::SimplifiedPatientRegistry::DROP_VIEW)
ActiveRecord::Base.connection.execute(Views::HealthSystem::SimplifiedPatientRegistry::QUERY)

ActiveRecord::Base.connection.execute(Views::HealthSystem::PatientRegistry::QUERY)