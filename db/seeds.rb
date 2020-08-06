# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create courses, topics 
# ['igniter', 'squad_lead', 'admin'].each do |role|
#   Role.find_or_create_by({name: role})
# end

# ["Technical","Practical","Soft Skill","Atos Training","Project","Other"].each do |topic|
#   Topic.find_or_create_by({name: topic})
# end

# t = Topic.find_by(name: "Technical").id
# ["Cloud computing basics (percipio)","Cloud Basics","Google Essentials","AWS Essentials","Azure Essentials","Microservices Containers","Microservices Architecture","SOA Basics","SOAGovernance","Core Concepts of OA","JSON Essentials","REST API with Java: Java APIs with JSON, Maven & Spring","Working with JSON, Java, Nodeis & ython","YAML Essentials","Evaluation SOA and Microservices","Secure Agile Programming: Agile Concepts","Agile ethodologies ","Agile Principles & Methodologies","Linux Operating System Fundamentals","JIRA","DevOps Essentials","DevOps - eLearning","Beginners guide to containers and orchestration","Serverless Concepts","Docker achine and Security","Evaluation","Docker Machine APIs & VMs","Git Quick Start","Hands-On GitOps","Jenkins Quick tart","Docker Quick Start","Kubernetes Quick Start","Implementing a full CI/CD Pipeline","CI/CD Implementation for evOps","Docker Machine & Security","Evaluation CICSD,  GIT HUB, Jenjins, Docker, Kubernetes","Software Testing","Database Essentials","Evaluation Testing and Database","Introduction to Python Development","Practice odule Introduction to Python Development","Introduction to Python Development","Practice Module Introduction to ython Development","Customer Focus (part 1)","Customer Focus (part 2)","Practice Session Python","Evaluation","Data Visualization Core Concepts","Power BI - Getting started with data analytics","Power BI  Data Modelling & Visualization","PowerBI-DataPreparation","QlikView: Getting Started","QlikView: Sheets, harts  Tables","QlikView: Data Modelling","QlikView: Dimensional Modelling","Storytelling with Data: Introduction","Storytelling with Data: Tableau & Powerbase","Evaluation Data Visualization","Machine & Deep earning Algorithms: Introduction","Machine & Deep Learning Algorithms: Regression & Clustering","Machine & Deep earning Algorithms: Data Preparation in Pandas ML","ML/DL in the Enterprise: Modelling, Development & Deployment","Model Management: Building & Deploying ML Models in Production","Machine Learning & Data Analytics","Machine Learning Implementation","Math for Data Science & Machine Learning","Improving Neural etworks: eural Network Performance Management","NLP for ML with Python: NLP Using Python & NLTK","TensorFlow: Deep Neural etworks & Image Classification Using Estimators","Improving Neural Networks: Data Scaling & Regularization","Using ython ML for Predicative Analytics","Evaluation Machine Learning","Bid Data Fundamentals","Hadoop Quick Start","Big Data Essentials","Apache Hadoop","Deploy & Configure a Single-Node Hadoop Cluster","Hadoop & MapReduce etting Started","Data Warehousing","Evaluation Big Data Fundamentals","Cloud Security Fundamentals","Microsoft zure Security Fundamentals ","Server Hardening Fundamentals","Compliance in the Cloud Fundamentals","Secure ockets ayer (SSL) Fundamentals","Encryption Fundamentals","Evaluation"].each do |course|
#   Course.find_or_create_by({name: course, due_date: Date.today, topic_id: t})
# end

# t = Topic.find_by(name: "Practical").id
# ["Practice assignment 1","Practice assignment 2","Practice assignment 3","Practice assignment 4","Practice ssignment 5","Practice assignment 6","Lab / customer scenario","Google lab","Practice assignment 7","Practice ssignment 8","Practice assignment 9","Practice assignment 10","Practice assignment 11","Practice assignment 12","Practice assignment 13","Practice assignment 14","Practice assignment 15","Practice assignment 16","Practice ssignment 17","Practice assignment 18","Practice assignment 19","Practice assignment 20","Practice assignment 21"].each do |course|
#   Course.find_or_create_by({name: course, due_date: Date.today, topic_id: t})
# end

# t = Topic.find_by(name: "Soft Skill").id
# ["Compliance training (self paced)","Joining the corporate world","Social Media","Dress code","Role model","Ambassador for Atos","Complete profile","Harvard Customer Focus","Harvard Networking","Networking hallenge","Mentoring 1:1 sessions","Harvard Global Collaboration","Team building","Coaching & SDI","Harvard Team ork","Unconcious bias","Harvard Diversity","Harvard Presentation skills","Objective Setting","Performance anagement","Harvard Innovation & Creativity","Service Orientation","Customer case study","Championing digital ransformation","Invest in Yourself","Problem Solving","Problem Statement"].each do |course|
#   Course.find_or_create_by({name: course, due_date: Date.today, topic_id: t})
# end

# t = Topic.find_by(name: "Atos Training").id
# ["Set up equipment, ID badge etc","Corporate/Program Induction","Local Induction","Introduction to Atos OM","Intro to CES","How to use Linux","We are Atos intro","Customer Centricity","CES arketing & Client Engagement","Customer Case Studies","Customer case (BTIC)","Introduction Strategic artners","Google Alliance","AWS Alliance","Partner/Alliance challenge?","Introduction GDC","Introduction MT","We are Atos  social value","Introduction FS&I","Meet graduates from different offices around the orld","NOC / SOC / Datacenter visit?","Introduction H&LS","RBU leader Q&A session","Introduction R&S","Meet an Agile Squad  UK/Kavi/ best practice ?","Present your squad and their ability","We are iverse (DRL)","Unconcious Bias in AI","Intro to Sales in Atos/CES","Sales Pitch Atos","Sales Techniques","Pitch club/ sales competition","Digital Platforms","Intro to Scientific Community","Business Critical Apps","Innovation booster","UX","Customer visit","Machine learning for ustainability","The Olympics evolution","Tokyo best practises (facial recognition etc.)","Predicative nalytics at Disney","Assesment portfolio knowledge","Deep dive on BDS/zData?","Technologies, trends and erspectives","Quantum Computing","Decarbonation","Atos IT Challenge"].each do |course|
#   Course.find_or_create_by({name: course, due_date: Date.today, topic_id: t})
# end

# t = Topic.find_by(name: "Project").id
# ["CSR Challenge Intro/Prep"].each do |course|
#   Course.find_or_create_by({name: course, due_date: Date.today, topic_id: t})
# end

# t = Topic.find_by(name: "Other").id
# ["Squad team introduction","FUN integration","Vlog on local office life","Cohort Collaboration","FUN integration 2","CSR Activity","FUN - Olympic Hackathon, scenarios - challenges","Assessment & Sign Off - Passing First Milestone of Cloud Fundamentals"].each do |course|
#   Course.find_or_create_by({name: course, due_date: Date.today, topic_id: t})
# end



# Asign courses to users
users = User.all
courses = Course.all
t = Topic.first.id
users.each do |u|
  courses.each do |c|
    UserCourse.create!(user_id: u.id, course_id: c.id, topic_id: t)
  end
end
