Mahrukh Jaura

For this exam we will use a new (to you) dataset, an update of NHIS. We will look at estimates of 
whether people worked for an employer that offered health insurance, EMPHI. The data is available on Slack.
(Note that in data, NIU is "Not in Universe" so for instance if people are asked if their employer offers health 
insurance then somebody not working would be NIU.)

------------------------------Question 1------------------------------
I have run crosstabs on a subset of the data (so you cannot replicate, just use this info provided). 
These give verbose summary of whether employer offers health insurance by educational qualification and 
whether person is full or part time worker. Form a hypothesis test of the form, "people with *various* 
educational qualifications who are *full or parttime* have different fraction offered health insurance." 
I expect that you will choose different ways to operationalize educational qualification (compare above some
level with below that level, but what level?). You can choose how to deal with NA and similar responses. I 
expect that different people may choose different levels of significance. Please provide estimate, standard 
error, t-stat and a p-value for the hypothesis test and a confidence interval. __Write a short paragraph__ 
explaining the test (carefully noting what is the null hypothesis) and explaining the results of that test.

Null Hypothesis: People with at least a bachelors degree who work fulltime have no difference in the fraction of people who are offered health insurance than those who work part time with at least a bachelors degree.
Alternative Hypothesis: People with at least a bachelors degree who work fulltime have a different fraction of people who are offered health insurance than those who work part time with at least a bachelors degree.

Significance Level = 0.05
#This means that there is a 5% chance that I can accept the alternative hypothesis when the null hypothesis is actually true. 
#The smaller the significance level, the greater the burden of proof needed to reject the null hypothesis, or in other words, to support the alternative hypothesis.

Offered_HI <- data_NHIS$EMPHI == "yes workplace offer health insurance"
Question_1_Regression <- lm(Offered_HI ~ EDUC*EMPFT)
summary(Question_1_Regression)

Call:
  lm(formula = Offered_HI ~ EDUC * EMPFT)

Residuals:
  Min      1Q  Median      3Q     Max 
-0.8897  0.0000  0.0000  0.1524  0.8889 

Coefficients: (25 not defined because of singularities)
                                              Estimate Std. Error t value Pr(>|t|)    
(Intercept)                                  2.239e-15  3.599e-03   0.000 1.000000 
EDUCbachelors:EMPFTparttime                 -1.616e-01  9.939e-02  -1.626 0.103929 
EDUCmasters:EMPFTparttime                   -1.472e-01  1.002e-01  -1.469 0.141749   
EDUCprofessional degree:EMPFTparttime       -4.444e-02  1.089e-01  -0.408 0.683286 
EDUCdoctoral:EMPFTparttime                  -7.458e-02  1.055e-01  -0.707 0.479510 
EDUCbachelors:EMPFTfulltime                  3.226e-01  5.754e-02   5.606 2.09e-08 ***
EDUCmasters:EMPFTfulltime                    3.647e-01  5.794e-02   6.294 3.12e-10 ***
EDUCprofessional degree:EMPFTfulltime        2.917e-01  6.311e-02   4.622 3.81e-06 ***
EDUCdoctoral:EMPFTfulltime                   3.621e-01  6.171e-02   5.868 4.44e-09 ***

  ---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.2739 on 37293 degrees of freedom
Multiple R-squared:  0.6624,	Adjusted R-squared:  0.6618 
F-statistic:  1143 on 64 and 37293 DF,  p-value: < 2.2e-16

The regression model provided the estimate, standard error, t-value, and p-value for all the coefficients which include
each level of education, each level of employment, each level of education*each level of employment. The coefficients above
represent the relevant information to my hypothesis which compares the fraction of people offered health insurance based on their 
education and employment status, i.e., part-time or full-time. Specifically, I focused on the people with at least a bachelors degree
whow ork full-time and those who work part-time with at least a bachelors degree. Based on the regression output, the results for the 
people who have a bachelors, masters, a professional degree, or a doctorates and work full-time are significant at 0.001 which indicates that 
there is a significant difference in the people offered health insurance between people with at least a bachelors degree who work fulltime and 
people with at least a bachelors degree who work part time. Therefore, we can reject the null hypothesis and accept the alternative hypothesis!
  
  ------------------------------Question 2------------------------------ 


