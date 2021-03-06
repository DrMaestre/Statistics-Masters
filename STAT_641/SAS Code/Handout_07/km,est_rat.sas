*longneck/reliability/kmest_rat.sas;
option ls=75 ps=55 nocenter nodate;          
title 'Cancer Treatment-Estimated S(t)';   
data cancer; 
input T ST G @@; 
LGT=log(T); 
label ST = 'Censoring Indicator';
label T  = 'Time to Death';
label G  = 'Treatment Group';
cards;
143 1 1 164 1 1 188 1 1 188 1 1 190 1 1 192 1 1 206 1 1
209 1 1 213 1 1 216 1 1 220 1 1 227 1 1 230 1 1 234 1 1
246 1 1 265 1 1 304 1 1 216 0 1 244 0 1
142 1 2 156 1 2 163 1 2 198 1 2 205 1 2 232 1 2 232 1 2
233 1 2 233 1 2 233 1 2 233 1 2 239 1 2 240 1 2 261 1 2
280 1 2 280 1 2 296 1 2 296 1 2 323 1 2 204 0 2 344 0 2
run;
proc lifetest data=cancer outsurv=a plots=(s);
 time  T*ST(0);
 strata G;
run;
proc print data=a;
run;




































Cancer Treatment-Estimated S(t)                                           1

The LIFETEST Procedure

                          Stratum 1: G = 1

                   Product-Limit Survival Estimates

                                     Survival
                                     Standard     Number      Number
       T     Survival    Failure      Error       Failed       Left

   0.000       1.0000           0           0        0          19
 143.000       0.9474      0.0526      0.0512        1          18
 164.000       0.8947      0.1053      0.0704        2          17
 188.000            .           .           .        3          16
 188.000       0.7895      0.2105      0.0935        4          15
 190.000       0.7368      0.2632      0.1010        5          14
 192.000       0.6842      0.3158      0.1066        6          13
 206.000       0.6316      0.3684      0.1107        7          12
 209.000       0.5789      0.4211      0.1133        8          11
 213.000       0.5263      0.4737      0.1145        9          10
 216.000       0.4737      0.5263      0.1145       10           9
 216.000*           .           .           .       10           8
 220.000       0.4145      0.5855      0.1145       11           7
 227.000       0.3553      0.6447      0.1124       12           6
 230.000       0.2961      0.7039      0.1082       13           5
 234.000       0.2368      0.7632      0.1015       14           4
 244.000*           .           .           .       14           3
 246.000       0.1579      0.8421      0.0934       15           2
 265.000       0.0789      0.9211      0.0728       16           1
 304.000            0      1.0000           0       17           0

NOTE: The marked survival times are censored observations.


Summary Statistics for Time Variable T

             Quartile Estimates

             Point     95% Confidence Interval
Percent    Estimate      [Lower      Upper)

     75     234.000     216.000     265.000
     50     216.000     192.000     234.000
     25     190.000     188.000     216.000


    Mean    Standard Error

 218.757             9.403

Cancer Treatment-Estimated S(t)                                           2

The LIFETEST Procedure

                          Stratum 2: G = 2

                   Product-Limit Survival Estimates

                                     Survival
                                     Standard     Number      Number
       T     Survival    Failure      Error       Failed       Left

   0.000       1.0000           0           0        0          21
 142.000       0.9524      0.0476      0.0465        1          20
 156.000       0.9048      0.0952      0.0641        2          19
 163.000       0.8571      0.1429      0.0764        3          18
 198.000       0.8095      0.1905      0.0857        4          17
 204.000*           .           .           .        4          16
 205.000       0.7589      0.2411      0.0941        5          15
 232.000            .           .           .        6          14
 232.000       0.6577      0.3423      0.1053        7          13
 233.000            .           .           .        8          12
 233.000            .           .           .        9          11
 233.000            .           .           .       10          10
 233.000       0.4554      0.5446      0.1114       11           9
 239.000       0.4048      0.5952      0.1099       12           8
 240.000       0.3542      0.6458      0.1072       13           7
 261.000       0.3036      0.6964      0.1031       14           6
 280.000            .           .           .       15           5
 280.000       0.2024      0.7976      0.0902       16           4
 296.000            .           .           .       17           3
 296.000       0.1012      0.8988      0.0678       18           2
 323.000       0.0506      0.9494      0.0493       19           1
 344.000*           .           .           .       19           0

NOTE: The marked survival times are censored observations.


Summary Statistics for Time Variable T

             Quartile Estimates

             Point     95% Confidence Interval
Percent    Estimate      [Lower      Upper)

     75     280.000     233.000     296.000
     50     233.000     232.000     280.000
     25     232.000     163.000     233.000


    Mean    Standard Error

 240.795            11.206




      Summary of the Number of Censored and Uncensored Values

                                                            Percent
Stratum               G       Total  Failed    Censored    Censored

      1               1          19      17           2       10.53
      2               2          21      19           2        9.52
-------------------------------------------------------------------
  Total                          40      36           4       10.00


Cancer Treatment-Estimated S(t)                                           5

Obs    G      T    _CENSOR_    SURVIVAL    SDF_LCL    SDF_UCL    STRATUM

  1    1      0        0        1.00000    1.00000    1.00000       1
  2    1    143        0        0.94737    0.84696    1.00000       1
  3    1    164        0        0.89474    0.75674    1.00000       1
  4    1    188        0        0.78947    0.60616    0.97279       1
  5    1    190        0        0.73684    0.53884    0.93484       1
  6    1    192        0        0.68421    0.47520    0.89322       1
  7    1    206        0        0.63158    0.41468    0.84848       1
  8    1    209        0        0.57895    0.35694    0.80095       1
  9    1    213        0        0.52632    0.30180    0.75083       1
 10    1    216        0        0.47368    0.24917    0.69820       1
 11    1    216        1        0.47368     .          .            1
 12    1    220        0        0.41447    0.19003    0.63892       1
 13    1    227        0        0.35526    0.13491    0.57561       1
 14    1    230        0        0.29605    0.08406    0.50805       1
 15    1    234        0        0.23684    0.03800    0.43568       1
 16    1    244        1        0.23684     .          .            1
 17    1    246        0        0.15789    0.00000    0.34102       1
 18    1    265        0        0.07895    0.00000    0.22162       1
 19    1    304        0        0.00000    0.00000    0.00000       1
 20    2      0        0        1.00000    1.00000    1.00000       2
 21    2    142        0        0.95238    0.86130    1.00000       2
 22    2    156        0        0.90476    0.77921    1.00000       2
 23    2    163        0        0.85714    0.70748    1.00000       2
 24    2    198        0        0.80952    0.64158    0.97747       2
 25    2    204        1        0.80952     .          .            2
 26    2    205        0        0.75893    0.57451    0.94335       2
 27    2    232        0        0.65774    0.45136    0.86411       2
 28    2    233        0        0.45536    0.23708    0.67363       2
 29    2    239        0        0.40476    0.18939    0.62014       2
 30    2    240        0        0.35417    0.14412    0.56421       2
 31    2    261        0        0.30357    0.10148    0.50567       2
 32    2    280        0        0.20238    0.02557    0.37920       2
 33    2    296        0        0.10119    0.00000    0.23404       2
 34    2    323        0        0.05060    0.00000    0.14718       2
 35    2    344        1         .          .          .            2
