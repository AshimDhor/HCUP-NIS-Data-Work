/*****************************************************************************
* Stataload_NIS_2023_Core.Do
* This program will load the NIS_2023_Core ASCII File into Stata.
* Because Stata loads the entire file into memory, it may not be possible
* to load every data element for large files.  If necessary, edit this
* program to change the memory size or to load only selected data elements.
* Created on 12/10/2025.
*****************************************************************************/

*** Read data elements from the ASCII file ***
infix long   HOSP_NIS                     1-   5   ///
      double KEY_NIS                      6-  15   ///
      int    NIS_STRATUM                 16-  19   ///
      int    AGE                         20-  22   ///
      byte   AGE_NEONATE                 23-  24   ///
      byte   AMONTH                      25-  26   ///
      byte   AWEEKEND                    27-  28   ///
      byte   DIED                        29-  30   ///
      double DISCWT                      31-  41   ///
      byte   DISPUNIFORM                 42-  43   ///
      byte   DQTR                        44-  45   ///
      int    DRG                         46-  48   ///
      byte   DRGVER                      49-  50   ///
      int    DRG_NoPOA                   51-  53   ///
      byte   ELECTIVE                    54-  55   ///
      byte   FEMALE                      56-  57   ///
      int    HCUP_ED                     58-  60   ///
      int    I10_BIRTH                   61-  63   ///
      int    I10_DELIVERY                64-  66   ///
      str    I10_DX1                     67-  73   ///
      str    I10_DX2                     74-  80   ///
      str    I10_DX3                     81-  87   ///
      str    I10_DX4                     88-  94   ///
      str    I10_DX5                     95- 101   ///
      str    I10_DX6                    102- 108   ///
      str    I10_DX7                    109- 115   ///
      str    I10_DX8                    116- 122   ///
      str    I10_DX9                    123- 129   ///
      str    I10_DX10                   130- 136   ///
      str    I10_DX11                   137- 143   ///
      str    I10_DX12                   144- 150   ///
      str    I10_DX13                   151- 157   ///
      str    I10_DX14                   158- 164   ///
      str    I10_DX15                   165- 171   ///
      str    I10_DX16                   172- 178   ///
      str    I10_DX17                   179- 185   ///
      str    I10_DX18                   186- 192   ///
      str    I10_DX19                   193- 199   ///
      str    I10_DX20                   200- 206   ///
      str    I10_DX21                   207- 213   ///
      str    I10_DX22                   214- 220   ///
      str    I10_DX23                   221- 227   ///
      str    I10_DX24                   228- 234   ///
      str    I10_DX25                   235- 241   ///
      str    I10_DX26                   242- 248   ///
      str    I10_DX27                   249- 255   ///
      str    I10_DX28                   256- 262   ///
      str    I10_DX29                   263- 269   ///
      str    I10_DX30                   270- 276   ///
      str    I10_DX31                   277- 283   ///
      str    I10_DX32                   284- 290   ///
      str    I10_DX33                   291- 297   ///
      str    I10_DX34                   298- 304   ///
      str    I10_DX35                   305- 311   ///
      str    I10_DX36                   312- 318   ///
      str    I10_DX37                   319- 325   ///
      str    I10_DX38                   326- 332   ///
      str    I10_DX39                   333- 339   ///
      str    I10_DX40                   340- 346   ///
      byte   I10_INJURY                 347- 348   ///
      byte   I10_MULTINJURY             349- 350   ///
      byte   I10_NDX                    351- 352   ///
      byte   I10_NPR                    353- 354   ///
      str    I10_PR1                    355- 361   ///
      str    I10_PR2                    362- 368   ///
      str    I10_PR3                    369- 375   ///
      str    I10_PR4                    376- 382   ///
      str    I10_PR5                    383- 389   ///
      str    I10_PR6                    390- 396   ///
      str    I10_PR7                    397- 403   ///
      str    I10_PR8                    404- 410   ///
      str    I10_PR9                    411- 417   ///
      str    I10_PR10                   418- 424   ///
      str    I10_PR11                   425- 431   ///
      str    I10_PR12                   432- 438   ///
      str    I10_PR13                   439- 445   ///
      str    I10_PR14                   446- 452   ///
      str    I10_PR15                   453- 459   ///
      str    I10_PR16                   460- 466   ///
      str    I10_PR17                   467- 473   ///
      str    I10_PR18                   474- 480   ///
      str    I10_PR19                   481- 487   ///
      str    I10_PR20                   488- 494   ///
      str    I10_PR21                   495- 501   ///
      str    I10_PR22                   502- 508   ///
      str    I10_PR23                   509- 515   ///
      str    I10_PR24                   516- 522   ///
      str    I10_PR25                   523- 529   ///
      int    I10_SERVICELINE            530- 532   ///
      long   LOS                        533- 537   ///
      byte   MDC                        538- 539   ///
      byte   MDC_NoPOA                  540- 541   ///
      byte   PAY1                       542- 543   ///
      byte   PCLASS_ORPROC              544- 545   ///
      int    PRDAY1                     546- 548   ///
      int    PRDAY2                     549- 551   ///
      int    PRDAY3                     552- 554   ///
      int    PRDAY4                     555- 557   ///
      int    PRDAY5                     558- 560   ///
      int    PRDAY6                     561- 563   ///
      int    PRDAY7                     564- 566   ///
      int    PRDAY8                     567- 569   ///
      int    PRDAY9                     570- 572   ///
      int    PRDAY10                    573- 575   ///
      int    PRDAY11                    576- 578   ///
      int    PRDAY12                    579- 581   ///
      int    PRDAY13                    582- 584   ///
      int    PRDAY14                    585- 587   ///
      int    PRDAY15                    588- 590   ///
      int    PRDAY16                    591- 593   ///
      int    PRDAY17                    594- 596   ///
      int    PRDAY18                    597- 599   ///
      int    PRDAY19                    600- 602   ///
      int    PRDAY20                    603- 605   ///
      int    PRDAY21                    606- 608   ///
      int    PRDAY22                    609- 611   ///
      int    PRDAY23                    612- 614   ///
      int    PRDAY24                    615- 617   ///
      int    PRDAY25                    618- 620   ///
      byte   TRAN_IN                    621- 622   ///
      byte   TRAN_OUT                   623- 624   ///
      int    YEAR                       625- 628   ///
      byte   ZIPINC_QRTL                629- 630   ///
      double TOTCHG_2023                631- 640   ///
      int    PL_NCHS2                   641- 643   ///
      using  "NIS_2023_Core.ASC"

***  Assign labels to the data elements ***
label var HOSP_NIS                 "NIS hospital number"
label var KEY_NIS                  "NIS record number"
label var NIS_STRATUM              "NIS hospital stratum"
label var AGE                      "Age in years at admission"
label var AGE_NEONATE              "Neonatal age (first 28 days after birth) indicator"
label var AMONTH                   "Admission month"
label var AWEEKEND                 "Admission day is a weekend"
label var DIED                     "Died during hospitalization"
label var DISCWT                   "NIS discharge weight"
label var DISPUNIFORM              "Disposition of patient (uniform)"
label var DQTR                     "Discharge quarter"
label var DRG                      "DRG in effect on discharge date"
label var DRGVER                   "DRG grouper version used on discharge date"
label var DRG_NoPOA                "DRG in use on discharge date, calculated without POA"
label var ELECTIVE                 "Elective versus non-elective admission"
label var FEMALE                   "Indicator of sex"
label var HCUP_ED                  "HCUP Emergency Department service indicator"
label var I10_BIRTH                "ICD-10-CM Birth Indicator"
label var I10_DELIVERY             "ICD-10-CM Delivery Indicator"
label var I10_DX1                  "ICD-10-CM Diagnosis 1"
label var I10_DX2                  "ICD-10-CM Diagnosis 2"
label var I10_DX3                  "ICD-10-CM Diagnosis 3"
label var I10_DX4                  "ICD-10-CM Diagnosis 4"
label var I10_DX5                  "ICD-10-CM Diagnosis 5"
label var I10_DX6                  "ICD-10-CM Diagnosis 6"
label var I10_DX7                  "ICD-10-CM Diagnosis 7"
label var I10_DX8                  "ICD-10-CM Diagnosis 8"
label var I10_DX9                  "ICD-10-CM Diagnosis 9"
label var I10_DX10                 "ICD-10-CM Diagnosis 10"
label var I10_DX11                 "ICD-10-CM Diagnosis 11"
label var I10_DX12                 "ICD-10-CM Diagnosis 12"
label var I10_DX13                 "ICD-10-CM Diagnosis 13"
label var I10_DX14                 "ICD-10-CM Diagnosis 14"
label var I10_DX15                 "ICD-10-CM Diagnosis 15"
label var I10_DX16                 "ICD-10-CM Diagnosis 16"
label var I10_DX17                 "ICD-10-CM Diagnosis 17"
label var I10_DX18                 "ICD-10-CM Diagnosis 18"
label var I10_DX19                 "ICD-10-CM Diagnosis 19"
label var I10_DX20                 "ICD-10-CM Diagnosis 20"
label var I10_DX21                 "ICD-10-CM Diagnosis 21"
label var I10_DX22                 "ICD-10-CM Diagnosis 22"
label var I10_DX23                 "ICD-10-CM Diagnosis 23"
label var I10_DX24                 "ICD-10-CM Diagnosis 24"
label var I10_DX25                 "ICD-10-CM Diagnosis 25"
label var I10_DX26                 "ICD-10-CM Diagnosis 26"
label var I10_DX27                 "ICD-10-CM Diagnosis 27"
label var I10_DX28                 "ICD-10-CM Diagnosis 28"
label var I10_DX29                 "ICD-10-CM Diagnosis 29"
label var I10_DX30                 "ICD-10-CM Diagnosis 30"
label var I10_DX31                 "ICD-10-CM Diagnosis 31"
label var I10_DX32                 "ICD-10-CM Diagnosis 32"
label var I10_DX33                 "ICD-10-CM Diagnosis 33"
label var I10_DX34                 "ICD-10-CM Diagnosis 34"
label var I10_DX35                 "ICD-10-CM Diagnosis 35"
label var I10_DX36                 "ICD-10-CM Diagnosis 36"
label var I10_DX37                 "ICD-10-CM Diagnosis 37"
label var I10_DX38                 "ICD-10-CM Diagnosis 38"
label var I10_DX39                 "ICD-10-CM Diagnosis 39"
label var I10_DX40                 "ICD-10-CM Diagnosis 40"
label var I10_INJURY               "Injury ICD-10-CM diagnosis reported on record (1: First-listed injury; 2: Other than first-listed injury; 0: No injury)"
label var I10_MULTINJURY           "Multiple ICD-10-CM injuries reported on record"
label var I10_NDX                  "ICD-10-CM Number of diagnoses on this record"
label var I10_NPR                  "ICD-10-PCS Number of procedures on this record"
label var I10_PR1                  "ICD-10-PCS Procedure 1"
label var I10_PR2                  "ICD-10-PCS Procedure 2"
label var I10_PR3                  "ICD-10-PCS Procedure 3"
label var I10_PR4                  "ICD-10-PCS Procedure 4"
label var I10_PR5                  "ICD-10-PCS Procedure 5"
label var I10_PR6                  "ICD-10-PCS Procedure 6"
label var I10_PR7                  "ICD-10-PCS Procedure 7"
label var I10_PR8                  "ICD-10-PCS Procedure 8"
label var I10_PR9                  "ICD-10-PCS Procedure 9"
label var I10_PR10                 "ICD-10-PCS Procedure 10"
label var I10_PR11                 "ICD-10-PCS Procedure 11"
label var I10_PR12                 "ICD-10-PCS Procedure 12"
label var I10_PR13                 "ICD-10-PCS Procedure 13"
label var I10_PR14                 "ICD-10-PCS Procedure 14"
label var I10_PR15                 "ICD-10-PCS Procedure 15"
label var I10_PR16                 "ICD-10-PCS Procedure 16"
label var I10_PR17                 "ICD-10-PCS Procedure 17"
label var I10_PR18                 "ICD-10-PCS Procedure 18"
label var I10_PR19                 "ICD-10-PCS Procedure 19"
label var I10_PR20                 "ICD-10-PCS Procedure 20"
label var I10_PR21                 "ICD-10-PCS Procedure 21"
label var I10_PR22                 "ICD-10-PCS Procedure 22"
label var I10_PR23                 "ICD-10-PCS Procedure 23"
label var I10_PR24                 "ICD-10-PCS Procedure 24"
label var I10_PR25                 "ICD-10-PCS Procedure 25"
label var I10_SERVICELINE          "ICD-10-CM/PCS Hospital Service Line"
label var LOS                      "Length of stay (cleaned)"
label var MDC                      "MDC in effect on discharge date"
label var MDC_NoPOA                "MDC in use on discharge date, calculated without POA"
label var PAY1                     "Primary expected payer (uniform)"
label var PCLASS_ORPROC            "Indicates operating room (major diagnostic or therapeutic) procedure on the record"
label var PRDAY1                   "Number of days from admission to I10_PR1"
label var PRDAY2                   "Number of days from admission to I10_PR2"
label var PRDAY3                   "Number of days from admission to I10_PR3"
label var PRDAY4                   "Number of days from admission to I10_PR4"
label var PRDAY5                   "Number of days from admission to I10_PR5"
label var PRDAY6                   "Number of days from admission to I10_PR6"
label var PRDAY7                   "Number of days from admission to I10_PR7"
label var PRDAY8                   "Number of days from admission to I10_PR8"
label var PRDAY9                   "Number of days from admission to I10_PR9"
label var PRDAY10                  "Number of days from admission to I10_PR10"
label var PRDAY11                  "Number of days from admission to I10_PR11"
label var PRDAY12                  "Number of days from admission to I10_PR12"
label var PRDAY13                  "Number of days from admission to I10_PR13"
label var PRDAY14                  "Number of days from admission to I10_PR14"
label var PRDAY15                  "Number of days from admission to I10_PR15"
label var PRDAY16                  "Number of days from admission to I10_PR16"
label var PRDAY17                  "Number of days from admission to I10_PR17"
label var PRDAY18                  "Number of days from admission to I10_PR18"
label var PRDAY19                  "Number of days from admission to I10_PR19"
label var PRDAY20                  "Number of days from admission to I10_PR20"
label var PRDAY21                  "Number of days from admission to I10_PR21"
label var PRDAY22                  "Number of days from admission to I10_PR22"
label var PRDAY23                  "Number of days from admission to I10_PR23"
label var PRDAY24                  "Number of days from admission to I10_PR24"
label var PRDAY25                  "Number of days from admission to I10_PR25"
label var TRAN_IN                  "Transfer in indicator"
label var TRAN_OUT                 "Transfer out indicator"
label var YEAR                     "Calendar year"
label var ZIPINC_QRTL              "Median household income national quartile for patient ZIP Code"
label var TOTCHG_2023              "Total charges adjusted for national estimates"
label var PL_NCHS2                 "Patient Location: NCHS Urban-Rural Code (collapsed)"

*** Convert special values to missing values ***
recode HOSP_NIS                  (-9999 -8888 -6666=.)
recode KEY_NIS                   (-999999999 -888888888 -666666666=.)
recode NIS_STRATUM               (-999 -888 -666=.)
recode AGE                       (-99 -88 -66=.)
recode AGE_NEONATE               (-9 -8 -6 -5=.)
recode AMONTH                    (-9 -8 -6 -5=.)
recode AWEEKEND                  (-9 -8 -6 -5=.)
recode DIED                      (-9 -8 -6 -5=.)
recode DISCWT                    (-99.9999999 -88.8888888 -66.6666666=.)
recode DISPUNIFORM               (-9 -8 -6 -5=.)
recode DQTR                      (-9 -8 -6 -5=.)
recode DRG                       (-99 -88 -66=.)
recode DRGVER                    (-9 -8 -6 -5=.)
recode DRG_NoPOA                 (-99 -88 -66=.)
recode ELECTIVE                  (-9 -8 -6 -5=.)
recode FEMALE                    (-9 -8 -6 -5=.)
recode HCUP_ED                   (-99 -88 -66=.)
recode I10_BIRTH                 (-99 -88 -66=.)
recode I10_DELIVERY              (-99 -88 -66=.)
recode I10_INJURY                (-9 -8 -6 -5=.)
recode I10_MULTINJURY            (-9 -8 -6 -5=.)
recode I10_NDX                   (-9 -8 -6 -5=.)
recode I10_NPR                   (-9 -8 -6 -5=.)
recode I10_SERVICELINE           (-99 -88 -66=.)
recode LOS                       (-9999 -8888 -6666=.)
recode MDC                       (-9 -8 -6 -5=.)
recode MDC_NoPOA                 (-9 -8 -6 -5=.)
recode PAY1                      (-9 -8 -6 -5=.)
recode PCLASS_ORPROC             (-9 -8 -6 -5=.)
recode PRDAY1                    (-99 -88 -66=.)
recode PRDAY2                    (-99 -88 -66=.)
recode PRDAY3                    (-99 -88 -66=.)
recode PRDAY4                    (-99 -88 -66=.)
recode PRDAY5                    (-99 -88 -66=.)
recode PRDAY6                    (-99 -88 -66=.)
recode PRDAY7                    (-99 -88 -66=.)
recode PRDAY8                    (-99 -88 -66=.)
recode PRDAY9                    (-99 -88 -66=.)
recode PRDAY10                   (-99 -88 -66=.)
recode PRDAY11                   (-99 -88 -66=.)
recode PRDAY12                   (-99 -88 -66=.)
recode PRDAY13                   (-99 -88 -66=.)
recode PRDAY14                   (-99 -88 -66=.)
recode PRDAY15                   (-99 -88 -66=.)
recode PRDAY16                   (-99 -88 -66=.)
recode PRDAY17                   (-99 -88 -66=.)
recode PRDAY18                   (-99 -88 -66=.)
recode PRDAY19                   (-99 -88 -66=.)
recode PRDAY20                   (-99 -88 -66=.)
recode PRDAY21                   (-99 -88 -66=.)
recode PRDAY22                   (-99 -88 -66=.)
recode PRDAY23                   (-99 -88 -66=.)
recode PRDAY24                   (-99 -88 -66=.)
recode PRDAY25                   (-99 -88 -66=.)
recode TRAN_IN                   (-9 -8 -6 -5=.)
recode TRAN_OUT                  (-9 -8 -6 -5=.)
recode YEAR                      (-999 -888 -666=.)
recode ZIPINC_QRTL               (-9 -8 -6 -5=.)
recode TOTCHG_2023               (-999999999 -888888888 -666666666=.)
recode PL_NCHS2                  (-99 -88 -66=.)

save "NIS_2023_Core.dta", replace