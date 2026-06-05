/*****************************************************************************
* Stataload_NIS_2023_Hospital.Do
* This program will load the NIS_2023_Hospital ASCII File into Stata.
* Because Stata loads the entire file into memory, it may not be possible
* to load every data element for large files.  If necessary, edit this
* program to change the memory size or to load only selected data elements.
* Created on 12/10/2025.
*****************************************************************************/

*** Read data elements from the ASCII file ***
infix long   HOSP_NIS                     1-   5   ///
      int    NIS_STRATUM                  6-   9   ///
      double DISCWT                      10-  20   ///
      byte   HOSP_BEDSIZE                21-  22   ///
      byte   HOSP_LOCTEACH               23-  24   ///
      byte   H_CONTRL                    25-  26   ///
      long   N_DISC_U                    27-  34   ///
      int    N_HOSP_U                    35-  38   ///
      long   S_DISC_U                    39-  46   ///
      int    S_HOSP_U                    47-  50   ///
      long   TOTAL_DISC                  51-  56   ///
      int    YEAR                        57-  60   ///
      using  "NIS_2023_Hospital.ASC"

***  Assign labels to the data elements ***
label var HOSP_NIS                 "NIS hospital number"
label var NIS_STRATUM              "NIS hospital stratum"
label var DISCWT                   "NIS discharge weight"
label var HOSP_BEDSIZE             "Relative bed size category of hospital (original)"
label var HOSP_LOCTEACH            "Location/teaching status of hospital (original)"
label var H_CONTRL                 "Control/ownership of hospital (original)"
label var N_DISC_U                 "Number of universe discharges in the stratum"
label var N_HOSP_U                 "Number of universe hospitals in the stratum"
label var S_DISC_U                 "Number of sample discharges in the stratum"
label var S_HOSP_U                 "Number of sample hospitals in the stratum"
label var TOTAL_DISC               "Total number of discharges from this hospital in the NIS"
label var YEAR                     "Calendar year"

*** Convert special values to missing values ***
recode HOSP_NIS                  (-9999 -8888 -6666=.)
recode NIS_STRATUM               (-999 -888 -666=.)
recode DISCWT                    (-99.9999999 -88.8888888 -66.6666666=.)
recode HOSP_BEDSIZE              (-9 -8 -6 -5=.)
recode HOSP_LOCTEACH             (-9 -8 -6 -5=.)
recode H_CONTRL                  (-9 -8 -6 -5=.)
recode N_DISC_U                  (-9999999 -8888888 -6666666=.)
recode N_HOSP_U                  (-999 -888 -666=.)
recode S_DISC_U                  (-9999999 -8888888 -6666666=.)
recode S_HOSP_U                  (-999 -888 -666=.)
recode TOTAL_DISC                (-99999 -88888 -66666=.)
recode YEAR                      (-999 -888 -666=.)

save "NIS_2023_Hospital.dta", replace