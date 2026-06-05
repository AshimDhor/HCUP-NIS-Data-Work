/*****************************************************************************
* Stataload_NIS_2023_Severity.Do
* This program will load the NIS_2023_Severity ASCII File into Stata.
* Because Stata loads the entire file into memory, it may not be possible
* to load every data element for large files.  If necessary, edit this
* program to change the memory size or to load only selected data elements.
* Created on 12/10/2025.
*****************************************************************************/

*** Read data elements from the ASCII file ***
infix long   HOSP_NIS                     1-   5   ///
      double KEY_NIS                      6-  15   ///
      int    APRDRG                      16-  19   ///
      byte   APRDRG_Risk_Mortality       20-  21   ///
      byte   APRDRG_Severity             22-  23   ///
      using  "NIS_2023_Severity.ASC"

***  Assign labels to the data elements ***
label var HOSP_NIS                 "NIS hospital number"
label var KEY_NIS                  "NIS record number"
label var APRDRG                   "All Patient Refined DRG"
label var APRDRG_Risk_Mortality    "All Patient Refined DRG: Risk of Mortality Subclass"
label var APRDRG_Severity          "All Patient Refined DRG: Severity of Illness Subclass"

*** Convert special values to missing values ***
recode HOSP_NIS                  (-9999 -8888 -6666=.)
recode KEY_NIS                   (-999999999 -888888888 -666666666=.)
recode APRDRG                    (-999 -888 -666=.)
recode APRDRG_Risk_Mortality     (-9 -8 -6 -5=.)
recode APRDRG_Severity           (-9 -8 -6 -5=.)

save "NIS_2023_Severity.dta", replace