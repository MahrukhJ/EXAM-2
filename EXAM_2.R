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


#Subgroup
My subgroup will consist of people who are between the ages of 18 and 65 and live in the Northeast. 
use_varb <- (AGE >= 18) & (AGE <= 65) & (REGION == "Northeast") & (HOURSWRK >= 35)
dat_use <- subset(data_NHIS,use_varb)
summary(dat_use)
detach(data_NHIS)
attach(dat_use)
#Some Stats
table(dat_use$RACEA,dat_use$EDUC)
" NIU no school less than hs 12th grade no diploma HS diploma GED some college
  white             0         1           65                    23        640  51          359
  Black             0         1           34                     7        103  11           63
  Aleut Alaskan     0         0            3                     0          6   0            1
  American Indian   0         0            1                     0          3   3            1
  Asian             0         0            9                     5         41   3           19
  Other             0         0            3                     1          8   0            5
  refused           0         0            0                     0          0   0            1
  not ascertained   0         0           32                     6         51   5           29
  unknown           0         0            0                     0          0   0            0
                 
                  assoc deg in tech or occ assoc deg academic bachelors masters professional degree doctoral
  white                                 85                273       833     476                  47       78
  Black                                 13                 44        74      42                   4        5
  Aleut Alaskan                          1                  1         2       0                   1        0
  American Indian                        0                  5         4       3                   0        0
  Asian                                  1                  6        92      70                   5       17
  Other                                  2                  2        16       6                   0        1
  refused                                0                  0         1       0                   1        0
  not ascertained                        5                 14        21       4                   1        0
  unknown                                0                  1         0       0                   0        0
                 
                  refused dont know
  white                 5         8
  Black                 1         5
  Aleut Alaskan         0         0
  American Indian       0         0
  Asian                 1         0
  Other                 0         0
  refused               0         0
  not ascertained       0         1
  unknown               0         0"

summary(EMPSTAT)
"         NIU     Employed not employed    dont know 
           0         2817          926          129"
summary(HOURSWRK)
"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
      0       0      40      29      40      95      32"
summary(EMPFT)
"     NIU  parttime  fulltime   refused        NA dont know 
     1055       390      2403         4        17         3"

#Forming a hypothesis test and OLS Model

In a multiple regression model, the null hypothesis simply states that there is no relationship between the dependent(X) and independent(Y) variables.
The alternative hypothesis states that there is a significant relationship between the X and Y variables. In the regression below, the dependent variable is
a wokrplace that offers health insurance and the independent variables are AGE, SEX, EDUC, RACEA, HOURSWRK and FAMTOTINC. Therefore, the null hypothesis is that 
there is no relationship between YES_HINSURANCE and AGE + SEX + EDUC + RACEA + HOURSWRK + FAMTOTINC. The alternative hypothesis is that there is a signficant 
relationship between YES_HINSURANCE and AGE + SEX + EDUC + RACEA + HOURSWRK + FAMTOTINC.


YES_HINSURANCE <- dat_use$EMPHI == "yes workplace offer health insurance"
is.na(YES_HINSURANCE) <- which(dat_use$EMPHI == "yes workplace offer health insurance")

model_OLS_Q3 <- lm(YES_HINSURANCE ~ AGE + SEX + EDUC + RACEA + CITIZEN + FAMTOTINC)
summary(model_OLS_Q3)

"lm(formula = YES_HINSURANCE ~ AGE + SEX + EDUC + RACEA + CITIZEN + 
    FAMTOTINC)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.0587 -0.4448  0.1565  0.3915  0.9258 

Coefficients:
                               Estimate Std. Error t value Pr(>|t|)    
(Intercept)                   5.339e-01  3.242e-01   1.647   0.0996 .  
AGE                          -3.380e-03  5.722e-04  -5.907 3.78e-09 ***
SEXFemale                    -6.108e-02  1.484e-02  -4.115 3.96e-05 ***
SEXdont know                  4.500e-01  4.572e-01   0.984   0.3251    
EDUCless than hs             -3.236e-01  3.261e-01  -0.992   0.3210    
EDUC12th grade no diploma    -3.231e-01  3.316e-01  -0.974   0.3299    
EDUCHS diploma               -1.379e-01  3.244e-01  -0.425   0.6708    
EDUCGED                      -1.258e-01  3.285e-01  -0.383   0.7018    
EDUCsome college             -1.986e-01  3.248e-01  -0.612   0.5409    
EDUCassoc deg in tech or occ -7.309e-02  3.270e-01  -0.223   0.8232    
EDUCassoc deg academic       -4.893e-02  3.250e-01  -0.151   0.8803    
EDUCbachelors                -2.223e-02  3.244e-01  -0.069   0.9454    
EDUCmasters                   7.324e-02  3.246e-01   0.226   0.8215    
EDUCprofessional degree       6.755e-02  3.296e-01   0.205   0.8376    
EDUCdoctoral                  1.022e-01  3.273e-01   0.312   0.7548    
EDUCrefused                  -4.754e-02  3.671e-01  -0.130   0.8970    
EDUCdont know                -2.095e-01  3.459e-01  -0.605   0.5449    
RACEABlack                    6.302e-02  2.464e-02   2.557   0.0106 *  
RACEAAleut Alaskan            3.460e-02  1.187e-01   0.292   0.7706    
RACEAAmerican Indian         -1.096e-01  1.029e-01  -1.066   0.2867    
RACEAAsian                   -6.914e-02  3.056e-02  -2.262   0.0237 *  
RACEAOther                   -6.259e-03  6.952e-02  -0.090   0.9283    
RACEArefused                  7.524e-02  2.644e-01   0.285   0.7760    
RACEAnot ascertained          4.946e-02  3.789e-02   1.305   0.1919    
RACEAunknown                  2.719e-01  4.570e-01   0.595   0.5519    
CITIZENyes US citizen         1.648e-01  3.084e-02   5.343 9.69e-08 ***
CITIZENrefused               -3.680e-02  1.359e-01  -0.271   0.7866    
CITIZENNA                    -4.149e-01  5.531e-02  -7.502 7.77e-14 ***
CITIZENdont know              3.806e-01  3.258e-01   1.168   0.2428    
FAMTOTINC                     1.374e-06  1.198e-07  11.468  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.4562 on 3842 degrees of freedom
Multiple R-squared:  0.1644,	Adjusted R-squared:  0.1581 
F-statistic: 26.07 on 29 and 3842 DF,  p-value: < 2.2e-16"

#confidence intervals
confint(model_OLS_Q3)
"                                 2.5 %        97.5 %
(Intercept)                  -1.016307e-01  1.169460e+00
AGE                          -4.501531e-03 -2.258031e-03
SEXFemale                    -9.017639e-02 -3.197495e-02
SEXdont know                 -4.463507e-01  1.346288e+00
EDUCless than hs             -9.629056e-01  3.156636e-01
EDUC12th grade no diploma    -9.731021e-01  3.269600e-01
EDUCHS diploma               -7.739199e-01  4.981137e-01
EDUCGED                      -7.697919e-01  5.182517e-01
EDUCsome college             -8.353224e-01  4.380970e-01
EDUCassoc deg in tech or occ -7.142440e-01  5.680733e-01
EDUCassoc deg academic       -6.861647e-01  5.883047e-01
EDUCbachelors                -6.581861e-01  6.137260e-01
EDUCmasters                  -5.631034e-01  7.095882e-01
EDUCprofessional degree      -5.786261e-01  7.137290e-01
EDUCdoctoral                 -5.393879e-01  7.438645e-01
EDUCrefused                  -7.672409e-01  6.721645e-01
EDUCdont know                -8.877093e-01  4.688019e-01
RACEABlack                    1.470268e-02  1.113301e-01
RACEAAleut Alaskan           -1.980371e-01  2.672336e-01
RACEAAmerican Indian         -3.113152e-01  9.207563e-02
RACEAAsian                   -1.290583e-01 -9.214058e-03
RACEAOther                   -1.425657e-01  1.300471e-01
RACEArefused                 -4.431275e-01  5.936136e-01
RACEAnot ascertained         -2.483441e-02  1.237530e-01
RACEAunknown                 -6.241069e-01  1.167974e+00
CITIZENyes US citizen         1.042945e-01  2.252102e-01
CITIZENrefused               -3.033136e-01  2.297164e-01
CITIZENNA                    -5.233607e-01 -3.064854e-01
CITIZENdont know             -2.582089e-01  1.019396e+00
FAMTOTINC                     1.139101e-06  1.608882e-06"

#Joint Test:
The F distribution is a ratio of two chi-square random variables and that, as the number of observations increases, the F-distribution comes to resemble the chi-square distribution. 
The F-test of overall significance indicates whether the linear regression model provides a better fit to the data than a model that contains no independent variables. From the regression, the F-Statistic output is:
"F-statistic: 26.07 on 29 and 3842 DF,  p-value: < 2.2e-16" and at a significance level of 0.05, the p-value of <2.2e-16 is not significant. Therefore, we reject the null hypothesis that there is no relationship 
between the dependent and the indpendent variables and accept the alternative hypothesis that there is a significant relationship between YES_HINSURANCE and AGE + SEX + EDUC + RACEA + HOURSWRK + FAMTOTINC. 

#Observing the output:
Interestingly there were only 8 significant coefficients in this regression: Intercept, AGE, SEXFemale, RACEABlack, RACEAAsian, CITIZENyes US citizen, CITIZENNA, and FAMTOTINC. 
Intercept is significant at 0.1, RACEABlack and RACEAAsian are significant at 0.05, and AGE, SEXFemale, CITIZENyes US citizen, CITIZENNA & FAMTOTINC are significant at 0.001. 
To note, the smaller the significance level, the greater the burden of proof needed to reject the null hypothesis which indicates thatAGE, SEXFemale, CITIZENyes US citizen, CITIZENNA & FAMTOTINC
are greatly significant in my regression model!

#Predicted Probabilities:
to_be_predicted2 <- data.frame(SEX= "Male", EDUC= "bachelors", RACEA= "white", CITIZEN= "yes US citizen")
to_be_predicted2$yhat <- predict(model_OLS_Q3, newdata = to_be_predicted2)
summary(to_be_predicted2$yhat)
"Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.2501  0.2501  0.2501  0.2501  0.2501  0.2501" 
to_be_predicted2 <- data.frame(SEX= "Female", EDUC= "bachelors", RACEA= "Black", CITIZEN= "yes US citizen")
to_be_predicted2$yhat <- predict(model_OLS_Q3, newdata = to_be_predicted2)
summary(to_be_predicted2$yhat)
"Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.3441  0.3441  0.3441  0.3441  0.3441  0.3441"

#Logit
model_logit_Q3 <- glm(YES_HINSURANCE ~ AGE + SEX + EDUC + RACEA + CITIZEN + FAMTOTINC, family = binomial, data = dat_use)
summary(model_logit_Q3)
"Call:
glm(formula = YES_HINSURANCE ~ AGE + SEX + EDUC + RACEA + CITIZEN + 
    FAMTOTINC)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-1.0587  -0.4448   0.1565   0.3915   0.9258  

Coefficients:
                               Estimate Std. Error t value Pr(>|t|)    
(Intercept)                   5.339e-01  3.242e-01   1.647   0.0996 .  
AGE                          -3.380e-03  5.722e-04  -5.907 3.78e-09 ***
SEXFemale                    -6.108e-02  1.484e-02  -4.115 3.96e-05 ***
SEXdont know                  4.500e-01  4.572e-01   0.984   0.3251    
EDUCless than hs             -3.236e-01  3.261e-01  -0.992   0.3210    
EDUC12th grade no diploma    -3.231e-01  3.316e-01  -0.974   0.3299    
EDUCHS diploma               -1.379e-01  3.244e-01  -0.425   0.6708    
EDUCGED                      -1.258e-01  3.285e-01  -0.383   0.7018    
EDUCsome college             -1.986e-01  3.248e-01  -0.612   0.5409    
EDUCassoc deg in tech or occ -7.309e-02  3.270e-01  -0.223   0.8232    
EDUCassoc deg academic       -4.893e-02  3.250e-01  -0.151   0.8803    
EDUCbachelors                -2.223e-02  3.244e-01  -0.069   0.9454    
EDUCmasters                   7.324e-02  3.246e-01   0.226   0.8215    
EDUCprofessional degree       6.755e-02  3.296e-01   0.205   0.8376    
EDUCdoctoral                  1.022e-01  3.273e-01   0.312   0.7548    
EDUCrefused                  -4.754e-02  3.671e-01  -0.130   0.8970    
EDUCdont know                -2.095e-01  3.459e-01  -0.605   0.5449    
RACEABlack                    6.302e-02  2.464e-02   2.557   0.0106 *  
RACEAAleut Alaskan            3.460e-02  1.187e-01   0.292   0.7706    
RACEAAmerican Indian         -1.096e-01  1.029e-01  -1.066   0.2867    
RACEAAsian                   -6.914e-02  3.056e-02  -2.262   0.0237 *  
RACEAOther                   -6.259e-03  6.952e-02  -0.090   0.9283    
RACEArefused                  7.524e-02  2.644e-01   0.285   0.7760    
RACEAnot ascertained          4.946e-02  3.789e-02   1.305   0.1919    
RACEAunknown                  2.719e-01  4.570e-01   0.595   0.5519    
CITIZENyes US citizen         1.648e-01  3.084e-02   5.343 9.69e-08 ***
CITIZENrefused               -3.680e-02  1.359e-01  -0.271   0.7866    
CITIZENNA                    -4.149e-01  5.531e-02  -7.502 7.77e-14 ***
CITIZENdont know              3.806e-01  3.258e-01   1.168   0.2428    
FAMTOTINC                     1.374e-06  1.198e-07  11.468  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for gaussian family taken to be 0.2080906)

    Null deviance: 956.83  on 3871  degrees of freedom
Residual deviance: 799.48  on 3842  degrees of freedom
AIC: 4941.9

Number of Fisher Scoring iterations: 2"

The output for the OLs model and the logit model are very similar, in fact, the significant coefficients are identical and significance tests at alpha = 0.05 provided identical decisions. OLS and logistic predicted values were highly correlated.
to_be_predicted2 <- data.frame(SEX= "Male", EDUC= "bachelors", RACEA= "white", CITIZEN= "yes US citizen")
to_be_predicted2$yhat <- predict(model_logit_Q3, newdata = to_be_predicted2)
summary(to_be_predicted2$yhat)
to_be_predicted2 <- data.frame(SEX= "Female", EDUC= "bachelors", RACEA= "Black", CITIZEN= "yes US citizen")
to_be_predicted2$yhat <- predict(model_logit_Q3, newdata = to_be_predicted2)
summary(to_be_predicted2$yhat)

^In a rush, dont have time to copy paste!

#Can you estimate some other models?
  
'Doing a quick regression where I will attempt to test family income, dependent variable and the effect CITIZEN + EDUC + SEX(independent variables) have'
model2 <- lm(FAMTOTINC ~ CITIZEN + EDUC + SEX)
summary(model2)
"lm(formula = FAMTOTINC ~ CITIZEN + EDUC + SEX)

Residuals:
    Min      1Q  Median      3Q     Max 
-166306  -43953  -13397   34377  207279 

Coefficients:
                             Estimate Std. Error t value Pr(>|t|)    
(Intercept)                     92566      43824   2.112   0.0347 *  
CITIZENyes US citizen           22903       3945   5.806 6.93e-09 ***
CITIZENrefused                  -6345      18432  -0.344   0.7307    
CITIZENNA                       29087       7431   3.914 9.23e-05 ***
CITIZENdont know                -3350      44224  -0.076   0.9396    
EDUCless than hs               -67183      44224  -1.519   0.1288    
EDUC12th grade no diploma      -51099      44972  -1.136   0.2559    
EDUCHS diploma                 -37778      44016  -0.858   0.3908    
EDUCGED                        -59428      44566  -1.333   0.1824    
EDUCsome college               -32072      44065  -0.728   0.4668    
EDUCassoc deg in tech or occ   -36463      44378  -0.822   0.4113    
EDUCassoc deg academic         -17928      44108  -0.406   0.6844    
EDUCbachelors                   10551      44009   0.240   0.8105    
EDUCmasters                     27511      44035   0.625   0.5322    
EDUCprofessional degree         60837      44706   1.361   0.1737    
EDUCdoctoral                    43931      44390   0.990   0.3224    
EDUCrefused                    -17636      49829  -0.354   0.7234    
EDUCdont know                  -54366      46964  -1.158   0.2471    
SEXFemale                      -12068       2003  -6.024 1.86e-09 ***
SEXdont know                   -62491      62006  -1.008   0.3136    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 61960 on 3852 degrees of freedom
Multiple R-squared:  0.2079,	Adjusted R-squared:  0.204 
F-statistic: 53.21 on 19 and 3852 DF,  p-value: < 2.2e-16"

to_be_predicted2 <- data.frame(CITIZEN= "yes US citizen", EDUC= "bachelors", SEX= "Female")
to_be_predicted2$yhat <- predict(model2, newdata = to_be_predicted2)
summary(to_be_predicted2$yhat)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
113953  113953  113953  113953  113953  113953 

to_be_predicted2 <- data.frame(CITIZEN= "No not US citizen", EDUC= "professional degree", SEX= "Female")
to_be_predicted2$yhat <- predict(model2, newdata = to_be_predicted2)
summary(to_be_predicted2$yhat)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
141335  141335  141335  141335  141335  141335

-----
model_logit_Q3 <- glm(YES_HINSURANCE ~ AGE + SEX + EDUC + RACEA + CITIZEN + FAMTOTINC, family = binomial, data = dat_use)

d_YES_HINSURANCE <- data.frame(model.matrix(~ dat_use$EMPHI))
d_age <- data.frame(model.matrix(~ dat_use$AGE))
d_sex <- data.frame(model.matrix(~ dat_use$SEX))
d_educ <- data.frame(model.matrix(~ dat_use$EDUC))
d_race <- data.frame(model.matrix(~ dat_use$RACEA))
d_citizen <- data.frame(model.matrix(~ dat_use$CITIZEN))
d_famtotinc <- data.frame(model.matrix(~ dat_use$FAMTOTINC))

levels(dat_use$AGE)
levels(dat_use$SEX)
levels(dat_use$EDUC)
levels(dat_use$RACEA)
levels(dat_use$CITIZEN)
levels(dat_use$FAMTOTINC)

dat_for_analysis_sub <- data.frame(
  d_YES_HINSURANCE[,2],
  d_sex[!is.na(dat_use1$vaxx),2:4],
  d_educ[!is.na(dat_use1$vaxx),2:13],
  d_race[!is.na(dat_use1$vaxx),2:9],
  d_citizen[!is.na(dat_use1$vaxx),2:5]
  )

  summary(dat_for_analysis_sub)
  names(dat_for_analysis_sub) <- sub("...2.","",names(dat_for_analysis_sub))
  names(dat_for_analysis_sub) <- sub("..is.na.dat.use.","",names(dat_for_analysis_sub))
  names(dat_for_analysis_sub) <- sub("dat_use.","",names(dat_for_analysis_sub))

  require("standardize")
  set.seed(654321)
  NN <- length(dat_for_analysis_sub$d_YES_HINSURANCE)
  restrict_1 <- (runif(NN) < 0.5) 
  summary(restrict_1)
  dat_train <- subset(dat_for_analysis_sub, restrict_1)
  dat_test <- subset(dat_for_analysis_sub, !restrict_1)
  sobj <- standardize(d_YES_HINSURANCE ~ 'my code above did not work and I am running out of time but the variables from dat_for_analysis_sub would go here after standardized', dat_train, family = binomial)
  
  #linear
s_dat_test <- predict(sobj, dat_test)
summary(s_dat_test)
model_lpm1 <- lm(sobj$formula, data = sobj$data)
summary(model_lpm1)
pred_vals_lpm <- predict(model_lpm1, s_dat_test)
pred_model_lpm1 <- (pred_vals_lpm > mean(pred_vals_lpm))
table(pred = pred_model_lpm1, true = dat_test$d_YES_HINSURANCE)

# logit 
model_logit1 <- glm(sobj$formula, family = binomial, data = sobj$data)
summary(model_logit1)
pred_vals <- predict(model_logit1, s_dat_test, type = "response")
pred_model_logit1 <- (pred_vals > 0.5)
table(pred = pred_model_logit1, true = dat_test$d_YES_HINSURANCE)

Then to plot:
  
  require('randomForest')
set.seed(54321)
model_randFor <- randomForest(as.factor(d_YES_HINSURANCE) ~ ., data = sobj$data, importance=TRUE, proximity=TRUE)
print(model_randFor)
round(importance(model_randFor),2)
varImpPlot(model_randFor)
# look at confusion matrix for this too
pred_model1 <- predict(model_randFor,  s_dat_test)
table(pred = pred_model1, true = dat_test$d_YES_HINSURANCE)

require(e1071)
svm.model <- svm(as.factor(vaxx) ~ ., data = sobj$data, cost = 1, gamma = 0.1)
svm.pred <- predict(svm.model, s_dat_test)
table(pred = svm.pred, true = dat_test$d_YES_HINSURANCE)
require(glmnet)
model1_elasticnet <-  glmnet(as.matrix(sobj$data[,-1]),sobj$data$d_YES_HINSURANCE)
cvmodel1_elasticnet = cv.glmnet(data.matrix(sobj$data[,-1]),data.matrix(sobj$data$d_YES_HINSURANCE)) 
cvmodel1_elasticnet$lambda.min
log(cvmodel1_elasticnet$lambda.min)
coef(cvmodel1_elasticnet, s = "lambda.min")

pred1_elasnet <- predict(model1_elasticnet, newx = data.matrix(s_dat_test), s = cvmodel1_elasticnet$lambda.min)
pred_model1_elasnet <- (pred1_elasnet < mean(pred1_elasnet)) 
table(pred = pred_model1_elasnet, true = dat_test$d_YES_HINSURANCE)

model2_elasticnet <-  glmnet(as.matrix(sobj$data[,-1]),sobj$data$d_YES_HINSURANCE, alpha = 0) 
# or try different alpha values to see if you can improve
print(model2_elasticnet)

require(spikeslab)
set.seed(54321)
model1_spikeslab <- spikeslab(sobj$formula, data = sobj$data)
summary(model1_spikeslab)
print(model1_spikeslab)
plot(model1_spikeslab)

