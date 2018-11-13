#Recipes with ratings 5
five_star_recipes <- nutrition_data[which(nutrition_data$rating == 5),]
fsr_clusters <- kmeans(five_star_recipes[,c(3:6)],4)
#Categorizing recipes according to nutrition content - 1st Quatrile value: Lower limit, Mean value: Upper limit
summary(five_star_recipes)
five_star_recipes$cal_cat<-cut(five_star_recipes$calories, c(-Inf,225,380,Inf), labels = c("low","med","high"))
five_star_recipes$pro_cat<-cut(five_star_recipes$protein, c(-Inf,3,15,Inf), labels = c("low","med","high"))
five_star_recipes$fat_cat<-cut(five_star_recipes$fat, c(-Inf,9,20,Inf), labels = c("low","med","high"))
five_star_recipes$sod_cat<-cut(five_star_recipes$sodium, c(-Inf,98,386,Inf), labels = c("low","med","high"))
clusplot(five_star_recipes[,-c(1:2)], fsr_clusters$cluster, color=TRUE, shade=TRUE, labels = 3, lines = 0, main = "Five Rated Recipe clustering")
#Food rich in protein, and less calories and fat
scatterplot3d::scatterplot3d(five_star_recipes$protein,five_star_recipes$calories,five_star_recipes$fat, xlab = "Protein", ylab = "Calories", zlab = "Fat", color = "turquoise")
temp_diet <- five_star_recipes[which((five_star_recipes$cal_cat=="low")&(five_star_recipes$pro_cat=="high")&(five_star_recipes$fat_cat=="low")),]
final_diet <- temp_diet[,-c(2,7:9)]
diet_answer <- final_diet[,c(1)]
View(diet_answer)
