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
Using a subset of the data (so you can do this question without R), the following coefficients are estimated in a logit model where employer offering health insurance depends on $Age$, $Age^2$, $Female$, and interaction of $Female$ with the age terms.

Variable       | Coeff    | Std Error
-------------- | -------  | ----------
  $Age$          | -0.019   | 0.0018
$Age^2$        | 0.00002  | 0.000002
$Female$       | -0.470   | 0.1206
$Age*Female$   | 0.0082   | 0.0026
$Age^2*Female$ | -0.00001 | 0.000003
$Constant$     | 1.84     | 0.09

a. What is the predicted probability that a 30-year-old person (not a female) will have a job with benefits?
  P = (1/(1+e^(-)((-0.019)(30) + (0.00002)(30^2) + (-0.470)(0) + (0.0082)(0) + (-0.00001)(0) + 1.84))
  P = 0.08106
b. What is the predicted probability that a 30-year-old female person will have a job with benefits?
  P = (1/(1+e^(-)((-0.019)(30) + (0.00002)(30^2) + (-0.470)(30) + (0.0082)(30) + (-0.00001)(30) + 1.84))
  P = 0.0989
c. Describe and explain the impact of the squared age terms in the model, for male and female.
  Essentially, incorporating Age^2 to age, allows us to model the effect of differing ages, rather than 
  assuming that the effect is linear for all ages, which also may have a non-linear relationship with the independent variable.
  Specifically, more often than not, regression models can be approximated through use of a polynomial so including Age^2 and Age^3
  lets us estimate the coefficients for the approximation for a known/unknown non-linear function of x, which is Age, in this model.
  Testing and observing these coefficients allows us to test if the relationship is reasonably linear of if non-linear terms 
  would be better off to use in the model. 

  ------------------------------Question 3------------------------------ 
Now do your own analysis using "NHIS2020_data.RData". Explore likelihood of people working at a job that offers health insurance, or choose a different topic if you would like. The data includes information on region, whether urban or rural area, usual hours of work, 
fulltime or parttime, health status, height, weight and BMI, along with demographics like age, race/ethnicity, gender, sexual orientation, family size, marital status, whether served in armed forces, citizenship with years in US, and household income.  
+ Choose a subgroup of the sample to consider and provide summary statistics of that subgroup. Explain why this subgroup is interesting.
+ Form a hypothesis test about an interesting variable, explore whether your chosen subgroup differs from the rest of sample. Please provide both a p-value for the hypothesis test and a confidence interval.
  Write a short paragraph explaining the test (carefully noting what is the null hypothesis) and explaining the results of that test.
+ With a linear probability model (OLS), can you find relevant information to predict an interesting outcome? How good is the model? Discuss. 
  Include hypothesis tests about individual or joint coefficient values. Include some predicted values.
+ Now how does a logit model perform? What additional information can you learn from that? Discuss. Include hypothesis tests about individual or joint coefficient values.
  Include some predicted values. Can you estimate some other models? What is the marginal value of those? Impress me.

