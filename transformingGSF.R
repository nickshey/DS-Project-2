test <- read.csv("~/Desktop/College/Seventh Semester/Data Science/DS-Project-2/sales_manhattan_test_set.csv")
train <- read.csv("~/Desktop/College/Seventh Semester/Data Science/DS-Project-2/sales_manhattan_train_set.csv")
train_edit <- train
test_edit <- test
#converting GSF to characters to turn into numeric
train_edit$GROSS.SQUARE.FEET <- as.character(train_edit$GROSS.SQUARE.FEET)
#turning GSF into numeric and taking out commas so no NA's are introduced
train_edit$GROSS.SQUARE.FEET <- as.numeric(gsub(",","",train_edit$GROSS.SQUARE.FEET))
#doing the same for the training set
test_edit$GROSS.SQUARE.FEET <- as.character(test_edit$GROSS.SQUARE.FEET)
test_edit$GROSS.SQUARE.FEET <-as.numeric(gsub(",","",test_edit$GROSS.SQUARE.FEET))        
#taking out missing values
train_edit1 <- filter(train_edit, GROSS.SQUARE.FEET != 0)
train_edit2 <-train_edit1
#mutating based on a range of values
#i looked at histograms and density curves to see what ranges make sense
#more granular for lower values and then get more general
train_edit2 <- train_edit2 %>% mutate(GROSS.SQUARE.FEET = ifelse(GROSS.SQUARE.FEET < 600, "<600", 
                                      ifelse(GROSS.SQUARE.FEET < 1000, "600-1000",
                                             ifelse(GROSS.SQUARE.FEET < 1500, "1000-1500",
                                                    ifelse(GROSS.SQUARE.FEET < 2000, "1500-2000",
                                                           ifelse(GROSS.SQUARE.FEET < 2500, "2000-2500",
                                                                  ifelse(GROSS.SQUARE.FEET < 3000, "2500-3000",
                                                                         ifelse(GROSS.SQUARE.FEET < 4000, "3000-4000",
                                                                                ifelse(GROSS.SQUARE.FEET < 5000, "4000-5000",
                                                                                       ifelse(GROSS.SQUARE.FEET < 10000, "5000-10000",
                                                                                              ifelse(GROSS.SQUARE.FEET < 20000, "10000-20000",
                                                                                                     ifelse(GROSS.SQUARE.FEET < 30000, "20000-30000",
                                                                                                            ">30000"))))))))))))
#turning it into a categorical variable
train_edit2$GROSS.SQUARE.FEET <- as.factor(train_edit2$GROSS.SQUARE.FEET)
test_edit1 <- filter(test_edit, GROSS.SQUARE.FEET != 0)
test_edit2 <- test_edit1
#doing the same for the test set
test_edit2 <- test_edit2 %>% mutate(GROSS.SQUARE.FEET = ifelse(GROSS.SQUARE.FEET < 600, "<600", 
                                                                 ifelse(GROSS.SQUARE.FEET < 1000, "600-1000",
                                                                        ifelse(GROSS.SQUARE.FEET < 1500, "1000-1500",
                                                                               ifelse(GROSS.SQUARE.FEET < 2000, "1500-2000",
                                                                                      ifelse(GROSS.SQUARE.FEET < 2500, "2000-2500",
                                                                                             ifelse(GROSS.SQUARE.FEET < 3000, "2500-3000",
                                                                                                    ifelse(GROSS.SQUARE.FEET < 4000, "3000-4000",
                                                                                                           ifelse(GROSS.SQUARE.FEET < 5000, "4000-5000",
                                                                                                                  ifelse(GROSS.SQUARE.FEET < 10000, "5000-10000",
                                                                                                                         ifelse(GROSS.SQUARE.FEET < 20000, "10000-20000",
                                                                                                                                ifelse(GROSS.SQUARE.FEET < 30000, "20000-30000",
                                                                                                                                       ">30000"))))))))))))
test_edit2$GROSS.SQUARE.FEET <- as.factor(test_edit2$GROSS.SQUARE.FEET)

