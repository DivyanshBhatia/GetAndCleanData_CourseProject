# Code Book
This is the documentation of run_analysis.R

## Section wise split
This code is divided into 6 sections
* 1. Data Extraction
* 2. Extracting mean and standrd deviation features
* 3. Merging Data
* 4. Average calculation by subject and activity
* 5. Improving Labels
* 6. Output Result

### Data Extraction
To run this code you should have extracted the samsung data in your working directory
Here "UCI HAR Dataset" is used as the root folder #read.table is used to read the data
Xtrain contains data frame from X_train.txt
Xtest contains data frame from X_test.txt
Ytrain contains data frame from Y_train.txt
Ytest contains data frame from Y_test.txt
Subject_train and Subject_test contains data frame from subject_train.txt and subject_test.txt
Activity_data contains data of activity_labels.txt
features_data_frame contains data of features.txt
features_info_data_frame contains data of features_info.txt
features_data_vector contains names of 561 attributes of dataset

### Extracting mean and standrd deviation features
function extract_mean_std_features is used to extract columns related to mean and standard deviation
feature_vector is the list of 561 elements extracted from features.txt
content_to_extract argument is a vector that contains (mean() and std()) as default elements 
since these are the elements we need to check
* This function returns req_col vector which contains index of all the features that are mean or standard deviation measurement

### Merging Data
* Purpose here is to Merge the train and test datasets we use cbind and rbind for appending data
The resulting data is stored in X_merged_data,Y_merged_data,subject_merged_data
Y_merged_data is used with Activity_data to generate activity labels
activity labels are stored in activity_lab vector
X_merged_data is edited to include subject_merged_data and activity_labels

### Average calculation by subject and activity
X_merged_data is aggregated by using aggregate() with FUN=mean grouped by activity_lab and subject
* The result is stored in avg_by_activity_subject

### Improving Labels
* The labels are maintained in camelcase with paramaters mean and standard deviation separated by hyphen
tbody, tgravity and fbody are changed to time domain and frequency domain accordingly to give better description

### Output Result
*write.csv is used to write the output data frame to a CSV file
*Result can be obeserved in "UCI HAR Dataset/TidyDataset.csv"

## summary of final result
 Activity_Labels    Subject     Average Time Domain BodyAcc-mean-X
 LAYING            :30     Min.   : 1.0   Min.   :0.2216                    
 SITTING           :30     1st Qu.: 8.0   1st Qu.:0.2712                    
 STANDING          :30     Median :15.5   Median :0.2770                    
 WALKING           :30     Mean   :15.5   Mean   :0.2743                    
 WALKING_DOWNSTAIRS:30     3rd Qu.:23.0   3rd Qu.:0.2800                    
 WALKING_UPSTAIRS  :30     Max.   :30.0   Max.   :0.3015                    
 Average Time Domain BodyAcc-mean-Y Average Time Domain BodyAcc-mean-Z
 Min.   :-0.040514                  Min.   :-0.15251                  
 1st Qu.:-0.020022                  1st Qu.:-0.11207                  
 Median :-0.017262                  Median :-0.10819                  
 Mean   :-0.017876                  Mean   :-0.10916                  
 3rd Qu.:-0.014936                  3rd Qu.:-0.10443                  
 Max.   :-0.001308                  Max.   :-0.07538                  
 Average Time Domain BodyAcc-Standard deviation-X
 Min.   :-0.9961                                 
 1st Qu.:-0.9799                                 
 Median :-0.7526                                 
 Mean   :-0.5577                                 
 3rd Qu.:-0.1984                                 
 Max.   : 0.6269                                 
 Average Time Domain BodyAcc-Standard deviation-Y
 Min.   :-0.99024                                
 1st Qu.:-0.94205                                
 Median :-0.50897                                
 Mean   :-0.46046                                
 3rd Qu.:-0.03077                                
 Max.   : 0.61694                                
 Average Time Domain BodyAcc-Standard deviation-Z
 Min.   :-0.9877                                 
 1st Qu.:-0.9498                                 
 Median :-0.6518                                 
 Mean   :-0.5756                                 
 3rd Qu.:-0.2306                                 
 Max.   : 0.6090                                 
 Average Time Domain GravityAcc-mean-X Average Time Domain GravityAcc-mean-Y
 Min.   :-0.6800                       Min.   :-0.47989                     
 1st Qu.: 0.8376                       1st Qu.:-0.23319                     
 Median : 0.9208                       Median :-0.12782                     
 Mean   : 0.6975                       Mean   :-0.01621                     
 3rd Qu.: 0.9425                       3rd Qu.: 0.08773                     
 Max.   : 0.9745                       Max.   : 0.95659                     
 Average Time Domain GravityAcc-mean-Z
 Min.   :-0.49509                     
 1st Qu.:-0.11726                     
 Median : 0.02384                     
 Mean   : 0.07413                     
 3rd Qu.: 0.14946                     
 Max.   : 0.95787                     
 Average Time Domain GravityAcc-Standard deviation-X
 Min.   :-0.9968                                    
 1st Qu.:-0.9825                                    
 Median :-0.9695                                    
 Mean   :-0.9638                                    
 3rd Qu.:-0.9509                                    
 Max.   :-0.8296                                    
 Average Time Domain GravityAcc-Standard deviation-Y
 Min.   :-0.9942                                    
 1st Qu.:-0.9711                                    
 Median :-0.9590                                    
 Mean   :-0.9524                                    
 3rd Qu.:-0.9370                                    
 Max.   :-0.6436                                    
 Average Time Domain GravityAcc-Standard deviation-Z
 Min.   :-0.9910                                    
 1st Qu.:-0.9605                                    
 Median :-0.9450                                    
 Mean   :-0.9364                                    
 3rd Qu.:-0.9180                                    
 Max.   :-0.6102                                    
 Average Time Domain BodyAccJerk-mean-X Average Time Domain BodyAccJerk-mean-Y
 Min.   :0.04269                        Min.   :-0.0386872                    
 1st Qu.:0.07396                        1st Qu.: 0.0004664                    
 Median :0.07640                        Median : 0.0094698                    
 Mean   :0.07947                        Mean   : 0.0075652                    
 3rd Qu.:0.08330                        3rd Qu.: 0.0134008                    
 Max.   :0.13019                        Max.   : 0.0568186                    
 Average Time Domain BodyAccJerk-mean-Z
 Min.   :-0.067458                     
 1st Qu.:-0.010601                     
 Median :-0.003861                     
 Mean   :-0.004953                     
 3rd Qu.: 0.001958                     
 Max.   : 0.038053                     
 Average Time Domain BodyAccJerk-Standard deviation-X
 Min.   :-0.9946                                     
 1st Qu.:-0.9832                                     
 Median :-0.8104                                     
 Mean   :-0.5949                                     
 3rd Qu.:-0.2233                                     
 Max.   : 0.5443                                     
 Average Time Domain BodyAccJerk-Standard deviation-Y
 Min.   :-0.9895                                     
 1st Qu.:-0.9724                                     
 Median :-0.7756                                     
 Mean   :-0.5654                                     
 3rd Qu.:-0.1483                                     
 Max.   : 0.3553                                     
 Average Time Domain BodyAccJerk-Standard deviation-Z
 Min.   :-0.99329                                    
 1st Qu.:-0.98266                                    
 Median :-0.88366                                    
 Mean   :-0.73596                                    
 3rd Qu.:-0.51212                                    
 Max.   : 0.03102                                    
 Average Time Domain BodyGyro-mean-X Average Time Domain BodyGyro-mean-Y
 Min.   :-0.20578                    Min.   :-0.20421                   
 1st Qu.:-0.04712                    1st Qu.:-0.08955                   
 Median :-0.02871                    Median :-0.07318                   
 Mean   :-0.03244                    Mean   :-0.07426                   
 3rd Qu.:-0.01676                    3rd Qu.:-0.06113                   
 Max.   : 0.19270                    Max.   : 0.02747                   
 Average Time Domain BodyGyro-mean-Z Average Time Domain BodyGyro-Standard deviation-X
 Min.   :-0.07245                    Min.   :-0.9943                                  
 1st Qu.: 0.07475                    1st Qu.:-0.9735                                  
 Median : 0.08512                    Median :-0.7890                                  
 Mean   : 0.08744                    Mean   :-0.6916                                  
 3rd Qu.: 0.10177                    3rd Qu.:-0.4414                                  
 Max.   : 0.17910                    Max.   : 0.2677                                  
 Average Time Domain BodyGyro-Standard deviation-Y
 Min.   :-0.9942                                  
 1st Qu.:-0.9629                                  
 Median :-0.8017                                  
 Mean   :-0.6533                                  
 3rd Qu.:-0.4196                                  
 Max.   : 0.4765                                  
 Average Time Domain BodyGyro-Standard deviation-Z
 Min.   :-0.9855                                  
 1st Qu.:-0.9609                                  
 Median :-0.8010                                  
 Mean   :-0.6164                                  
 3rd Qu.:-0.3106                                  
 Max.   : 0.5649                                  
 Average Time Domain BodyGyroJerk-mean-X Average Time Domain BodyGyroJerk-mean-Y
 Min.   :-0.15721                        Min.   :-0.07681                       
 1st Qu.:-0.10322                        1st Qu.:-0.04552                       
 Median :-0.09868                        Median :-0.04112                       
 Mean   :-0.09606                        Mean   :-0.04269                       
 3rd Qu.:-0.09110                        3rd Qu.:-0.03842                       
 Max.   :-0.02209                        Max.   :-0.01320                       
 Average Time Domain BodyGyroJerk-mean-Z
 Min.   :-0.092500                      
 1st Qu.:-0.061725                      
 Median :-0.053430                      
 Mean   :-0.054802                      
 3rd Qu.:-0.048985                      
 Max.   :-0.006941                      
 Average Time Domain BodyGyroJerk-Standard deviation-X
 Min.   :-0.9965                                      
 1st Qu.:-0.9800                                      
 Median :-0.8396                                      
 Mean   :-0.7036                                      
 3rd Qu.:-0.4629                                      
 Max.   : 0.1791                                      
 Average Time Domain BodyGyroJerk-Standard deviation-Y
 Min.   :-0.9971                                      
 1st Qu.:-0.9832                                      
 Median :-0.8942                                      
 Mean   :-0.7636                                      
 3rd Qu.:-0.5861                                      
 Max.   : 0.2959                                      
 Average Time Domain BodyGyroJerk-Standard deviation-Z
 Min.   :-0.9954                                      
 1st Qu.:-0.9848                                      
 Median :-0.8610                                      
 Mean   :-0.7096                                      
 3rd Qu.:-0.4741                                      
 Max.   : 0.1932                                      
 Average Time Domain BodyAccMag-mean Average Time Domain BodyAccMag-Standard deviation
 Min.   :-0.9865                     Min.   :-0.9865                                  
 1st Qu.:-0.9573                     1st Qu.:-0.9430                                  
 Median :-0.4829                     Median :-0.6074                                  
 Mean   :-0.4973                     Mean   :-0.5439                                  
 3rd Qu.:-0.0919                     3rd Qu.:-0.2090                                  
 Max.   : 0.6446                     Max.   : 0.4284                                  
 Average Time Domain GravityAccMag-mean
 Min.   :-0.9865                       
 1st Qu.:-0.9573                       
 Median :-0.4829                       
 Mean   :-0.4973                       
 3rd Qu.:-0.0919                       
 Max.   : 0.6446                       
 Average Time Domain GravityAccMag-Standard deviation
 Min.   :-0.9865                                     
 1st Qu.:-0.9430                                     
 Median :-0.6074                                     
 Mean   :-0.5439                                     
 3rd Qu.:-0.2090                                     
 Max.   : 0.4284                                     
 Average Time Domain BodyAccJerkMag-mean
 Min.   :-0.9928                        
 1st Qu.:-0.9807                        
 Median :-0.8168                        
 Mean   :-0.6079                        
 3rd Qu.:-0.2456                        
 Max.   : 0.4345                        
 Average Time Domain BodyAccJerkMag-Standard deviation
 Min.   :-0.9946                                      
 1st Qu.:-0.9765                                      
 Median :-0.8014                                      
 Mean   :-0.5842                                      
 3rd Qu.:-0.2173                                      
 Max.   : 0.4506                                      
 Average Time Domain BodyGyroMag-mean
 Min.   :-0.9807                     
 1st Qu.:-0.9461                     
 Median :-0.6551                     
 Mean   :-0.5652                     
 3rd Qu.:-0.2159                     
 Max.   : 0.4180                     
 Average Time Domain BodyGyroMag-Standard deviation
 Min.   :-0.9814                                   
 1st Qu.:-0.9476                                   
 Median :-0.7420                                   
 Mean   :-0.6304                                   
 3rd Qu.:-0.3602                                   
 Max.   : 0.3000                                   
 Average Time Domain BodyGyroJerkMag-mean
 Min.   :-0.99732                        
 1st Qu.:-0.98515                        
 Median :-0.86479                        
 Mean   :-0.73637                        
 3rd Qu.:-0.51186                        
 Max.   : 0.08758                        
 Average Time Domain BodyGyroJerkMag-Standard deviation
 Min.   :-0.9977                                       
 1st Qu.:-0.9805                                       
 Median :-0.8809                                       
 Mean   :-0.7550                                       
 3rd Qu.:-0.5767                                       
 Max.   : 0.2502                                       
 Average Frequency Domain BodyAcc-mean-X Average Frequency Domain BodyAcc-mean-Y
 Min.   :-0.9952                         Min.   :-0.98903                       
 1st Qu.:-0.9787                         1st Qu.:-0.95361                       
 Median :-0.7691                         Median :-0.59498                       
 Mean   :-0.5758                         Mean   :-0.48873                       
 3rd Qu.:-0.2174                         3rd Qu.:-0.06341                       
 Max.   : 0.5370                         Max.   : 0.52419                       
 Average Frequency Domain BodyAcc-mean-Z
 Min.   :-0.9895                        
 1st Qu.:-0.9619                        
 Median :-0.7236                        
 Mean   :-0.6297                        
 3rd Qu.:-0.3183                        
 Max.   : 0.2807                        
 Average Frequency Domain BodyAcc-Standard deviation-X
 Min.   :-0.9966                                      
 1st Qu.:-0.9820                                      
 Median :-0.7470                                      
 Mean   :-0.5522                                      
 3rd Qu.:-0.1966                                      
 Max.   : 0.6585                                      
 Average Frequency Domain BodyAcc-Standard deviation-Y
 Min.   :-0.99068                                     
 1st Qu.:-0.94042                                     
 Median :-0.51338                                     
 Mean   :-0.48148                                     
 3rd Qu.:-0.07913                                     
 Max.   : 0.56019                                     
 Average Frequency Domain BodyAcc-Standard deviation-Z
 Min.   :-0.9872                                      
 1st Qu.:-0.9459                                      
 Median :-0.6441                                      
 Mean   :-0.5824                                      
 3rd Qu.:-0.2655                                      
 Max.   : 0.6871                                      
 Average Frequency Domain BodyAccJerk-mean-X
 Min.   :-0.9946                            
 1st Qu.:-0.9828                            
 Median :-0.8126                            
 Mean   :-0.6139                            
 3rd Qu.:-0.2820                            
 Max.   : 0.4743                            
 Average Frequency Domain BodyAccJerk-mean-Y
 Min.   :-0.9894                            
 1st Qu.:-0.9725                            
 Median :-0.7817                            
 Mean   :-0.5882                            
 3rd Qu.:-0.1963                            
 Max.   : 0.2767                            
 Average Frequency Domain BodyAccJerk-mean-Z
 Min.   :-0.9920                            
 1st Qu.:-0.9796                            
 Median :-0.8707                            
 Mean   :-0.7144                            
 3rd Qu.:-0.4697                            
 Max.   : 0.1578                            
 Average Frequency Domain BodyAccJerk-Standard deviation-X
 Min.   :-0.9951                                          
 1st Qu.:-0.9847                                          
 Median :-0.8254                                          
 Mean   :-0.6121                                          
 3rd Qu.:-0.2475                                          
 Max.   : 0.4768                                          
 Average Frequency Domain BodyAccJerk-Standard deviation-Y
 Min.   :-0.9905                                          
 1st Qu.:-0.9737                                          
 Median :-0.7852                                          
 Mean   :-0.5707                                          
 3rd Qu.:-0.1685                                          
 Max.   : 0.3498                                          
 Average Frequency Domain BodyAccJerk-Standard deviation-Z
 Min.   :-0.993108                                        
 1st Qu.:-0.983747                                        
 Median :-0.895121                                        
 Mean   :-0.756489                                        
 3rd Qu.:-0.543787                                        
 Max.   :-0.006236                                        
 Average Frequency Domain BodyGyro-mean-X Average Frequency Domain BodyGyro-mean-Y
 Min.   :-0.9931                          Min.   :-0.9940                         
 1st Qu.:-0.9697                          1st Qu.:-0.9700                         
 Median :-0.7300                          Median :-0.8141                         
 Mean   :-0.6367                          Mean   :-0.6767                         
 3rd Qu.:-0.3387                          3rd Qu.:-0.4458                         
 Max.   : 0.4750                          Max.   : 0.3288                         
 Average Frequency Domain BodyGyro-mean-Z
 Min.   :-0.9860                         
 1st Qu.:-0.9624                         
 Median :-0.7909                         
 Mean   :-0.6044                         
 3rd Qu.:-0.2635                         
 Max.   : 0.4924                         
 Average Frequency Domain BodyGyro-Standard deviation-X
 Min.   :-0.9947                                       
 1st Qu.:-0.9750                                       
 Median :-0.8086                                       
 Mean   :-0.7110                                       
 3rd Qu.:-0.4813                                       
 Max.   : 0.1966                                       
 Average Frequency Domain BodyGyro-Standard deviation-Y
 Min.   :-0.9944                                       
 1st Qu.:-0.9602                                       
 Median :-0.7964                                       
 Mean   :-0.6454                                       
 3rd Qu.:-0.4154                                       
 Max.   : 0.6462                                       
 Average Frequency Domain BodyGyro-Standard deviation-Z
 Min.   :-0.9867                                       
 1st Qu.:-0.9643                                       
 Median :-0.8224                                       
 Mean   :-0.6577                                       
 3rd Qu.:-0.3916                                       
 Max.   : 0.5225                                       
 Average Frequency Domain BodyAccMag-mean
 Min.   :-0.9868                         
 1st Qu.:-0.9560                         
 Median :-0.6703                         
 Mean   :-0.5365                         
 3rd Qu.:-0.1622                         
 Max.   : 0.5866                         
 Average Frequency Domain BodyAccMag-Standard deviation
 Min.   :-0.9876                                       
 1st Qu.:-0.9452                                       
 Median :-0.6513                                       
 Mean   :-0.6210                                       
 3rd Qu.:-0.3654                                       
 Max.   : 0.1787                                       
 Average Frequency Domain BodyBodyAccJerkMag-mean
 Min.   :-0.9940                                 
 1st Qu.:-0.9770                                 
 Median :-0.7940                                 
 Mean   :-0.5756                                 
 3rd Qu.:-0.1872                                 
 Max.   : 0.5384                                 
 Average Frequency Domain BodyBodyAccJerkMag-Standard deviation
 Min.   :-0.9944                                               
 1st Qu.:-0.9752                                               
 Median :-0.8126                                               
 Mean   :-0.5992                                               
 3rd Qu.:-0.2668                                               
 Max.   : 0.3163                                               
 Average Frequency Domain BodyBodyGyroMag-mean
 Min.   :-0.9865                              
 1st Qu.:-0.9616                              
 Median :-0.7657                              
 Mean   :-0.6671                              
 3rd Qu.:-0.4087                              
 Max.   : 0.2040                              
 Average Frequency Domain BodyBodyGyroMag-Standard deviation
 Min.   :-0.9815                                            
 1st Qu.:-0.9488                                            
 Median :-0.7727                                            
 Mean   :-0.6723                                            
 3rd Qu.:-0.4277                                            
 Max.   : 0.2367                                            
 Average Frequency Domain BodyBodyGyroJerkMag-mean
 Min.   :-0.9976                                  
 1st Qu.:-0.9813                                  
 Median :-0.8779                                  
 Mean   :-0.7564                                  
 3rd Qu.:-0.5831                                  
 Max.   : 0.1466                                  
 Average Frequency Domain BodyBodyGyroJerkMag-Standard deviation
 Min.   :-0.9976                                                
 1st Qu.:-0.9802                                                
 Median :-0.8941                                                
 Mean   :-0.7715                                                
 3rd Qu.:-0.6081                                                
 Max.   : 0.2878 