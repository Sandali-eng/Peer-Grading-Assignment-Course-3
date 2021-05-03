Variables :-

1. activities :- List of activities performed when the corresponding measurements were taken
              :- 6 rows and 2 columns

2. features :- List of all features
            :- 561 rows and 2 columns

3. subject_test :- Test data of 9/30 volunteer test subjects being observed 
                :- 2947 rows and 1 column

4. x_test :- Recorded features for test data
          :- 2947 rows and 561 columns

5. y_test :- Labels for test data
          :- 2947 rows and 1 columns

6. subject_test :- Training data of 21/30 volunteer test subjects being observed 
               :- 7352 rows and 1 column

7. x_train :- Recorded features for train data
          :- 7352 rows and 561 columns

8. y_train :- Labels for train data
           :- 7352 rows and 1 columns

9. X :- Created by merging x_train and x_test 
     :- 10299 rows and 561 columns

10. Y :- Created by merging y_train and y_test 
      :- 10299 rows and 1 column
      
11. Subject :- Created by merging subject_train and subject_test 
            :- 10299 rows and 1 column

12. Merged :- Created by merging Subject, Y and X 
           :- 10299 rows and 563 column

13. Tidydata :- Extracts only the measurements on the mean and standard deviation for each measurement
             :- 10299 rows and 88 columns
             
14. Final_Data :- sumarizing Tidydata taking the means of each variable for each activity and each subject, after groupped by subject and activity.
               :- 180 rows and 88 columns 