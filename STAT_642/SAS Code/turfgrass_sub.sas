* subsampling.sas;
*This is the SAS code for the turfgrass
example in Handout 5;
ODS HTML;
ODS GRAPHICS ON;
option ls=80 ps=55 nocenter nodate;
title 'One-way ANOVA with Subsampling Design';
DATA TURF; ARRAY X X1-X3;
INPUT STIM $ PLOT X1-X3 @@;
DO OVER X;Y=X;OUTPUT; END;DROP X1-X3;
LABEL STIM ='STIMULATOR' Y= 'ROOT WEIGHT';
cards;
S1 1 3.3  3.4  3.5 S1 2 3.1  3.5  3.0
S1 3 3.2  3.1  3.4 S1 4 3.3  2.9 3.0
S1 5 3.3  3.3  3.1 S1 6  .    .   .
S2 1 3.8  3.7  4.0 S2 2 3.5  3.8  3.9
S2 3 3.6  3.4  3.8 S2 4 3.4  3.7  .
S2 5 3.6  3.7  3.6 S2 6 3.5  3.9  .
S3 1 3.8  3.9  4.0 S3 2 3.6  3.7  3.8
S3 3 3.3 3.4  .   S3 4 3.6  .    3.7
S3 5 3.5  .    3.9 S3 6 3.4  .    3.7
S4 1 4.3  4.3  4.4 S4 2 4.1  3.9  3.8
S4 3 4.2  4.1  3.9 S4 4 3.7  3.9  4.0
S4 5  .    .    .  S4 6  .    .    .
RUN;
TITLE 'ANALYSIS USING PROC GLM';
PROC GLM;
CLASS STIM  PLOT;
MODEL Y = STIM PLOT(STIM)/SS1 e1;
RANDOM PLOT(STIM)/TEST;
MEANS STIM PLOT(STIM);
LSMEANS STIM/STDERR PDIFF ADJUST=TUKEY;
RUN;

TITLE 'ANALYSIS USING PROC MIXED-REML - DEFAULT';
PROC  MIXED CL METHOD=REML;
CLASS STIM  PLOT;
MODEL Y = STIM/RESIDUAL;
RANDOM PLOT(STIM)/CL ALPHA=.05;
LSMEANS STIM/cl ADJUST=TUKEY;
RUN;
PROC  MIXED CL METHOD=REML;
CLASS STIM  PLOT;
MODEL Y = STIM/ DDFM=SAT;
RANDOM PLOT(STIM)/CL ALPHA=.05;
LSMEANS STIM/cl ADJUST=TUKEY;
RUN;
PROC  MIXED CL METHOD=REML;
CLASS STIM  PLOT;
MODEL Y = STIM/ DDFM=KR ;
RANDOM PLOT(STIM)/CL ALPHA=.05;
LSMEANS STIM/cl ADJUST=TUKEY;
RUN;
ODS GRAPHICS OFF;
ODS HTML CLOSE;
