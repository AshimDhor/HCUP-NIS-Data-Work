/*****************************************************************************
* SASload_NIS_2023_DX_PR_GRPS.SAS
* This program will load the NIS_2023_DX_PR_GRPS ASCII File into SAS.
* Created on 12/10/2025.
*****************************************************************************/

Options Compress=Yes;

*** Create SAS informats for missing values ***;
PROC FORMAT;
  INVALUE N2PF
    '-9' = .
    '-8' = .A
    '-6' = .C
    '-5' = .N
    OTHER = (|2.|)
  ;
  INVALUE N3PF
    '-99' = .
    '-88' = .A
    '-66' = .C
    OTHER = (|3.|)
  ;
  INVALUE N4PF
    '-999' = .
    '-888' = .A
    '-666' = .C
    OTHER = (|4.|)
  ;
  INVALUE N4P1F
    '-9.9' = .
    '-8.8' = .A
    '-6.6' = .C
    OTHER = (|4.1|)
  ;
  INVALUE N5PF
    '-9999' = .
    '-8888' = .A
    '-6666' = .C
    OTHER = (|5.|)
  ;
  INVALUE N5P2F
    '-9.99' = .
    '-8.88' = .A
    '-6.66' = .C
    OTHER = (|5.2|)
  ;
  INVALUE N6PF
    '-99999' = .
    '-88888' = .A
    '-66666' = .C
    OTHER = (|6.|)
  ;
  INVALUE N6P2F
    '-99.99' = .
    '-88.88' = .A
    '-66.66' = .C
    OTHER = (|6.2|)
  ;
  INVALUE N7P2F
    '-999.99' = .
    '-888.88' = .A
    '-666.66' = .C
    OTHER = (|7.2|)
  ;
  INVALUE N8PF
    '-9999999' = .
    '-8888888' = .A
    '-6666666' = .C
    OTHER = (|8.|)
  ;
  INVALUE N8P2F
    '-9999.99' = .
    '-8888.88' = .A
    '-6666.66' = .C
    OTHER = (|8.2|)
  ;
  INVALUE N8P4F
    '-99.9999' = .
    '-88.8888' = .A
    '-66.6666' = .C
    OTHER = (|8.4|)
  ;
  INVALUE N10PF
    '-999999999' = .
    '-888888888' = .A
    '-666666666' = .C
    OTHER = (|10.|)
  ;
  INVALUE N10P4F
    '-9999.9999' = .
    '-8888.8888' = .A
    '-6666.6666' = .C
    OTHER = (|10.4|)
  ;
  INVALUE N10P5F
    '-999.99999' = .
    '-888.88888' = .A
    '-666.66666' = .C
    OTHER = (|10.5|)
  ;
  INVALUE DATE10F
    '-999999999' = .
    '-888888888' = .A
    '-666666666' = .C
    OTHER = (|MMDDYY10.|)
  ;
  INVALUE N11P7F
    '-99.9999999' = .
    '-88.8888888' = .A
    '-66.6666666' = .C
    OTHER = (|11.7|)
  ;
  INVALUE N12P2F
    '-99999999.99' = .
    '-88888888.88' = .A
    '-66666666.66' = .C
    OTHER = (|12.2|)
  ;
  INVALUE N12P5F
    '-99999.99999' = .
    '-88888.88888' = .A
    '-66666.66666' = .C
    OTHER = (|12.5|)
  ;
  INVALUE N13PF
    '-999999999999' = .
    '-888888888888' = .A
    '-666666666666' = .C
    OTHER = (|13.|)
  ;
  INVALUE N15P2F
    '-99999999999.99' = .
    '-88888888888.88' = .A
    '-66666666666.66' = .C
    OTHER = (|15.2|)
  ;
RUN;

*** Data Step to load the file ***;
DATA NIS_2023_DX_PR_GRPS; 
INFILE 'NIS_2023_DX_PR_GRPS.ASC' LRECL = 1167;

*** Define data element attributes ***;
ATTRIB 
  HOSP_NIS                   LENGTH=4            FORMAT=5.
  LABEL="NIS hospital number"

  KEY_NIS                    LENGTH=5            FORMAT=8.
  LABEL="NIS record number"

  CMR_AIDS                   LENGTH=3
  LABEL="Acquired immune deficiency syndrome"

  CMR_ALCOHOL                LENGTH=3
  LABEL="Alcohol abuse"

  CMR_AUTOIMMUNE             LENGTH=3
  LABEL="Autoimmune conditions"

  CMR_CANCER_LYMPH           LENGTH=3
  LABEL="Lymphoma"

  CMR_CANCER_LEUK            LENGTH=3
  LABEL="Leukemia"

  CMR_CANCER_METS            LENGTH=3
  LABEL="Metastatic cancer"

  CMR_CANCER_NSITU           LENGTH=3
  LABEL="Solid tumor without metastasis, in situ"

  CMR_CANCER_SOLID           LENGTH=3
  LABEL="Solid tumor without metastasis, malignant"

  CMR_DEMENTIA               LENGTH=3
  LABEL="Dementia"

  CMR_DEPRESS                LENGTH=3
  LABEL="Depression"

  CMR_DIAB_UNCX              LENGTH=3
  LABEL="Diabetes without chronic complications"

  CMR_DIAB_CX                LENGTH=3
  LABEL="Diabetes with chronic complications"

  CMR_DRUG_ABUSE             LENGTH=3
  LABEL="Drug abuse"

  CMR_HTN_CX                 LENGTH=3
  LABEL="Hypertension, complicated"

  CMR_HTN_UNCX               LENGTH=3
  LABEL="Hypertension, uncomplicated"

  CMR_LUNG_CHRONIC           LENGTH=3
  LABEL="Chronic pulmonary disease"

  CMR_OBESE                  LENGTH=3
  LABEL="Obesity"

  CMR_PERIVASC               LENGTH=3
  LABEL="Peripheral vascular disease"

  CMR_THYROID_HYPO           LENGTH=3
  LABEL="Hypothyroidism"

  CMR_THYROID_OTH            LENGTH=3
  LABEL="Other thyroid disorders"

  CMR_VERSION                LENGTH=$6
  LABEL="Version of Elixhauser Comorbidity Software Refined"

  PCLASS1                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 1"

  PCLASS2                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 2"

  PCLASS3                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 3"

  PCLASS4                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 4"

  PCLASS5                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 5"

  PCLASS6                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 6"

  PCLASS7                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 7"

  PCLASS8                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 8"

  PCLASS9                    LENGTH=3
  LABEL="ICD-10-PCS Procedure class 9"

  PCLASS10                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 10"

  PCLASS11                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 11"

  PCLASS12                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 12"

  PCLASS13                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 13"

  PCLASS14                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 14"

  PCLASS15                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 15"

  PCLASS16                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 16"

  PCLASS17                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 17"

  PCLASS18                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 18"

  PCLASS19                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 19"

  PCLASS20                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 20"

  PCLASS21                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 21"

  PCLASS22                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 22"

  PCLASS23                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 23"

  PCLASS24                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 24"

  PCLASS25                   LENGTH=3
  LABEL="ICD-10-PCS Procedure class 25"

  PCLASS_VERSION             LENGTH=$6
  LABEL="Version of ICD-10-PCS Procedure class"

  DXCCSR_Default_DX1         LENGTH=$6
  LABEL="Default CCSR for principal/first-listed ICD-10-CM diagnosis"

  DXCCSR_BLD001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD001"

  DXCCSR_BLD002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD002"

  DXCCSR_BLD003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD003"

  DXCCSR_BLD004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD004"

  DXCCSR_BLD005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD005"

  DXCCSR_BLD006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD006"

  DXCCSR_BLD007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD007"

  DXCCSR_BLD008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD008"

  DXCCSR_BLD009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD009"

  DXCCSR_BLD010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD010"

  DXCCSR_CIR001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR001"

  DXCCSR_CIR002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR002"

  DXCCSR_CIR003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR003"

  DXCCSR_CIR004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR004"

  DXCCSR_CIR005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR005"

  DXCCSR_CIR006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR006"

  DXCCSR_CIR007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR007"

  DXCCSR_CIR008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR008"

  DXCCSR_CIR009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR009"

  DXCCSR_CIR010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR010"

  DXCCSR_CIR011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR011"

  DXCCSR_CIR012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR012"

  DXCCSR_CIR013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR013"

  DXCCSR_CIR014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR014"

  DXCCSR_CIR015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR015"

  DXCCSR_CIR016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR016"

  DXCCSR_CIR017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR017"

  DXCCSR_CIR018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR018"

  DXCCSR_CIR019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR019"

  DXCCSR_CIR020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR020"

  DXCCSR_CIR021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR021"

  DXCCSR_CIR022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR022"

  DXCCSR_CIR023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR023"

  DXCCSR_CIR024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR024"

  DXCCSR_CIR025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR025"

  DXCCSR_CIR026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR026"

  DXCCSR_CIR027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR027"

  DXCCSR_CIR028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR028"

  DXCCSR_CIR029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR029"

  DXCCSR_CIR030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR030"

  DXCCSR_CIR031              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR031"

  DXCCSR_CIR032              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR032"

  DXCCSR_CIR033              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR033"

  DXCCSR_CIR034              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR034"

  DXCCSR_CIR035              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR035"

  DXCCSR_CIR036              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR036"

  DXCCSR_CIR037              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR037"

  DXCCSR_CIR038              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR038"

  DXCCSR_CIR039              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR039"

  DXCCSR_DEN001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DEN001"

  DXCCSR_DEN002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DEN002"

  DXCCSR_DEN003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DEN003"

  DXCCSR_DIG001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG001"

  DXCCSR_DIG002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG002"

  DXCCSR_DIG003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG003"

  DXCCSR_DIG004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG004"

  DXCCSR_DIG005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG005"

  DXCCSR_DIG006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG006"

  DXCCSR_DIG007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG007"

  DXCCSR_DIG008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG008"

  DXCCSR_DIG009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG009"

  DXCCSR_DIG010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG010"

  DXCCSR_DIG011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG011"

  DXCCSR_DIG012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG012"

  DXCCSR_DIG013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG013"

  DXCCSR_DIG014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG014"

  DXCCSR_DIG015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG015"

  DXCCSR_DIG016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG016"

  DXCCSR_DIG017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG017"

  DXCCSR_DIG018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG018"

  DXCCSR_DIG019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG019"

  DXCCSR_DIG020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG020"

  DXCCSR_DIG021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG021"

  DXCCSR_DIG022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG022"

  DXCCSR_DIG023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG023"

  DXCCSR_DIG024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG024"

  DXCCSR_DIG025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG025"

  DXCCSR_EAR001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR001"

  DXCCSR_EAR002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR002"

  DXCCSR_EAR003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR003"

  DXCCSR_EAR004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR004"

  DXCCSR_EAR005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR005"

  DXCCSR_EAR006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR006"

  DXCCSR_END001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END001"

  DXCCSR_END002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END002"

  DXCCSR_END003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END003"

  DXCCSR_END004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END004"

  DXCCSR_END005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END005"

  DXCCSR_END006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END006"

  DXCCSR_END007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END007"

  DXCCSR_END008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END008"

  DXCCSR_END009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END009"

  DXCCSR_END010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END010"

  DXCCSR_END011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END011"

  DXCCSR_END012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END012"

  DXCCSR_END013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END013"

  DXCCSR_END014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END014"

  DXCCSR_END015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END015"

  DXCCSR_END016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END016"

  DXCCSR_END017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END017"

  DXCCSR_EXT001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT001"

  DXCCSR_EXT002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT002"

  DXCCSR_EXT003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT003"

  DXCCSR_EXT004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT004"

  DXCCSR_EXT005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT005"

  DXCCSR_EXT006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT006"

  DXCCSR_EXT007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT007"

  DXCCSR_EXT008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT008"

  DXCCSR_EXT009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT009"

  DXCCSR_EXT010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT010"

  DXCCSR_EXT011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT011"

  DXCCSR_EXT012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT012"

  DXCCSR_EXT013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT013"

  DXCCSR_EXT014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT014"

  DXCCSR_EXT015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT015"

  DXCCSR_EXT016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT016"

  DXCCSR_EXT017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT017"

  DXCCSR_EXT018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT018"

  DXCCSR_EXT019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT019"

  DXCCSR_EXT020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT020"

  DXCCSR_EXT021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT021"

  DXCCSR_EXT022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT022"

  DXCCSR_EXT023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT023"

  DXCCSR_EXT024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT024"

  DXCCSR_EXT025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT025"

  DXCCSR_EXT026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT026"

  DXCCSR_EXT027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT027"

  DXCCSR_EXT028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT028"

  DXCCSR_EXT029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT029"

  DXCCSR_EXT030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT030"

  DXCCSR_EYE001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE001"

  DXCCSR_EYE002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE002"

  DXCCSR_EYE003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE003"

  DXCCSR_EYE004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE004"

  DXCCSR_EYE005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE005"

  DXCCSR_EYE006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE006"

  DXCCSR_EYE007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE007"

  DXCCSR_EYE008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE008"

  DXCCSR_EYE009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE009"

  DXCCSR_EYE010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE010"

  DXCCSR_EYE011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE011"

  DXCCSR_EYE012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE012"

  DXCCSR_FAC001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC001"

  DXCCSR_FAC002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC002"

  DXCCSR_FAC003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC003"

  DXCCSR_FAC004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC004"

  DXCCSR_FAC005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC005"

  DXCCSR_FAC006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC006"

  DXCCSR_FAC007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC007"

  DXCCSR_FAC008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC008"

  DXCCSR_FAC009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC009"

  DXCCSR_FAC010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC010"

  DXCCSR_FAC011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC011"

  DXCCSR_FAC012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC012"

  DXCCSR_FAC013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC013"

  DXCCSR_FAC014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC014"

  DXCCSR_FAC015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC015"

  DXCCSR_FAC016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC016"

  DXCCSR_FAC017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC017"

  DXCCSR_FAC018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC018"

  DXCCSR_FAC019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC019"

  DXCCSR_FAC020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC020"

  DXCCSR_FAC021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC021"

  DXCCSR_FAC022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC022"

  DXCCSR_FAC023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC023"

  DXCCSR_FAC024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC024"

  DXCCSR_FAC025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC025"

  DXCCSR_FAC026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC026"

  DXCCSR_FAC027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC027"

  DXCCSR_FAC028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC028"

  DXCCSR_FAC029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC029"

  DXCCSR_FAC030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC030"

  DXCCSR_GEN001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN001"

  DXCCSR_GEN002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN002"

  DXCCSR_GEN003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN003"

  DXCCSR_GEN004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN004"

  DXCCSR_GEN005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN005"

  DXCCSR_GEN006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN006"

  DXCCSR_GEN007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN007"

  DXCCSR_GEN008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN008"

  DXCCSR_GEN009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN009"

  DXCCSR_GEN010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN010"

  DXCCSR_GEN011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN011"

  DXCCSR_GEN012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN012"

  DXCCSR_GEN013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN013"

  DXCCSR_GEN014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN014"

  DXCCSR_GEN015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN015"

  DXCCSR_GEN016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN016"

  DXCCSR_GEN017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN017"

  DXCCSR_GEN018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN018"

  DXCCSR_GEN019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN019"

  DXCCSR_GEN020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN020"

  DXCCSR_GEN021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN021"

  DXCCSR_GEN022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN022"

  DXCCSR_GEN023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN023"

  DXCCSR_GEN024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN024"

  DXCCSR_GEN025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN025"

  DXCCSR_GEN026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN026"

  DXCCSR_INF001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF001"

  DXCCSR_INF002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF002"

  DXCCSR_INF003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF003"

  DXCCSR_INF004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF004"

  DXCCSR_INF005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF005"

  DXCCSR_INF006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF006"

  DXCCSR_INF007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF007"

  DXCCSR_INF008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF008"

  DXCCSR_INF009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF009"

  DXCCSR_INF010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF010"

  DXCCSR_INF011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF011"

  DXCCSR_INF012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF012"

  DXCCSR_INJ001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ001"

  DXCCSR_INJ002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ002"

  DXCCSR_INJ003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ003"

  DXCCSR_INJ004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ004"

  DXCCSR_INJ005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ005"

  DXCCSR_INJ006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ006"

  DXCCSR_INJ007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ007"

  DXCCSR_INJ008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ008"

  DXCCSR_INJ009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ009"

  DXCCSR_INJ010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ010"

  DXCCSR_INJ011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ011"

  DXCCSR_INJ012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ012"

  DXCCSR_INJ013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ013"

  DXCCSR_INJ014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ014"

  DXCCSR_INJ015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ015"

  DXCCSR_INJ016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ016"

  DXCCSR_INJ017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ017"

  DXCCSR_INJ018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ018"

  DXCCSR_INJ019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ019"

  DXCCSR_INJ020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ020"

  DXCCSR_INJ021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ021"

  DXCCSR_INJ022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ022"

  DXCCSR_INJ023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ023"

  DXCCSR_INJ024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ024"

  DXCCSR_INJ025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ025"

  DXCCSR_INJ026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ026"

  DXCCSR_INJ027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ027"

  DXCCSR_INJ028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ028"

  DXCCSR_INJ029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ029"

  DXCCSR_INJ030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ030"

  DXCCSR_INJ031              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ031"

  DXCCSR_INJ032              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ032"

  DXCCSR_INJ033              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ033"

  DXCCSR_INJ034              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ034"

  DXCCSR_INJ035              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ035"

  DXCCSR_INJ036              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ036"

  DXCCSR_INJ037              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ037"

  DXCCSR_INJ038              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ038"

  DXCCSR_INJ039              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ039"

  DXCCSR_INJ040              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ040"

  DXCCSR_INJ041              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ041"

  DXCCSR_INJ042              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ042"

  DXCCSR_INJ043              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ043"

  DXCCSR_INJ044              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ044"

  DXCCSR_INJ045              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ045"

  DXCCSR_INJ046              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ046"

  DXCCSR_INJ047              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ047"

  DXCCSR_INJ048              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ048"

  DXCCSR_INJ049              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ049"

  DXCCSR_INJ050              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ050"

  DXCCSR_INJ051              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ051"

  DXCCSR_INJ052              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ052"

  DXCCSR_INJ053              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ053"

  DXCCSR_INJ054              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ054"

  DXCCSR_INJ055              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ055"

  DXCCSR_INJ056              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ056"

  DXCCSR_INJ057              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ057"

  DXCCSR_INJ058              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ058"

  DXCCSR_INJ059              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ059"

  DXCCSR_INJ060              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ060"

  DXCCSR_INJ061              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ061"

  DXCCSR_INJ062              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ062"

  DXCCSR_INJ063              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ063"

  DXCCSR_INJ064              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ064"

  DXCCSR_INJ065              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ065"

  DXCCSR_INJ066              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ066"

  DXCCSR_INJ067              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ067"

  DXCCSR_INJ068              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ068"

  DXCCSR_INJ069              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ069"

  DXCCSR_INJ070              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ070"

  DXCCSR_INJ071              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ071"

  DXCCSR_INJ072              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ072"

  DXCCSR_INJ073              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ073"

  DXCCSR_INJ074              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ074"

  DXCCSR_INJ075              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ075"

  DXCCSR_INJ076              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ076"

  DXCCSR_MAL001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL001"

  DXCCSR_MAL002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL002"

  DXCCSR_MAL003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL003"

  DXCCSR_MAL004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL004"

  DXCCSR_MAL005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL005"

  DXCCSR_MAL006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL006"

  DXCCSR_MAL007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL007"

  DXCCSR_MAL008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL008"

  DXCCSR_MAL009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL009"

  DXCCSR_MAL010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL010"

  DXCCSR_MBD001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD001"

  DXCCSR_MBD002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD002"

  DXCCSR_MBD003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD003"

  DXCCSR_MBD004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD004"

  DXCCSR_MBD005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD005"

  DXCCSR_MBD006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD006"

  DXCCSR_MBD007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD007"

  DXCCSR_MBD008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD008"

  DXCCSR_MBD009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD009"

  DXCCSR_MBD010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD010"

  DXCCSR_MBD011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD011"

  DXCCSR_MBD012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD012"

  DXCCSR_MBD013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD013"

  DXCCSR_MBD014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD014"

  DXCCSR_MBD017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD017"

  DXCCSR_MBD018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD018"

  DXCCSR_MBD019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD019"

  DXCCSR_MBD020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD020"

  DXCCSR_MBD021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD021"

  DXCCSR_MBD022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD022"

  DXCCSR_MBD023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD023"

  DXCCSR_MBD024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD024"

  DXCCSR_MBD025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD025"

  DXCCSR_MBD026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD026"

  DXCCSR_MBD027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD027"

  DXCCSR_MBD028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD028"

  DXCCSR_MBD029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD029"

  DXCCSR_MBD030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD030"

  DXCCSR_MBD031              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD031"

  DXCCSR_MBD032              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD032"

  DXCCSR_MBD033              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD033"

  DXCCSR_MBD034              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD034"

  DXCCSR_MUS001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS001"

  DXCCSR_MUS002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS002"

  DXCCSR_MUS003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS003"

  DXCCSR_MUS004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS004"

  DXCCSR_MUS005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS005"

  DXCCSR_MUS006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS006"

  DXCCSR_MUS007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS007"

  DXCCSR_MUS008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS008"

  DXCCSR_MUS009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS009"

  DXCCSR_MUS010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS010"

  DXCCSR_MUS011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS011"

  DXCCSR_MUS012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS012"

  DXCCSR_MUS013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS013"

  DXCCSR_MUS014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS014"

  DXCCSR_MUS015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS015"

  DXCCSR_MUS016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS016"

  DXCCSR_MUS017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS017"

  DXCCSR_MUS018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS018"

  DXCCSR_MUS019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS019"

  DXCCSR_MUS020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS020"

  DXCCSR_MUS021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS021"

  DXCCSR_MUS022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS022"

  DXCCSR_MUS023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS023"

  DXCCSR_MUS024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS024"

  DXCCSR_MUS025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS025"

  DXCCSR_MUS026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS026"

  DXCCSR_MUS027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS027"

  DXCCSR_MUS028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS028"

  DXCCSR_MUS029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS029"

  DXCCSR_MUS030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS030"

  DXCCSR_MUS031              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS031"

  DXCCSR_MUS032              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS032"

  DXCCSR_MUS033              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS033"

  DXCCSR_MUS034              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS034"

  DXCCSR_MUS035              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS035"

  DXCCSR_MUS036              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS036"

  DXCCSR_MUS037              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS037"

  DXCCSR_MUS038              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS038"

  DXCCSR_NEO001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO001"

  DXCCSR_NEO002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO002"

  DXCCSR_NEO003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO003"

  DXCCSR_NEO004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO004"

  DXCCSR_NEO005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO005"

  DXCCSR_NEO006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO006"

  DXCCSR_NEO007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO007"

  DXCCSR_NEO008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO008"

  DXCCSR_NEO009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO009"

  DXCCSR_NEO010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO010"

  DXCCSR_NEO011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO011"

  DXCCSR_NEO012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO012"

  DXCCSR_NEO013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO013"

  DXCCSR_NEO014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO014"

  DXCCSR_NEO015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO015"

  DXCCSR_NEO016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO016"

  DXCCSR_NEO017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO017"

  DXCCSR_NEO018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO018"

  DXCCSR_NEO019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO019"

  DXCCSR_NEO020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO020"

  DXCCSR_NEO021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO021"

  DXCCSR_NEO022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO022"

  DXCCSR_NEO023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO023"

  DXCCSR_NEO024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO024"

  DXCCSR_NEO025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO025"

  DXCCSR_NEO026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO026"

  DXCCSR_NEO027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO027"

  DXCCSR_NEO028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO028"

  DXCCSR_NEO029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO029"

  DXCCSR_NEO030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO030"

  DXCCSR_NEO031              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO031"

  DXCCSR_NEO032              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO032"

  DXCCSR_NEO033              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO033"

  DXCCSR_NEO034              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO034"

  DXCCSR_NEO035              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO035"

  DXCCSR_NEO036              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO036"

  DXCCSR_NEO037              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO037"

  DXCCSR_NEO038              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO038"

  DXCCSR_NEO039              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO039"

  DXCCSR_NEO040              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO040"

  DXCCSR_NEO041              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO041"

  DXCCSR_NEO042              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO042"

  DXCCSR_NEO043              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO043"

  DXCCSR_NEO044              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO044"

  DXCCSR_NEO045              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO045"

  DXCCSR_NEO046              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO046"

  DXCCSR_NEO047              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO047"

  DXCCSR_NEO048              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO048"

  DXCCSR_NEO049              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO049"

  DXCCSR_NEO050              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO050"

  DXCCSR_NEO051              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO051"

  DXCCSR_NEO052              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO052"

  DXCCSR_NEO053              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO053"

  DXCCSR_NEO054              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO054"

  DXCCSR_NEO055              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO055"

  DXCCSR_NEO056              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO056"

  DXCCSR_NEO057              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO057"

  DXCCSR_NEO058              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO058"

  DXCCSR_NEO059              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO059"

  DXCCSR_NEO060              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO060"

  DXCCSR_NEO061              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO061"

  DXCCSR_NEO062              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO062"

  DXCCSR_NEO063              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO063"

  DXCCSR_NEO064              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO064"

  DXCCSR_NEO065              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO065"

  DXCCSR_NEO066              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO066"

  DXCCSR_NEO067              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO067"

  DXCCSR_NEO068              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO068"

  DXCCSR_NEO069              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO069"

  DXCCSR_NEO070              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO070"

  DXCCSR_NEO071              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO071"

  DXCCSR_NEO072              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO072"

  DXCCSR_NEO073              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO073"

  DXCCSR_NEO074              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO074"

  DXCCSR_NEO075              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO075"

  DXCCSR_NEO076              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO076"

  DXCCSR_NEO077              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO077"

  DXCCSR_NEO078              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO078"

  DXCCSR_NVS001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS001"

  DXCCSR_NVS002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS002"

  DXCCSR_NVS003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS003"

  DXCCSR_NVS004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS004"

  DXCCSR_NVS005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS005"

  DXCCSR_NVS006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS006"

  DXCCSR_NVS007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS007"

  DXCCSR_NVS008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS008"

  DXCCSR_NVS009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS009"

  DXCCSR_NVS010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS010"

  DXCCSR_NVS011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS011"

  DXCCSR_NVS012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS012"

  DXCCSR_NVS013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS013"

  DXCCSR_NVS014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS014"

  DXCCSR_NVS015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS015"

  DXCCSR_NVS016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS016"

  DXCCSR_NVS017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS017"

  DXCCSR_NVS018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS018"

  DXCCSR_NVS019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS019"

  DXCCSR_NVS020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS020"

  DXCCSR_NVS021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS021"

  DXCCSR_NVS022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS022"

  DXCCSR_PNL001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL001"

  DXCCSR_PNL002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL002"

  DXCCSR_PNL003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL003"

  DXCCSR_PNL004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL004"

  DXCCSR_PNL005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL005"

  DXCCSR_PNL006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL006"

  DXCCSR_PNL007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL007"

  DXCCSR_PNL008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL008"

  DXCCSR_PNL009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL009"

  DXCCSR_PNL010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL010"

  DXCCSR_PNL011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL011"

  DXCCSR_PNL012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL012"

  DXCCSR_PNL013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL013"

  DXCCSR_PNL014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL014"

  DXCCSR_PNL015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL015"

  DXCCSR_PRG001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG001"

  DXCCSR_PRG002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG002"

  DXCCSR_PRG003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG003"

  DXCCSR_PRG004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG004"

  DXCCSR_PRG005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG005"

  DXCCSR_PRG006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG006"

  DXCCSR_PRG007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG007"

  DXCCSR_PRG008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG008"

  DXCCSR_PRG009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG009"

  DXCCSR_PRG010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG010"

  DXCCSR_PRG011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG011"

  DXCCSR_PRG012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG012"

  DXCCSR_PRG013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG013"

  DXCCSR_PRG014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG014"

  DXCCSR_PRG015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG015"

  DXCCSR_PRG016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG016"

  DXCCSR_PRG017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG017"

  DXCCSR_PRG018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG018"

  DXCCSR_PRG019              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG019"

  DXCCSR_PRG020              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG020"

  DXCCSR_PRG021              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG021"

  DXCCSR_PRG022              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG022"

  DXCCSR_PRG023              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG023"

  DXCCSR_PRG024              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG024"

  DXCCSR_PRG025              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG025"

  DXCCSR_PRG026              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG026"

  DXCCSR_PRG027              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG027"

  DXCCSR_PRG028              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG028"

  DXCCSR_PRG029              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG029"

  DXCCSR_PRG030              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG030"

  DXCCSR_RSP001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP001"

  DXCCSR_RSP002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP002"

  DXCCSR_RSP003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP003"

  DXCCSR_RSP004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP004"

  DXCCSR_RSP005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP005"

  DXCCSR_RSP006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP006"

  DXCCSR_RSP007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP007"

  DXCCSR_RSP008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP008"

  DXCCSR_RSP009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP009"

  DXCCSR_RSP010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP010"

  DXCCSR_RSP011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP011"

  DXCCSR_RSP012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP012"

  DXCCSR_RSP013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP013"

  DXCCSR_RSP014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP014"

  DXCCSR_RSP015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP015"

  DXCCSR_RSP016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP016"

  DXCCSR_RSP017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP017"

  DXCCSR_SKN001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN001"

  DXCCSR_SKN002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN002"

  DXCCSR_SKN003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN003"

  DXCCSR_SKN004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN004"

  DXCCSR_SKN005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN005"

  DXCCSR_SKN006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN006"

  DXCCSR_SKN007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN007"

  DXCCSR_SYM001              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM001"

  DXCCSR_SYM002              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM002"

  DXCCSR_SYM003              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM003"

  DXCCSR_SYM004              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM004"

  DXCCSR_SYM005              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM005"

  DXCCSR_SYM006              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM006"

  DXCCSR_SYM007              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM007"

  DXCCSR_SYM008              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM008"

  DXCCSR_SYM009              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM009"

  DXCCSR_SYM010              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM010"

  DXCCSR_SYM011              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM011"

  DXCCSR_SYM012              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM012"

  DXCCSR_SYM013              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM013"

  DXCCSR_SYM014              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM014"

  DXCCSR_SYM015              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM015"

  DXCCSR_SYM016              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM016"

  DXCCSR_SYM017              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM017"

  DXCCSR_SYM018              LENGTH=3
  LABEL="Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM018"

  DXCCSR_VERSION             LENGTH=$6
  LABEL="Version of CCSR for ICD-10-CM diagnoses"

  PRCCSR_ADM001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM001"

  PRCCSR_ADM002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM002"

  PRCCSR_ADM003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM003"

  PRCCSR_ADM004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM004"

  PRCCSR_ADM005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM005"

  PRCCSR_ADM006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM006"

  PRCCSR_ADM007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM007"

  PRCCSR_ADM008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM008"

  PRCCSR_ADM009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM009"

  PRCCSR_ADM010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM010"

  PRCCSR_ADM011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM011"

  PRCCSR_ADM012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM012"

  PRCCSR_ADM013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM013"

  PRCCSR_ADM014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM014"

  PRCCSR_ADM015              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM015"

  PRCCSR_ADM016              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM016"

  PRCCSR_ADM017              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM017"

  PRCCSR_ADM018              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM018"

  PRCCSR_ADM019              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM019"

  PRCCSR_ADM020              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM020"

  PRCCSR_ADM021              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM021"

  PRCCSR_ADM022              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM022"

  PRCCSR_CAR001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR001"

  PRCCSR_CAR002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR002"

  PRCCSR_CAR003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR003"

  PRCCSR_CAR004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR004"

  PRCCSR_CAR005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR005"

  PRCCSR_CAR006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR006"

  PRCCSR_CAR007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR007"

  PRCCSR_CAR008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR008"

  PRCCSR_CAR009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR009"

  PRCCSR_CAR010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR010"

  PRCCSR_CAR011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR011"

  PRCCSR_CAR012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR012"

  PRCCSR_CAR013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR013"

  PRCCSR_CAR014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR014"

  PRCCSR_CAR015              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR015"

  PRCCSR_CAR016              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR016"

  PRCCSR_CAR017              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR017"

  PRCCSR_CAR018              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR018"

  PRCCSR_CAR019              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR019"

  PRCCSR_CAR020              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR020"

  PRCCSR_CAR021              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR021"

  PRCCSR_CAR022              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR022"

  PRCCSR_CAR023              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR023"

  PRCCSR_CAR024              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR024"

  PRCCSR_CAR025              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR025"

  PRCCSR_CAR026              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR026"

  PRCCSR_CAR027              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR027"

  PRCCSR_CAR028              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR028"

  PRCCSR_CAR029              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR029"

  PRCCSR_CHP001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CHP001"

  PRCCSR_CNS001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS001"

  PRCCSR_CNS002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS002"

  PRCCSR_CNS003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS003"

  PRCCSR_CNS004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS004"

  PRCCSR_CNS005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS005"

  PRCCSR_CNS006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS006"

  PRCCSR_CNS007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS007"

  PRCCSR_CNS008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS008"

  PRCCSR_CNS009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS009"

  PRCCSR_CNS010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS010"

  PRCCSR_CNS011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS011"

  PRCCSR_CNS012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS012"

  PRCCSR_CNS013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS013"

  PRCCSR_CNS014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS014"

  PRCCSR_ENP001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP001"

  PRCCSR_ENP002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP002"

  PRCCSR_ENP003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP003"

  PRCCSR_ENP004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP004"

  PRCCSR_ENP005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP005"

  PRCCSR_ENP006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP006"

  PRCCSR_ENT001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT001"

  PRCCSR_ENT002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT002"

  PRCCSR_ENT003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT003"

  PRCCSR_ENT004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT004"

  PRCCSR_ENT005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT005"

  PRCCSR_ENT006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT006"

  PRCCSR_ENT007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT007"

  PRCCSR_ENT008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT008"

  PRCCSR_ENT009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT009"

  PRCCSR_ENT010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT010"

  PRCCSR_ENT011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT011"

  PRCCSR_ENT012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT012"

  PRCCSR_ENT013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT013"

  PRCCSR_ENT014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT014"

  PRCCSR_ENT015              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT015"

  PRCCSR_ENT016              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT016"

  PRCCSR_ENT017              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT017"

  PRCCSR_ESA001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA001"

  PRCCSR_ESA002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA002"

  PRCCSR_ESA003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA003"

  PRCCSR_ESA004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA004"

  PRCCSR_ESA005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA005"

  PRCCSR_ESA006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA006"

  PRCCSR_ESA007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA007"

  PRCCSR_ESA008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA008"

  PRCCSR_ESA009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA009"

  PRCCSR_ESA010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA010"

  PRCCSR_ESA011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA011"

  PRCCSR_ESA012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA012"

  PRCCSR_EST001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST001"

  PRCCSR_EST002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST002"

  PRCCSR_EST003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST003"

  PRCCSR_EST004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST004"

  PRCCSR_EST005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST005"

  PRCCSR_EYP001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EYP001"

  PRCCSR_EYP002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EYP002"

  PRCCSR_FRS001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS001"

  PRCCSR_FRS002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS002"

  PRCCSR_FRS003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS003"

  PRCCSR_FRS004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS004"

  PRCCSR_FRS005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS005"

  PRCCSR_FRS006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS006"

  PRCCSR_FRS007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS007"

  PRCCSR_FRS008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS008"

  PRCCSR_FRS009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS009"

  PRCCSR_FRS010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS010"

  PRCCSR_FRS011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS011"

  PRCCSR_FRS012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS012"

  PRCCSR_FRS013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS013"

  PRCCSR_FRS014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS014"

  PRCCSR_FRS015              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS015"

  PRCCSR_GIS001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS001"

  PRCCSR_GIS002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS002"

  PRCCSR_GIS003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS003"

  PRCCSR_GIS004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS004"

  PRCCSR_GIS005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS005"

  PRCCSR_GIS006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS006"

  PRCCSR_GIS007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS007"

  PRCCSR_GIS008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS008"

  PRCCSR_GIS009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS009"

  PRCCSR_GIS010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS010"

  PRCCSR_GIS011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS011"

  PRCCSR_GIS012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS012"

  PRCCSR_GIS013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS013"

  PRCCSR_GIS014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS014"

  PRCCSR_GIS015              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS015"

  PRCCSR_GIS016              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS016"

  PRCCSR_GIS017              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS017"

  PRCCSR_GIS018              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS018"

  PRCCSR_GIS019              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS019"

  PRCCSR_GIS020              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS020"

  PRCCSR_GIS021              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS021"

  PRCCSR_GIS022              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS022"

  PRCCSR_GIS023              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS023"

  PRCCSR_GIS024              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS024"

  PRCCSR_GIS025              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS025"

  PRCCSR_GIS026              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS026"

  PRCCSR_GIS027              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS027"

  PRCCSR_GIS028              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS028"

  PRCCSR_GIS029              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS029"

  PRCCSR_GNR001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR001"

  PRCCSR_GNR002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR002"

  PRCCSR_GNR003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR003"

  PRCCSR_GNR004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR004"

  PRCCSR_GNR005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR005"

  PRCCSR_GNR006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR006"

  PRCCSR_GNR007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR007"

  PRCCSR_GNR008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR008"

  PRCCSR_GNR009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR009"

  PRCCSR_GNR010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR010"

  PRCCSR_HEP001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP001"

  PRCCSR_HEP002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP002"

  PRCCSR_HEP003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP003"

  PRCCSR_HEP004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP004"

  PRCCSR_HEP005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP005"

  PRCCSR_HEP006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP006"

  PRCCSR_HEP007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP007"

  PRCCSR_HEP008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP008"

  PRCCSR_HEP009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP009"

  PRCCSR_HEP010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP010"

  PRCCSR_HEP011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP011"

  PRCCSR_HEP012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP012"

  PRCCSR_HEP013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP013"

  PRCCSR_IMG001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG001"

  PRCCSR_IMG002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG002"

  PRCCSR_IMG003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG003"

  PRCCSR_IMG004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG004"

  PRCCSR_IMG005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG005"

  PRCCSR_IMG006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG006"

  PRCCSR_IMG007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG007"

  PRCCSR_IMG008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG008"

  PRCCSR_IMG009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG009"

  PRCCSR_IMG010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG010"

  PRCCSR_LYM001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM001"

  PRCCSR_LYM002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM002"

  PRCCSR_LYM003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM003"

  PRCCSR_LYM004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM004"

  PRCCSR_LYM005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM005"

  PRCCSR_LYM006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM006"

  PRCCSR_LYM007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM007"

  PRCCSR_LYM008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM008"

  PRCCSR_LYM009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM009"

  PRCCSR_LYM010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM010"

  PRCCSR_LYM011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM011"

  PRCCSR_MAM001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM001"

  PRCCSR_MAM002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM002"

  PRCCSR_MAM003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM003"

  PRCCSR_MAM004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM004"

  PRCCSR_MAM005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM005"

  PRCCSR_MAM006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM006"

  PRCCSR_MAM007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM007"

  PRCCSR_MAM008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM008"

  PRCCSR_MAM009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM009"

  PRCCSR_MAM010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM010"

  PRCCSR_MAM011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM011"

  PRCCSR_MAM012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM012"

  PRCCSR_MAM013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM013"

  PRCCSR_MAM014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM014"

  PRCCSR_MAM015              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM015"

  PRCCSR_MHT001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT001"

  PRCCSR_MHT002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT002"

  PRCCSR_MHT003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT003"

  PRCCSR_MHT004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT004"

  PRCCSR_MHT005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT005"

  PRCCSR_MRS001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS001"

  PRCCSR_MRS002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS002"

  PRCCSR_MRS003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS003"

  PRCCSR_MRS004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS004"

  PRCCSR_MRS005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS005"

  PRCCSR_MRS006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS006"

  PRCCSR_MRS007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS007"

  PRCCSR_MST001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST001"

  PRCCSR_MST002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST002"

  PRCCSR_MST003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST003"

  PRCCSR_MST004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST004"

  PRCCSR_MST005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST005"

  PRCCSR_MST006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST006"

  PRCCSR_MST007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST007"

  PRCCSR_MST008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST008"

  PRCCSR_MST009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST009"

  PRCCSR_MST010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST010"

  PRCCSR_MST011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST011"

  PRCCSR_MST012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST012"

  PRCCSR_MST013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST013"

  PRCCSR_MST014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST014"

  PRCCSR_MST015              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST015"

  PRCCSR_MST016              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST016"

  PRCCSR_MST017              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST017"

  PRCCSR_MST018              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST018"

  PRCCSR_MST019              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST019"

  PRCCSR_MST020              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST020"

  PRCCSR_MST021              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST021"

  PRCCSR_MST022              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST022"

  PRCCSR_MST023              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST023"

  PRCCSR_MST024              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST024"

  PRCCSR_MST025              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST025"

  PRCCSR_MST026              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST026"

  PRCCSR_MST027              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST027"

  PRCCSR_MST028              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST028"

  PRCCSR_MST029              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST029"

  PRCCSR_MST030              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST030"

  PRCCSR_NCM001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM001"

  PRCCSR_NCM002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM002"

  PRCCSR_NCM003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM003"

  PRCCSR_NCM004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM004"

  PRCCSR_OST001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OST001"

  PRCCSR_OTR001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR001"

  PRCCSR_OTR002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR002"

  PRCCSR_OTR003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR003"

  PRCCSR_OTR004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR004"

  PRCCSR_OTR005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR005"

  PRCCSR_PGN001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN001"

  PRCCSR_PGN002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN002"

  PRCCSR_PGN003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN003"

  PRCCSR_PGN004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN004"

  PRCCSR_PGN005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN005"

  PRCCSR_PGN006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN006"

  PRCCSR_PGN007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN007"

  PRCCSR_PGN008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN008"

  PRCCSR_PGN009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN009"

  PRCCSR_PLC001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PLC001"

  PRCCSR_PLC002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PLC002"

  PRCCSR_PNS001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS001"

  PRCCSR_PNS002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS002"

  PRCCSR_PNS003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS003"

  PRCCSR_PNS004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS004"

  PRCCSR_PNS005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS005"

  PRCCSR_PNS006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS006"

  PRCCSR_RAD001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD001"

  PRCCSR_RAD002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD002"

  PRCCSR_RAD003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD003"

  PRCCSR_RAD004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD004"

  PRCCSR_RES001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES001"

  PRCCSR_RES002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES002"

  PRCCSR_RES003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES003"

  PRCCSR_RES004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES004"

  PRCCSR_RES005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES005"

  PRCCSR_RES006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES006"

  PRCCSR_RES007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES007"

  PRCCSR_RES008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES008"

  PRCCSR_RES009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES009"

  PRCCSR_RES010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES010"

  PRCCSR_RES011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES011"

  PRCCSR_RES012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES012"

  PRCCSR_RES013              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES013"

  PRCCSR_RES014              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES014"

  PRCCSR_RHB001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB001"

  PRCCSR_RHB002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB002"

  PRCCSR_RHB003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB003"

  PRCCSR_RHB004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB004"

  PRCCSR_SKB001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB001"

  PRCCSR_SKB002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB002"

  PRCCSR_SKB003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB003"

  PRCCSR_SKB004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB004"

  PRCCSR_SKB005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB005"

  PRCCSR_SKB006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB006"

  PRCCSR_SKB007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB007"

  PRCCSR_SKB008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB008"

  PRCCSR_SKB009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB009"

  PRCCSR_SKB010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB010"

  PRCCSR_SUD001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD001"

  PRCCSR_SUD002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD002"

  PRCCSR_SUD003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD003"

  PRCCSR_SUD004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD004"

  PRCCSR_URN001              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN001"

  PRCCSR_URN002              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN002"

  PRCCSR_URN003              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN003"

  PRCCSR_URN004              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN004"

  PRCCSR_URN005              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN005"

  PRCCSR_URN006              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN006"

  PRCCSR_URN007              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN007"

  PRCCSR_URN008              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN008"

  PRCCSR_URN009              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN009"

  PRCCSR_URN010              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN010"

  PRCCSR_URN011              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN011"

  PRCCSR_URN012              LENGTH=3
  LABEL="Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN012"

  PRCCSR_VERSION             LENGTH=$6
  LABEL="Version of CCSR for ICD-10-PCS procedures"

  CCIR_VERSION               LENGTH=$6
  LABEL="Version of Chronic Condition Indicator Refined for ICD-10-CM"

  CCIR1                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 1"

  CCIR2                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 2"

  CCIR3                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 3"

  CCIR4                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 4"

  CCIR5                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 5"

  CCIR6                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 6"

  CCIR7                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 7"

  CCIR8                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 8"

  CCIR9                      LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 9"

  CCIR10                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 10"

  CCIR11                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 11"

  CCIR12                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 12"

  CCIR13                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 13"

  CCIR14                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 14"

  CCIR15                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 15"

  CCIR16                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 16"

  CCIR17                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 17"

  CCIR18                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 18"

  CCIR19                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 19"

  CCIR20                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 20"

  CCIR21                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 21"

  CCIR22                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 22"

  CCIR23                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 23"

  CCIR24                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 24"

  CCIR25                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 25"

  CCIR26                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 26"

  CCIR27                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 27"

  CCIR28                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 28"

  CCIR29                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 29"

  CCIR30                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 30"

  CCIR31                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 31"

  CCIR32                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 32"

  CCIR33                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 33"

  CCIR34                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 34"

  CCIR35                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 35"

  CCIR36                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 36"

  CCIR37                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 37"

  CCIR38                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 38"

  CCIR39                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 39"

  CCIR40                     LENGTH=3
  LABEL="ICD-10-CM Chronic Condition Indicator Refined 40"
  ;

*** Read data elements from the ASCII file ***;
INPUT 
      @1      HOSP_NIS                 N5PF.
      @6      KEY_NIS                  N10PF.
      @16     CMR_AIDS                 N2PF.
      @18     CMR_ALCOHOL              N2PF.
      @20     CMR_AUTOIMMUNE           N2PF.
      @22     CMR_CANCER_LYMPH         N2PF.
      @24     CMR_CANCER_LEUK          N2PF.
      @26     CMR_CANCER_METS          N2PF.
      @28     CMR_CANCER_NSITU         N2PF.
      @30     CMR_CANCER_SOLID         N2PF.
      @32     CMR_DEMENTIA             N2PF.
      @34     CMR_DEPRESS              N2PF.
      @36     CMR_DIAB_UNCX            N2PF.
      @38     CMR_DIAB_CX              N2PF.
      @40     CMR_DRUG_ABUSE           N2PF.
      @42     CMR_HTN_CX               N2PF.
      @44     CMR_HTN_UNCX             N2PF.
      @46     CMR_LUNG_CHRONIC         N2PF.
      @48     CMR_OBESE                N2PF.
      @50     CMR_PERIVASC             N2PF.
      @52     CMR_THYROID_HYPO         N2PF.
      @54     CMR_THYROID_OTH          N2PF.
      @56     CMR_VERSION              $CHAR6.
      @62     PCLASS1                  N3PF.
      @65     PCLASS2                  N3PF.
      @68     PCLASS3                  N3PF.
      @71     PCLASS4                  N3PF.
      @74     PCLASS5                  N3PF.
      @77     PCLASS6                  N3PF.
      @80     PCLASS7                  N3PF.
      @83     PCLASS8                  N3PF.
      @86     PCLASS9                  N3PF.
      @89     PCLASS10                 N3PF.
      @92     PCLASS11                 N3PF.
      @95     PCLASS12                 N3PF.
      @98     PCLASS13                 N3PF.
      @101    PCLASS14                 N3PF.
      @104    PCLASS15                 N3PF.
      @107    PCLASS16                 N3PF.
      @110    PCLASS17                 N3PF.
      @113    PCLASS18                 N3PF.
      @116    PCLASS19                 N3PF.
      @119    PCLASS20                 N3PF.
      @122    PCLASS21                 N3PF.
      @125    PCLASS22                 N3PF.
      @128    PCLASS23                 N3PF.
      @131    PCLASS24                 N3PF.
      @134    PCLASS25                 N3PF.
      @137    PCLASS_VERSION           $CHAR6.
      @143    DXCCSR_Default_DX1       $CHAR6.
      @149    DXCCSR_BLD001            1.
      @150    DXCCSR_BLD002            1.
      @151    DXCCSR_BLD003            1.
      @152    DXCCSR_BLD004            1.
      @153    DXCCSR_BLD005            1.
      @154    DXCCSR_BLD006            1.
      @155    DXCCSR_BLD007            1.
      @156    DXCCSR_BLD008            1.
      @157    DXCCSR_BLD009            1.
      @158    DXCCSR_BLD010            1.
      @159    DXCCSR_CIR001            1.
      @160    DXCCSR_CIR002            1.
      @161    DXCCSR_CIR003            1.
      @162    DXCCSR_CIR004            1.
      @163    DXCCSR_CIR005            1.
      @164    DXCCSR_CIR006            1.
      @165    DXCCSR_CIR007            1.
      @166    DXCCSR_CIR008            1.
      @167    DXCCSR_CIR009            1.
      @168    DXCCSR_CIR010            1.
      @169    DXCCSR_CIR011            1.
      @170    DXCCSR_CIR012            1.
      @171    DXCCSR_CIR013            1.
      @172    DXCCSR_CIR014            1.
      @173    DXCCSR_CIR015            1.
      @174    DXCCSR_CIR016            1.
      @175    DXCCSR_CIR017            1.
      @176    DXCCSR_CIR018            1.
      @177    DXCCSR_CIR019            1.
      @178    DXCCSR_CIR020            1.
      @179    DXCCSR_CIR021            1.
      @180    DXCCSR_CIR022            1.
      @181    DXCCSR_CIR023            1.
      @182    DXCCSR_CIR024            1.
      @183    DXCCSR_CIR025            1.
      @184    DXCCSR_CIR026            1.
      @185    DXCCSR_CIR027            1.
      @186    DXCCSR_CIR028            1.
      @187    DXCCSR_CIR029            1.
      @188    DXCCSR_CIR030            1.
      @189    DXCCSR_CIR031            1.
      @190    DXCCSR_CIR032            1.
      @191    DXCCSR_CIR033            1.
      @192    DXCCSR_CIR034            1.
      @193    DXCCSR_CIR035            1.
      @194    DXCCSR_CIR036            1.
      @195    DXCCSR_CIR037            1.
      @196    DXCCSR_CIR038            1.
      @197    DXCCSR_CIR039            1.
      @198    DXCCSR_DEN001            1.
      @199    DXCCSR_DEN002            1.
      @200    DXCCSR_DEN003            1.
      @201    DXCCSR_DIG001            1.
      @202    DXCCSR_DIG002            1.
      @203    DXCCSR_DIG003            1.
      @204    DXCCSR_DIG004            1.
      @205    DXCCSR_DIG005            1.
      @206    DXCCSR_DIG006            1.
      @207    DXCCSR_DIG007            1.
      @208    DXCCSR_DIG008            1.
      @209    DXCCSR_DIG009            1.
      @210    DXCCSR_DIG010            1.
      @211    DXCCSR_DIG011            1.
      @212    DXCCSR_DIG012            1.
      @213    DXCCSR_DIG013            1.
      @214    DXCCSR_DIG014            1.
      @215    DXCCSR_DIG015            1.
      @216    DXCCSR_DIG016            1.
      @217    DXCCSR_DIG017            1.
      @218    DXCCSR_DIG018            1.
      @219    DXCCSR_DIG019            1.
      @220    DXCCSR_DIG020            1.
      @221    DXCCSR_DIG021            1.
      @222    DXCCSR_DIG022            1.
      @223    DXCCSR_DIG023            1.
      @224    DXCCSR_DIG024            1.
      @225    DXCCSR_DIG025            1.
      @226    DXCCSR_EAR001            1.
      @227    DXCCSR_EAR002            1.
      @228    DXCCSR_EAR003            1.
      @229    DXCCSR_EAR004            1.
      @230    DXCCSR_EAR005            1.
      @231    DXCCSR_EAR006            1.
      @232    DXCCSR_END001            1.
      @233    DXCCSR_END002            1.
      @234    DXCCSR_END003            1.
      @235    DXCCSR_END004            1.
      @236    DXCCSR_END005            1.
      @237    DXCCSR_END006            1.
      @238    DXCCSR_END007            1.
      @239    DXCCSR_END008            1.
      @240    DXCCSR_END009            1.
      @241    DXCCSR_END010            1.
      @242    DXCCSR_END011            1.
      @243    DXCCSR_END012            1.
      @244    DXCCSR_END013            1.
      @245    DXCCSR_END014            1.
      @246    DXCCSR_END015            1.
      @247    DXCCSR_END016            1.
      @248    DXCCSR_END017            1.
      @249    DXCCSR_EXT001            1.
      @250    DXCCSR_EXT002            1.
      @251    DXCCSR_EXT003            1.
      @252    DXCCSR_EXT004            1.
      @253    DXCCSR_EXT005            1.
      @254    DXCCSR_EXT006            1.
      @255    DXCCSR_EXT007            1.
      @256    DXCCSR_EXT008            1.
      @257    DXCCSR_EXT009            1.
      @258    DXCCSR_EXT010            1.
      @259    DXCCSR_EXT011            1.
      @260    DXCCSR_EXT012            1.
      @261    DXCCSR_EXT013            1.
      @262    DXCCSR_EXT014            1.
      @263    DXCCSR_EXT015            1.
      @264    DXCCSR_EXT016            1.
      @265    DXCCSR_EXT017            1.
      @266    DXCCSR_EXT018            1.
      @267    DXCCSR_EXT019            1.
      @268    DXCCSR_EXT020            1.
      @269    DXCCSR_EXT021            1.
      @270    DXCCSR_EXT022            1.
      @271    DXCCSR_EXT023            1.
      @272    DXCCSR_EXT024            1.
      @273    DXCCSR_EXT025            1.
      @274    DXCCSR_EXT026            1.
      @275    DXCCSR_EXT027            1.
      @276    DXCCSR_EXT028            1.
      @277    DXCCSR_EXT029            1.
      @278    DXCCSR_EXT030            1.
      @279    DXCCSR_EYE001            1.
      @280    DXCCSR_EYE002            1.
      @281    DXCCSR_EYE003            1.
      @282    DXCCSR_EYE004            1.
      @283    DXCCSR_EYE005            1.
      @284    DXCCSR_EYE006            1.
      @285    DXCCSR_EYE007            1.
      @286    DXCCSR_EYE008            1.
      @287    DXCCSR_EYE009            1.
      @288    DXCCSR_EYE010            1.
      @289    DXCCSR_EYE011            1.
      @290    DXCCSR_EYE012            1.
      @291    DXCCSR_FAC001            1.
      @292    DXCCSR_FAC002            1.
      @293    DXCCSR_FAC003            1.
      @294    DXCCSR_FAC004            1.
      @295    DXCCSR_FAC005            1.
      @296    DXCCSR_FAC006            1.
      @297    DXCCSR_FAC007            1.
      @298    DXCCSR_FAC008            1.
      @299    DXCCSR_FAC009            1.
      @300    DXCCSR_FAC010            1.
      @301    DXCCSR_FAC011            1.
      @302    DXCCSR_FAC012            1.
      @303    DXCCSR_FAC013            1.
      @304    DXCCSR_FAC014            1.
      @305    DXCCSR_FAC015            1.
      @306    DXCCSR_FAC016            1.
      @307    DXCCSR_FAC017            1.
      @308    DXCCSR_FAC018            1.
      @309    DXCCSR_FAC019            1.
      @310    DXCCSR_FAC020            1.
      @311    DXCCSR_FAC021            1.
      @312    DXCCSR_FAC022            1.
      @313    DXCCSR_FAC023            1.
      @314    DXCCSR_FAC024            1.
      @315    DXCCSR_FAC025            1.
      @316    DXCCSR_FAC026            1.
      @317    DXCCSR_FAC027            1.
      @318    DXCCSR_FAC028            1.
      @319    DXCCSR_FAC029            1.
      @320    DXCCSR_FAC030            1.
      @321    DXCCSR_GEN001            1.
      @322    DXCCSR_GEN002            1.
      @323    DXCCSR_GEN003            1.
      @324    DXCCSR_GEN004            1.
      @325    DXCCSR_GEN005            1.
      @326    DXCCSR_GEN006            1.
      @327    DXCCSR_GEN007            1.
      @328    DXCCSR_GEN008            1.
      @329    DXCCSR_GEN009            1.
      @330    DXCCSR_GEN010            1.
      @331    DXCCSR_GEN011            1.
      @332    DXCCSR_GEN012            1.
      @333    DXCCSR_GEN013            1.
      @334    DXCCSR_GEN014            1.
      @335    DXCCSR_GEN015            1.
      @336    DXCCSR_GEN016            1.
      @337    DXCCSR_GEN017            1.
      @338    DXCCSR_GEN018            1.
      @339    DXCCSR_GEN019            1.
      @340    DXCCSR_GEN020            1.
      @341    DXCCSR_GEN021            1.
      @342    DXCCSR_GEN022            1.
      @343    DXCCSR_GEN023            1.
      @344    DXCCSR_GEN024            1.
      @345    DXCCSR_GEN025            1.
      @346    DXCCSR_GEN026            1.
      @347    DXCCSR_INF001            1.
      @348    DXCCSR_INF002            1.
      @349    DXCCSR_INF003            1.
      @350    DXCCSR_INF004            1.
      @351    DXCCSR_INF005            1.
      @352    DXCCSR_INF006            1.
      @353    DXCCSR_INF007            1.
      @354    DXCCSR_INF008            1.
      @355    DXCCSR_INF009            1.
      @356    DXCCSR_INF010            1.
      @357    DXCCSR_INF011            1.
      @358    DXCCSR_INF012            1.
      @359    DXCCSR_INJ001            1.
      @360    DXCCSR_INJ002            1.
      @361    DXCCSR_INJ003            1.
      @362    DXCCSR_INJ004            1.
      @363    DXCCSR_INJ005            1.
      @364    DXCCSR_INJ006            1.
      @365    DXCCSR_INJ007            1.
      @366    DXCCSR_INJ008            1.
      @367    DXCCSR_INJ009            1.
      @368    DXCCSR_INJ010            1.
      @369    DXCCSR_INJ011            1.
      @370    DXCCSR_INJ012            1.
      @371    DXCCSR_INJ013            1.
      @372    DXCCSR_INJ014            1.
      @373    DXCCSR_INJ015            1.
      @374    DXCCSR_INJ016            1.
      @375    DXCCSR_INJ017            1.
      @376    DXCCSR_INJ018            1.
      @377    DXCCSR_INJ019            1.
      @378    DXCCSR_INJ020            1.
      @379    DXCCSR_INJ021            1.
      @380    DXCCSR_INJ022            1.
      @381    DXCCSR_INJ023            1.
      @382    DXCCSR_INJ024            1.
      @383    DXCCSR_INJ025            1.
      @384    DXCCSR_INJ026            1.
      @385    DXCCSR_INJ027            1.
      @386    DXCCSR_INJ028            1.
      @387    DXCCSR_INJ029            1.
      @388    DXCCSR_INJ030            1.
      @389    DXCCSR_INJ031            1.
      @390    DXCCSR_INJ032            1.
      @391    DXCCSR_INJ033            1.
      @392    DXCCSR_INJ034            1.
      @393    DXCCSR_INJ035            1.
      @394    DXCCSR_INJ036            1.
      @395    DXCCSR_INJ037            1.
      @396    DXCCSR_INJ038            1.
      @397    DXCCSR_INJ039            1.
      @398    DXCCSR_INJ040            1.
      @399    DXCCSR_INJ041            1.
      @400    DXCCSR_INJ042            1.
      @401    DXCCSR_INJ043            1.
      @402    DXCCSR_INJ044            1.
      @403    DXCCSR_INJ045            1.
      @404    DXCCSR_INJ046            1.
      @405    DXCCSR_INJ047            1.
      @406    DXCCSR_INJ048            1.
      @407    DXCCSR_INJ049            1.
      @408    DXCCSR_INJ050            1.
      @409    DXCCSR_INJ051            1.
      @410    DXCCSR_INJ052            1.
      @411    DXCCSR_INJ053            1.
      @412    DXCCSR_INJ054            1.
      @413    DXCCSR_INJ055            1.
      @414    DXCCSR_INJ056            1.
      @415    DXCCSR_INJ057            1.
      @416    DXCCSR_INJ058            1.
      @417    DXCCSR_INJ059            1.
      @418    DXCCSR_INJ060            1.
      @419    DXCCSR_INJ061            1.
      @420    DXCCSR_INJ062            1.
      @421    DXCCSR_INJ063            1.
      @422    DXCCSR_INJ064            1.
      @423    DXCCSR_INJ065            1.
      @424    DXCCSR_INJ066            1.
      @425    DXCCSR_INJ067            1.
      @426    DXCCSR_INJ068            1.
      @427    DXCCSR_INJ069            1.
      @428    DXCCSR_INJ070            1.
      @429    DXCCSR_INJ071            1.
      @430    DXCCSR_INJ072            1.
      @431    DXCCSR_INJ073            1.
      @432    DXCCSR_INJ074            1.
      @433    DXCCSR_INJ075            1.
      @434    DXCCSR_INJ076            1.
      @435    DXCCSR_MAL001            1.
      @436    DXCCSR_MAL002            1.
      @437    DXCCSR_MAL003            1.
      @438    DXCCSR_MAL004            1.
      @439    DXCCSR_MAL005            1.
      @440    DXCCSR_MAL006            1.
      @441    DXCCSR_MAL007            1.
      @442    DXCCSR_MAL008            1.
      @443    DXCCSR_MAL009            1.
      @444    DXCCSR_MAL010            1.
      @445    DXCCSR_MBD001            1.
      @446    DXCCSR_MBD002            1.
      @447    DXCCSR_MBD003            1.
      @448    DXCCSR_MBD004            1.
      @449    DXCCSR_MBD005            1.
      @450    DXCCSR_MBD006            1.
      @451    DXCCSR_MBD007            1.
      @452    DXCCSR_MBD008            1.
      @453    DXCCSR_MBD009            1.
      @454    DXCCSR_MBD010            1.
      @455    DXCCSR_MBD011            1.
      @456    DXCCSR_MBD012            1.
      @457    DXCCSR_MBD013            1.
      @458    DXCCSR_MBD014            1.
      @459    DXCCSR_MBD017            1.
      @460    DXCCSR_MBD018            1.
      @461    DXCCSR_MBD019            1.
      @462    DXCCSR_MBD020            1.
      @463    DXCCSR_MBD021            1.
      @464    DXCCSR_MBD022            1.
      @465    DXCCSR_MBD023            1.
      @466    DXCCSR_MBD024            1.
      @467    DXCCSR_MBD025            1.
      @468    DXCCSR_MBD026            1.
      @469    DXCCSR_MBD027            1.
      @470    DXCCSR_MBD028            1.
      @471    DXCCSR_MBD029            1.
      @472    DXCCSR_MBD030            1.
      @473    DXCCSR_MBD031            1.
      @474    DXCCSR_MBD032            1.
      @475    DXCCSR_MBD033            1.
      @476    DXCCSR_MBD034            1.
      @477    DXCCSR_MUS001            1.
      @478    DXCCSR_MUS002            1.
      @479    DXCCSR_MUS003            1.
      @480    DXCCSR_MUS004            1.
      @481    DXCCSR_MUS005            1.
      @482    DXCCSR_MUS006            1.
      @483    DXCCSR_MUS007            1.
      @484    DXCCSR_MUS008            1.
      @485    DXCCSR_MUS009            1.
      @486    DXCCSR_MUS010            1.
      @487    DXCCSR_MUS011            1.
      @488    DXCCSR_MUS012            1.
      @489    DXCCSR_MUS013            1.
      @490    DXCCSR_MUS014            1.
      @491    DXCCSR_MUS015            1.
      @492    DXCCSR_MUS016            1.
      @493    DXCCSR_MUS017            1.
      @494    DXCCSR_MUS018            1.
      @495    DXCCSR_MUS019            1.
      @496    DXCCSR_MUS020            1.
      @497    DXCCSR_MUS021            1.
      @498    DXCCSR_MUS022            1.
      @499    DXCCSR_MUS023            1.
      @500    DXCCSR_MUS024            1.
      @501    DXCCSR_MUS025            1.
      @502    DXCCSR_MUS026            1.
      @503    DXCCSR_MUS027            1.
      @504    DXCCSR_MUS028            1.
      @505    DXCCSR_MUS029            1.
      @506    DXCCSR_MUS030            1.
      @507    DXCCSR_MUS031            1.
      @508    DXCCSR_MUS032            1.
      @509    DXCCSR_MUS033            1.
      @510    DXCCSR_MUS034            1.
      @511    DXCCSR_MUS035            1.
      @512    DXCCSR_MUS036            1.
      @513    DXCCSR_MUS037            1.
      @514    DXCCSR_MUS038            1.
      @515    DXCCSR_NEO001            1.
      @516    DXCCSR_NEO002            1.
      @517    DXCCSR_NEO003            1.
      @518    DXCCSR_NEO004            1.
      @519    DXCCSR_NEO005            1.
      @520    DXCCSR_NEO006            1.
      @521    DXCCSR_NEO007            1.
      @522    DXCCSR_NEO008            1.
      @523    DXCCSR_NEO009            1.
      @524    DXCCSR_NEO010            1.
      @525    DXCCSR_NEO011            1.
      @526    DXCCSR_NEO012            1.
      @527    DXCCSR_NEO013            1.
      @528    DXCCSR_NEO014            1.
      @529    DXCCSR_NEO015            1.
      @530    DXCCSR_NEO016            1.
      @531    DXCCSR_NEO017            1.
      @532    DXCCSR_NEO018            1.
      @533    DXCCSR_NEO019            1.
      @534    DXCCSR_NEO020            1.
      @535    DXCCSR_NEO021            1.
      @536    DXCCSR_NEO022            1.
      @537    DXCCSR_NEO023            1.
      @538    DXCCSR_NEO024            1.
      @539    DXCCSR_NEO025            1.
      @540    DXCCSR_NEO026            1.
      @541    DXCCSR_NEO027            1.
      @542    DXCCSR_NEO028            1.
      @543    DXCCSR_NEO029            1.
      @544    DXCCSR_NEO030            1.
      @545    DXCCSR_NEO031            1.
      @546    DXCCSR_NEO032            1.
      @547    DXCCSR_NEO033            1.
      @548    DXCCSR_NEO034            1.
      @549    DXCCSR_NEO035            1.
      @550    DXCCSR_NEO036            1.
      @551    DXCCSR_NEO037            1.
      @552    DXCCSR_NEO038            1.
      @553    DXCCSR_NEO039            1.
      @554    DXCCSR_NEO040            1.
      @555    DXCCSR_NEO041            1.
      @556    DXCCSR_NEO042            1.
      @557    DXCCSR_NEO043            1.
      @558    DXCCSR_NEO044            1.
      @559    DXCCSR_NEO045            1.
      @560    DXCCSR_NEO046            1.
      @561    DXCCSR_NEO047            1.
      @562    DXCCSR_NEO048            1.
      @563    DXCCSR_NEO049            1.
      @564    DXCCSR_NEO050            1.
      @565    DXCCSR_NEO051            1.
      @566    DXCCSR_NEO052            1.
      @567    DXCCSR_NEO053            1.
      @568    DXCCSR_NEO054            1.
      @569    DXCCSR_NEO055            1.
      @570    DXCCSR_NEO056            1.
      @571    DXCCSR_NEO057            1.
      @572    DXCCSR_NEO058            1.
      @573    DXCCSR_NEO059            1.
      @574    DXCCSR_NEO060            1.
      @575    DXCCSR_NEO061            1.
      @576    DXCCSR_NEO062            1.
      @577    DXCCSR_NEO063            1.
      @578    DXCCSR_NEO064            1.
      @579    DXCCSR_NEO065            1.
      @580    DXCCSR_NEO066            1.
      @581    DXCCSR_NEO067            1.
      @582    DXCCSR_NEO068            1.
      @583    DXCCSR_NEO069            1.
      @584    DXCCSR_NEO070            1.
      @585    DXCCSR_NEO071            1.
      @586    DXCCSR_NEO072            1.
      @587    DXCCSR_NEO073            1.
      @588    DXCCSR_NEO074            1.
      @589    DXCCSR_NEO075            1.
      @590    DXCCSR_NEO076            1.
      @591    DXCCSR_NEO077            1.
      @592    DXCCSR_NEO078            1.
      @593    DXCCSR_NVS001            1.
      @594    DXCCSR_NVS002            1.
      @595    DXCCSR_NVS003            1.
      @596    DXCCSR_NVS004            1.
      @597    DXCCSR_NVS005            1.
      @598    DXCCSR_NVS006            1.
      @599    DXCCSR_NVS007            1.
      @600    DXCCSR_NVS008            1.
      @601    DXCCSR_NVS009            1.
      @602    DXCCSR_NVS010            1.
      @603    DXCCSR_NVS011            1.
      @604    DXCCSR_NVS012            1.
      @605    DXCCSR_NVS013            1.
      @606    DXCCSR_NVS014            1.
      @607    DXCCSR_NVS015            1.
      @608    DXCCSR_NVS016            1.
      @609    DXCCSR_NVS017            1.
      @610    DXCCSR_NVS018            1.
      @611    DXCCSR_NVS019            1.
      @612    DXCCSR_NVS020            1.
      @613    DXCCSR_NVS021            1.
      @614    DXCCSR_NVS022            1.
      @615    DXCCSR_PNL001            1.
      @616    DXCCSR_PNL002            1.
      @617    DXCCSR_PNL003            1.
      @618    DXCCSR_PNL004            1.
      @619    DXCCSR_PNL005            1.
      @620    DXCCSR_PNL006            1.
      @621    DXCCSR_PNL007            1.
      @622    DXCCSR_PNL008            1.
      @623    DXCCSR_PNL009            1.
      @624    DXCCSR_PNL010            1.
      @625    DXCCSR_PNL011            1.
      @626    DXCCSR_PNL012            1.
      @627    DXCCSR_PNL013            1.
      @628    DXCCSR_PNL014            1.
      @629    DXCCSR_PNL015            1.
      @630    DXCCSR_PRG001            1.
      @631    DXCCSR_PRG002            1.
      @632    DXCCSR_PRG003            1.
      @633    DXCCSR_PRG004            1.
      @634    DXCCSR_PRG005            1.
      @635    DXCCSR_PRG006            1.
      @636    DXCCSR_PRG007            1.
      @637    DXCCSR_PRG008            1.
      @638    DXCCSR_PRG009            1.
      @639    DXCCSR_PRG010            1.
      @640    DXCCSR_PRG011            1.
      @641    DXCCSR_PRG012            1.
      @642    DXCCSR_PRG013            1.
      @643    DXCCSR_PRG014            1.
      @644    DXCCSR_PRG015            1.
      @645    DXCCSR_PRG016            1.
      @646    DXCCSR_PRG017            1.
      @647    DXCCSR_PRG018            1.
      @648    DXCCSR_PRG019            1.
      @649    DXCCSR_PRG020            1.
      @650    DXCCSR_PRG021            1.
      @651    DXCCSR_PRG022            1.
      @652    DXCCSR_PRG023            1.
      @653    DXCCSR_PRG024            1.
      @654    DXCCSR_PRG025            1.
      @655    DXCCSR_PRG026            1.
      @656    DXCCSR_PRG027            1.
      @657    DXCCSR_PRG028            1.
      @658    DXCCSR_PRG029            1.
      @659    DXCCSR_PRG030            1.
      @660    DXCCSR_RSP001            1.
      @661    DXCCSR_RSP002            1.
      @662    DXCCSR_RSP003            1.
      @663    DXCCSR_RSP004            1.
      @664    DXCCSR_RSP005            1.
      @665    DXCCSR_RSP006            1.
      @666    DXCCSR_RSP007            1.
      @667    DXCCSR_RSP008            1.
      @668    DXCCSR_RSP009            1.
      @669    DXCCSR_RSP010            1.
      @670    DXCCSR_RSP011            1.
      @671    DXCCSR_RSP012            1.
      @672    DXCCSR_RSP013            1.
      @673    DXCCSR_RSP014            1.
      @674    DXCCSR_RSP015            1.
      @675    DXCCSR_RSP016            1.
      @676    DXCCSR_RSP017            1.
      @677    DXCCSR_SKN001            1.
      @678    DXCCSR_SKN002            1.
      @679    DXCCSR_SKN003            1.
      @680    DXCCSR_SKN004            1.
      @681    DXCCSR_SKN005            1.
      @682    DXCCSR_SKN006            1.
      @683    DXCCSR_SKN007            1.
      @684    DXCCSR_SYM001            1.
      @685    DXCCSR_SYM002            1.
      @686    DXCCSR_SYM003            1.
      @687    DXCCSR_SYM004            1.
      @688    DXCCSR_SYM005            1.
      @689    DXCCSR_SYM006            1.
      @690    DXCCSR_SYM007            1.
      @691    DXCCSR_SYM008            1.
      @692    DXCCSR_SYM009            1.
      @693    DXCCSR_SYM010            1.
      @694    DXCCSR_SYM011            1.
      @695    DXCCSR_SYM012            1.
      @696    DXCCSR_SYM013            1.
      @697    DXCCSR_SYM014            1.
      @698    DXCCSR_SYM015            1.
      @699    DXCCSR_SYM016            1.
      @700    DXCCSR_SYM017            1.
      @701    DXCCSR_SYM018            1.
      @702    DXCCSR_VERSION           $CHAR6.
      @708    PRCCSR_ADM001            1.
      @709    PRCCSR_ADM002            1.
      @710    PRCCSR_ADM003            1.
      @711    PRCCSR_ADM004            1.
      @712    PRCCSR_ADM005            1.
      @713    PRCCSR_ADM006            1.
      @714    PRCCSR_ADM007            1.
      @715    PRCCSR_ADM008            1.
      @716    PRCCSR_ADM009            1.
      @717    PRCCSR_ADM010            1.
      @718    PRCCSR_ADM011            1.
      @719    PRCCSR_ADM012            1.
      @720    PRCCSR_ADM013            1.
      @721    PRCCSR_ADM014            1.
      @722    PRCCSR_ADM015            1.
      @723    PRCCSR_ADM016            1.
      @724    PRCCSR_ADM017            1.
      @725    PRCCSR_ADM018            1.
      @726    PRCCSR_ADM019            1.
      @727    PRCCSR_ADM020            1.
      @728    PRCCSR_ADM021            1.
      @729    PRCCSR_ADM022            1.
      @730    PRCCSR_CAR001            1.
      @731    PRCCSR_CAR002            1.
      @732    PRCCSR_CAR003            1.
      @733    PRCCSR_CAR004            1.
      @734    PRCCSR_CAR005            1.
      @735    PRCCSR_CAR006            1.
      @736    PRCCSR_CAR007            1.
      @737    PRCCSR_CAR008            1.
      @738    PRCCSR_CAR009            1.
      @739    PRCCSR_CAR010            1.
      @740    PRCCSR_CAR011            1.
      @741    PRCCSR_CAR012            1.
      @742    PRCCSR_CAR013            1.
      @743    PRCCSR_CAR014            1.
      @744    PRCCSR_CAR015            1.
      @745    PRCCSR_CAR016            1.
      @746    PRCCSR_CAR017            1.
      @747    PRCCSR_CAR018            1.
      @748    PRCCSR_CAR019            1.
      @749    PRCCSR_CAR020            1.
      @750    PRCCSR_CAR021            1.
      @751    PRCCSR_CAR022            1.
      @752    PRCCSR_CAR023            1.
      @753    PRCCSR_CAR024            1.
      @754    PRCCSR_CAR025            1.
      @755    PRCCSR_CAR026            1.
      @756    PRCCSR_CAR027            1.
      @757    PRCCSR_CAR028            1.
      @758    PRCCSR_CAR029            1.
      @759    PRCCSR_CHP001            1.
      @760    PRCCSR_CNS001            1.
      @761    PRCCSR_CNS002            1.
      @762    PRCCSR_CNS003            1.
      @763    PRCCSR_CNS004            1.
      @764    PRCCSR_CNS005            1.
      @765    PRCCSR_CNS006            1.
      @766    PRCCSR_CNS007            1.
      @767    PRCCSR_CNS008            1.
      @768    PRCCSR_CNS009            1.
      @769    PRCCSR_CNS010            1.
      @770    PRCCSR_CNS011            1.
      @771    PRCCSR_CNS012            1.
      @772    PRCCSR_CNS013            1.
      @773    PRCCSR_CNS014            1.
      @774    PRCCSR_ENP001            1.
      @775    PRCCSR_ENP002            1.
      @776    PRCCSR_ENP003            1.
      @777    PRCCSR_ENP004            1.
      @778    PRCCSR_ENP005            1.
      @779    PRCCSR_ENP006            1.
      @780    PRCCSR_ENT001            1.
      @781    PRCCSR_ENT002            1.
      @782    PRCCSR_ENT003            1.
      @783    PRCCSR_ENT004            1.
      @784    PRCCSR_ENT005            1.
      @785    PRCCSR_ENT006            1.
      @786    PRCCSR_ENT007            1.
      @787    PRCCSR_ENT008            1.
      @788    PRCCSR_ENT009            1.
      @789    PRCCSR_ENT010            1.
      @790    PRCCSR_ENT011            1.
      @791    PRCCSR_ENT012            1.
      @792    PRCCSR_ENT013            1.
      @793    PRCCSR_ENT014            1.
      @794    PRCCSR_ENT015            1.
      @795    PRCCSR_ENT016            1.
      @796    PRCCSR_ENT017            1.
      @797    PRCCSR_ESA001            1.
      @798    PRCCSR_ESA002            1.
      @799    PRCCSR_ESA003            1.
      @800    PRCCSR_ESA004            1.
      @801    PRCCSR_ESA005            1.
      @802    PRCCSR_ESA006            1.
      @803    PRCCSR_ESA007            1.
      @804    PRCCSR_ESA008            1.
      @805    PRCCSR_ESA009            1.
      @806    PRCCSR_ESA010            1.
      @807    PRCCSR_ESA011            1.
      @808    PRCCSR_ESA012            1.
      @809    PRCCSR_EST001            1.
      @810    PRCCSR_EST002            1.
      @811    PRCCSR_EST003            1.
      @812    PRCCSR_EST004            1.
      @813    PRCCSR_EST005            1.
      @814    PRCCSR_EYP001            1.
      @815    PRCCSR_EYP002            1.
      @816    PRCCSR_FRS001            1.
      @817    PRCCSR_FRS002            1.
      @818    PRCCSR_FRS003            1.
      @819    PRCCSR_FRS004            1.
      @820    PRCCSR_FRS005            1.
      @821    PRCCSR_FRS006            1.
      @822    PRCCSR_FRS007            1.
      @823    PRCCSR_FRS008            1.
      @824    PRCCSR_FRS009            1.
      @825    PRCCSR_FRS010            1.
      @826    PRCCSR_FRS011            1.
      @827    PRCCSR_FRS012            1.
      @828    PRCCSR_FRS013            1.
      @829    PRCCSR_FRS014            1.
      @830    PRCCSR_FRS015            1.
      @831    PRCCSR_GIS001            1.
      @832    PRCCSR_GIS002            1.
      @833    PRCCSR_GIS003            1.
      @834    PRCCSR_GIS004            1.
      @835    PRCCSR_GIS005            1.
      @836    PRCCSR_GIS006            1.
      @837    PRCCSR_GIS007            1.
      @838    PRCCSR_GIS008            1.
      @839    PRCCSR_GIS009            1.
      @840    PRCCSR_GIS010            1.
      @841    PRCCSR_GIS011            1.
      @842    PRCCSR_GIS012            1.
      @843    PRCCSR_GIS013            1.
      @844    PRCCSR_GIS014            1.
      @845    PRCCSR_GIS015            1.
      @846    PRCCSR_GIS016            1.
      @847    PRCCSR_GIS017            1.
      @848    PRCCSR_GIS018            1.
      @849    PRCCSR_GIS019            1.
      @850    PRCCSR_GIS020            1.
      @851    PRCCSR_GIS021            1.
      @852    PRCCSR_GIS022            1.
      @853    PRCCSR_GIS023            1.
      @854    PRCCSR_GIS024            1.
      @855    PRCCSR_GIS025            1.
      @856    PRCCSR_GIS026            1.
      @857    PRCCSR_GIS027            1.
      @858    PRCCSR_GIS028            1.
      @859    PRCCSR_GIS029            1.
      @860    PRCCSR_GNR001            1.
      @861    PRCCSR_GNR002            1.
      @862    PRCCSR_GNR003            1.
      @863    PRCCSR_GNR004            1.
      @864    PRCCSR_GNR005            1.
      @865    PRCCSR_GNR006            1.
      @866    PRCCSR_GNR007            1.
      @867    PRCCSR_GNR008            1.
      @868    PRCCSR_GNR009            1.
      @869    PRCCSR_GNR010            1.
      @870    PRCCSR_HEP001            1.
      @871    PRCCSR_HEP002            1.
      @872    PRCCSR_HEP003            1.
      @873    PRCCSR_HEP004            1.
      @874    PRCCSR_HEP005            1.
      @875    PRCCSR_HEP006            1.
      @876    PRCCSR_HEP007            1.
      @877    PRCCSR_HEP008            1.
      @878    PRCCSR_HEP009            1.
      @879    PRCCSR_HEP010            1.
      @880    PRCCSR_HEP011            1.
      @881    PRCCSR_HEP012            1.
      @882    PRCCSR_HEP013            1.
      @883    PRCCSR_IMG001            1.
      @884    PRCCSR_IMG002            1.
      @885    PRCCSR_IMG003            1.
      @886    PRCCSR_IMG004            1.
      @887    PRCCSR_IMG005            1.
      @888    PRCCSR_IMG006            1.
      @889    PRCCSR_IMG007            1.
      @890    PRCCSR_IMG008            1.
      @891    PRCCSR_IMG009            1.
      @892    PRCCSR_IMG010            1.
      @893    PRCCSR_LYM001            1.
      @894    PRCCSR_LYM002            1.
      @895    PRCCSR_LYM003            1.
      @896    PRCCSR_LYM004            1.
      @897    PRCCSR_LYM005            1.
      @898    PRCCSR_LYM006            1.
      @899    PRCCSR_LYM007            1.
      @900    PRCCSR_LYM008            1.
      @901    PRCCSR_LYM009            1.
      @902    PRCCSR_LYM010            1.
      @903    PRCCSR_LYM011            1.
      @904    PRCCSR_MAM001            1.
      @905    PRCCSR_MAM002            1.
      @906    PRCCSR_MAM003            1.
      @907    PRCCSR_MAM004            1.
      @908    PRCCSR_MAM005            1.
      @909    PRCCSR_MAM006            1.
      @910    PRCCSR_MAM007            1.
      @911    PRCCSR_MAM008            1.
      @912    PRCCSR_MAM009            1.
      @913    PRCCSR_MAM010            1.
      @914    PRCCSR_MAM011            1.
      @915    PRCCSR_MAM012            1.
      @916    PRCCSR_MAM013            1.
      @917    PRCCSR_MAM014            1.
      @918    PRCCSR_MAM015            1.
      @919    PRCCSR_MHT001            1.
      @920    PRCCSR_MHT002            1.
      @921    PRCCSR_MHT003            1.
      @922    PRCCSR_MHT004            1.
      @923    PRCCSR_MHT005            1.
      @924    PRCCSR_MRS001            1.
      @925    PRCCSR_MRS002            1.
      @926    PRCCSR_MRS003            1.
      @927    PRCCSR_MRS004            1.
      @928    PRCCSR_MRS005            1.
      @929    PRCCSR_MRS006            1.
      @930    PRCCSR_MRS007            1.
      @931    PRCCSR_MST001            1.
      @932    PRCCSR_MST002            1.
      @933    PRCCSR_MST003            1.
      @934    PRCCSR_MST004            1.
      @935    PRCCSR_MST005            1.
      @936    PRCCSR_MST006            1.
      @937    PRCCSR_MST007            1.
      @938    PRCCSR_MST008            1.
      @939    PRCCSR_MST009            1.
      @940    PRCCSR_MST010            1.
      @941    PRCCSR_MST011            1.
      @942    PRCCSR_MST012            1.
      @943    PRCCSR_MST013            1.
      @944    PRCCSR_MST014            1.
      @945    PRCCSR_MST015            1.
      @946    PRCCSR_MST016            1.
      @947    PRCCSR_MST017            1.
      @948    PRCCSR_MST018            1.
      @949    PRCCSR_MST019            1.
      @950    PRCCSR_MST020            1.
      @951    PRCCSR_MST021            1.
      @952    PRCCSR_MST022            1.
      @953    PRCCSR_MST023            1.
      @954    PRCCSR_MST024            1.
      @955    PRCCSR_MST025            1.
      @956    PRCCSR_MST026            1.
      @957    PRCCSR_MST027            1.
      @958    PRCCSR_MST028            1.
      @959    PRCCSR_MST029            1.
      @960    PRCCSR_MST030            1.
      @961    PRCCSR_NCM001            1.
      @962    PRCCSR_NCM002            1.
      @963    PRCCSR_NCM003            1.
      @964    PRCCSR_NCM004            1.
      @965    PRCCSR_OST001            1.
      @966    PRCCSR_OTR001            1.
      @967    PRCCSR_OTR002            1.
      @968    PRCCSR_OTR003            1.
      @969    PRCCSR_OTR004            1.
      @970    PRCCSR_OTR005            1.
      @971    PRCCSR_PGN001            1.
      @972    PRCCSR_PGN002            1.
      @973    PRCCSR_PGN003            1.
      @974    PRCCSR_PGN004            1.
      @975    PRCCSR_PGN005            1.
      @976    PRCCSR_PGN006            1.
      @977    PRCCSR_PGN007            1.
      @978    PRCCSR_PGN008            1.
      @979    PRCCSR_PGN009            1.
      @980    PRCCSR_PLC001            1.
      @981    PRCCSR_PLC002            1.
      @982    PRCCSR_PNS001            1.
      @983    PRCCSR_PNS002            1.
      @984    PRCCSR_PNS003            1.
      @985    PRCCSR_PNS004            1.
      @986    PRCCSR_PNS005            1.
      @987    PRCCSR_PNS006            1.
      @988    PRCCSR_RAD001            1.
      @989    PRCCSR_RAD002            1.
      @990    PRCCSR_RAD003            1.
      @991    PRCCSR_RAD004            1.
      @992    PRCCSR_RES001            1.
      @993    PRCCSR_RES002            1.
      @994    PRCCSR_RES003            1.
      @995    PRCCSR_RES004            1.
      @996    PRCCSR_RES005            1.
      @997    PRCCSR_RES006            1.
      @998    PRCCSR_RES007            1.
      @999    PRCCSR_RES008            1.
      @1000   PRCCSR_RES009            1.
      @1001   PRCCSR_RES010            1.
      @1002   PRCCSR_RES011            1.
      @1003   PRCCSR_RES012            1.
      @1004   PRCCSR_RES013            1.
      @1005   PRCCSR_RES014            1.
      @1006   PRCCSR_RHB001            1.
      @1007   PRCCSR_RHB002            1.
      @1008   PRCCSR_RHB003            1.
      @1009   PRCCSR_RHB004            1.
      @1010   PRCCSR_SKB001            1.
      @1011   PRCCSR_SKB002            1.
      @1012   PRCCSR_SKB003            1.
      @1013   PRCCSR_SKB004            1.
      @1014   PRCCSR_SKB005            1.
      @1015   PRCCSR_SKB006            1.
      @1016   PRCCSR_SKB007            1.
      @1017   PRCCSR_SKB008            1.
      @1018   PRCCSR_SKB009            1.
      @1019   PRCCSR_SKB010            1.
      @1020   PRCCSR_SUD001            1.
      @1021   PRCCSR_SUD002            1.
      @1022   PRCCSR_SUD003            1.
      @1023   PRCCSR_SUD004            1.
      @1024   PRCCSR_URN001            1.
      @1025   PRCCSR_URN002            1.
      @1026   PRCCSR_URN003            1.
      @1027   PRCCSR_URN004            1.
      @1028   PRCCSR_URN005            1.
      @1029   PRCCSR_URN006            1.
      @1030   PRCCSR_URN007            1.
      @1031   PRCCSR_URN008            1.
      @1032   PRCCSR_URN009            1.
      @1033   PRCCSR_URN010            1.
      @1034   PRCCSR_URN011            1.
      @1035   PRCCSR_URN012            1.
      @1036   PRCCSR_VERSION           $CHAR6.
      @1042   CCIR_VERSION             $CHAR6.
      @1048   CCIR1                    N3PF.
      @1051   CCIR2                    N3PF.
      @1054   CCIR3                    N3PF.
      @1057   CCIR4                    N3PF.
      @1060   CCIR5                    N3PF.
      @1063   CCIR6                    N3PF.
      @1066   CCIR7                    N3PF.
      @1069   CCIR8                    N3PF.
      @1072   CCIR9                    N3PF.
      @1075   CCIR10                   N3PF.
      @1078   CCIR11                   N3PF.
      @1081   CCIR12                   N3PF.
      @1084   CCIR13                   N3PF.
      @1087   CCIR14                   N3PF.
      @1090   CCIR15                   N3PF.
      @1093   CCIR16                   N3PF.
      @1096   CCIR17                   N3PF.
      @1099   CCIR18                   N3PF.
      @1102   CCIR19                   N3PF.
      @1105   CCIR20                   N3PF.
      @1108   CCIR21                   N3PF.
      @1111   CCIR22                   N3PF.
      @1114   CCIR23                   N3PF.
      @1117   CCIR24                   N3PF.
      @1120   CCIR25                   N3PF.
      @1123   CCIR26                   N3PF.
      @1126   CCIR27                   N3PF.
      @1129   CCIR28                   N3PF.
      @1132   CCIR29                   N3PF.
      @1135   CCIR30                   N3PF.
      @1138   CCIR31                   N3PF.
      @1141   CCIR32                   N3PF.
      @1144   CCIR33                   N3PF.
      @1147   CCIR34                   N3PF.
      @1150   CCIR35                   N3PF.
      @1153   CCIR36                   N3PF.
      @1156   CCIR37                   N3PF.
      @1159   CCIR38                   N3PF.
      @1162   CCIR39                   N3PF.
      @1165   CCIR40                   N3PF.
      ;
RUN;