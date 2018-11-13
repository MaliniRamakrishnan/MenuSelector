#Boruta Package for finding the attributes influence
set.seed(13)
boruta.train <- Boruta(rating~.-title, data = nutrition_data, doTrace = 2)
boruta.train
#RESULT:
#Boruta performed 9 iterations in 4.653083 mins.
#4 attributes confirmed important: calories, fat, protein, sodium;
#No attributes deemed unimportant.
