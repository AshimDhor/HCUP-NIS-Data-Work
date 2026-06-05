/*****************************************************************************
* Stataload_NIS_2023_DX_PR_GRPS.Do
* This program will load the NIS_2023_DX_PR_GRPS ASCII File into Stata.
* Because Stata loads the entire file into memory, it may not be possible
* to load every data element for large files.  If necessary, edit this
* program to change the memory size or to load only selected data elements.
* Created on 12/10/2025.
*****************************************************************************/

*** Read data elements from the ASCII file ***
infix long   HOSP_NIS                     1-   5   ///
      double KEY_NIS                      6-  15   ///
      byte   CMR_AIDS                    16-  17   ///
      byte   CMR_ALCOHOL                 18-  19   ///
      byte   CMR_AUTOIMMUNE              20-  21   ///
      byte   CMR_CANCER_LYMPH            22-  23   ///
      byte   CMR_CANCER_LEUK             24-  25   ///
      byte   CMR_CANCER_METS             26-  27   ///
      byte   CMR_CANCER_NSITU            28-  29   ///
      byte   CMR_CANCER_SOLID            30-  31   ///
      byte   CMR_DEMENTIA                32-  33   ///
      byte   CMR_DEPRESS                 34-  35   ///
      byte   CMR_DIAB_UNCX               36-  37   ///
      byte   CMR_DIAB_CX                 38-  39   ///
      byte   CMR_DRUG_ABUSE              40-  41   ///
      byte   CMR_HTN_CX                  42-  43   ///
      byte   CMR_HTN_UNCX                44-  45   ///
      byte   CMR_LUNG_CHRONIC            46-  47   ///
      byte   CMR_OBESE                   48-  49   ///
      byte   CMR_PERIVASC                50-  51   ///
      byte   CMR_THYROID_HYPO            52-  53   ///
      byte   CMR_THYROID_OTH             54-  55   ///
      str    CMR_VERSION                 56-  61   ///
      int    PCLASS1                     62-  64   ///
      int    PCLASS2                     65-  67   ///
      int    PCLASS3                     68-  70   ///
      int    PCLASS4                     71-  73   ///
      int    PCLASS5                     74-  76   ///
      int    PCLASS6                     77-  79   ///
      int    PCLASS7                     80-  82   ///
      int    PCLASS8                     83-  85   ///
      int    PCLASS9                     86-  88   ///
      int    PCLASS10                    89-  91   ///
      int    PCLASS11                    92-  94   ///
      int    PCLASS12                    95-  97   ///
      int    PCLASS13                    98- 100   ///
      int    PCLASS14                   101- 103   ///
      int    PCLASS15                   104- 106   ///
      int    PCLASS16                   107- 109   ///
      int    PCLASS17                   110- 112   ///
      int    PCLASS18                   113- 115   ///
      int    PCLASS19                   116- 118   ///
      int    PCLASS20                   119- 121   ///
      int    PCLASS21                   122- 124   ///
      int    PCLASS22                   125- 127   ///
      int    PCLASS23                   128- 130   ///
      int    PCLASS24                   131- 133   ///
      int    PCLASS25                   134- 136   ///
      str    PCLASS_VERSION             137- 142   ///
      str    DXCCSR_Default_DX1         143- 148   ///
      byte   DXCCSR_BLD001              149        ///
      byte   DXCCSR_BLD002              150        ///
      byte   DXCCSR_BLD003              151        ///
      byte   DXCCSR_BLD004              152        ///
      byte   DXCCSR_BLD005              153        ///
      byte   DXCCSR_BLD006              154        ///
      byte   DXCCSR_BLD007              155        ///
      byte   DXCCSR_BLD008              156        ///
      byte   DXCCSR_BLD009              157        ///
      byte   DXCCSR_BLD010              158        ///
      byte   DXCCSR_CIR001              159        ///
      byte   DXCCSR_CIR002              160        ///
      byte   DXCCSR_CIR003              161        ///
      byte   DXCCSR_CIR004              162        ///
      byte   DXCCSR_CIR005              163        ///
      byte   DXCCSR_CIR006              164        ///
      byte   DXCCSR_CIR007              165        ///
      byte   DXCCSR_CIR008              166        ///
      byte   DXCCSR_CIR009              167        ///
      byte   DXCCSR_CIR010              168        ///
      byte   DXCCSR_CIR011              169        ///
      byte   DXCCSR_CIR012              170        ///
      byte   DXCCSR_CIR013              171        ///
      byte   DXCCSR_CIR014              172        ///
      byte   DXCCSR_CIR015              173        ///
      byte   DXCCSR_CIR016              174        ///
      byte   DXCCSR_CIR017              175        ///
      byte   DXCCSR_CIR018              176        ///
      byte   DXCCSR_CIR019              177        ///
      byte   DXCCSR_CIR020              178        ///
      byte   DXCCSR_CIR021              179        ///
      byte   DXCCSR_CIR022              180        ///
      byte   DXCCSR_CIR023              181        ///
      byte   DXCCSR_CIR024              182        ///
      byte   DXCCSR_CIR025              183        ///
      byte   DXCCSR_CIR026              184        ///
      byte   DXCCSR_CIR027              185        ///
      byte   DXCCSR_CIR028              186        ///
      byte   DXCCSR_CIR029              187        ///
      byte   DXCCSR_CIR030              188        ///
      byte   DXCCSR_CIR031              189        ///
      byte   DXCCSR_CIR032              190        ///
      byte   DXCCSR_CIR033              191        ///
      byte   DXCCSR_CIR034              192        ///
      byte   DXCCSR_CIR035              193        ///
      byte   DXCCSR_CIR036              194        ///
      byte   DXCCSR_CIR037              195        ///
      byte   DXCCSR_CIR038              196        ///
      byte   DXCCSR_CIR039              197        ///
      byte   DXCCSR_DEN001              198        ///
      byte   DXCCSR_DEN002              199        ///
      byte   DXCCSR_DEN003              200        ///
      byte   DXCCSR_DIG001              201        ///
      byte   DXCCSR_DIG002              202        ///
      byte   DXCCSR_DIG003              203        ///
      byte   DXCCSR_DIG004              204        ///
      byte   DXCCSR_DIG005              205        ///
      byte   DXCCSR_DIG006              206        ///
      byte   DXCCSR_DIG007              207        ///
      byte   DXCCSR_DIG008              208        ///
      byte   DXCCSR_DIG009              209        ///
      byte   DXCCSR_DIG010              210        ///
      byte   DXCCSR_DIG011              211        ///
      byte   DXCCSR_DIG012              212        ///
      byte   DXCCSR_DIG013              213        ///
      byte   DXCCSR_DIG014              214        ///
      byte   DXCCSR_DIG015              215        ///
      byte   DXCCSR_DIG016              216        ///
      byte   DXCCSR_DIG017              217        ///
      byte   DXCCSR_DIG018              218        ///
      byte   DXCCSR_DIG019              219        ///
      byte   DXCCSR_DIG020              220        ///
      byte   DXCCSR_DIG021              221        ///
      byte   DXCCSR_DIG022              222        ///
      byte   DXCCSR_DIG023              223        ///
      byte   DXCCSR_DIG024              224        ///
      byte   DXCCSR_DIG025              225        ///
      byte   DXCCSR_EAR001              226        ///
      byte   DXCCSR_EAR002              227        ///
      byte   DXCCSR_EAR003              228        ///
      byte   DXCCSR_EAR004              229        ///
      byte   DXCCSR_EAR005              230        ///
      byte   DXCCSR_EAR006              231        ///
      byte   DXCCSR_END001              232        ///
      byte   DXCCSR_END002              233        ///
      byte   DXCCSR_END003              234        ///
      byte   DXCCSR_END004              235        ///
      byte   DXCCSR_END005              236        ///
      byte   DXCCSR_END006              237        ///
      byte   DXCCSR_END007              238        ///
      byte   DXCCSR_END008              239        ///
      byte   DXCCSR_END009              240        ///
      byte   DXCCSR_END010              241        ///
      byte   DXCCSR_END011              242        ///
      byte   DXCCSR_END012              243        ///
      byte   DXCCSR_END013              244        ///
      byte   DXCCSR_END014              245        ///
      byte   DXCCSR_END015              246        ///
      byte   DXCCSR_END016              247        ///
      byte   DXCCSR_END017              248        ///
      byte   DXCCSR_EXT001              249        ///
      byte   DXCCSR_EXT002              250        ///
      byte   DXCCSR_EXT003              251        ///
      byte   DXCCSR_EXT004              252        ///
      byte   DXCCSR_EXT005              253        ///
      byte   DXCCSR_EXT006              254        ///
      byte   DXCCSR_EXT007              255        ///
      byte   DXCCSR_EXT008              256        ///
      byte   DXCCSR_EXT009              257        ///
      byte   DXCCSR_EXT010              258        ///
      byte   DXCCSR_EXT011              259        ///
      byte   DXCCSR_EXT012              260        ///
      byte   DXCCSR_EXT013              261        ///
      byte   DXCCSR_EXT014              262        ///
      byte   DXCCSR_EXT015              263        ///
      byte   DXCCSR_EXT016              264        ///
      byte   DXCCSR_EXT017              265        ///
      byte   DXCCSR_EXT018              266        ///
      byte   DXCCSR_EXT019              267        ///
      byte   DXCCSR_EXT020              268        ///
      byte   DXCCSR_EXT021              269        ///
      byte   DXCCSR_EXT022              270        ///
      byte   DXCCSR_EXT023              271        ///
      byte   DXCCSR_EXT024              272        ///
      byte   DXCCSR_EXT025              273        ///
      byte   DXCCSR_EXT026              274        ///
      byte   DXCCSR_EXT027              275        ///
      byte   DXCCSR_EXT028              276        ///
      byte   DXCCSR_EXT029              277        ///
      byte   DXCCSR_EXT030              278        ///
      byte   DXCCSR_EYE001              279        ///
      byte   DXCCSR_EYE002              280        ///
      byte   DXCCSR_EYE003              281        ///
      byte   DXCCSR_EYE004              282        ///
      byte   DXCCSR_EYE005              283        ///
      byte   DXCCSR_EYE006              284        ///
      byte   DXCCSR_EYE007              285        ///
      byte   DXCCSR_EYE008              286        ///
      byte   DXCCSR_EYE009              287        ///
      byte   DXCCSR_EYE010              288        ///
      byte   DXCCSR_EYE011              289        ///
      byte   DXCCSR_EYE012              290        ///
      byte   DXCCSR_FAC001              291        ///
      byte   DXCCSR_FAC002              292        ///
      byte   DXCCSR_FAC003              293        ///
      byte   DXCCSR_FAC004              294        ///
      byte   DXCCSR_FAC005              295        ///
      byte   DXCCSR_FAC006              296        ///
      byte   DXCCSR_FAC007              297        ///
      byte   DXCCSR_FAC008              298        ///
      byte   DXCCSR_FAC009              299        ///
      byte   DXCCSR_FAC010              300        ///
      byte   DXCCSR_FAC011              301        ///
      byte   DXCCSR_FAC012              302        ///
      byte   DXCCSR_FAC013              303        ///
      byte   DXCCSR_FAC014              304        ///
      byte   DXCCSR_FAC015              305        ///
      byte   DXCCSR_FAC016              306        ///
      byte   DXCCSR_FAC017              307        ///
      byte   DXCCSR_FAC018              308        ///
      byte   DXCCSR_FAC019              309        ///
      byte   DXCCSR_FAC020              310        ///
      byte   DXCCSR_FAC021              311        ///
      byte   DXCCSR_FAC022              312        ///
      byte   DXCCSR_FAC023              313        ///
      byte   DXCCSR_FAC024              314        ///
      byte   DXCCSR_FAC025              315        ///
      byte   DXCCSR_FAC026              316        ///
      byte   DXCCSR_FAC027              317        ///
      byte   DXCCSR_FAC028              318        ///
      byte   DXCCSR_FAC029              319        ///
      byte   DXCCSR_FAC030              320        ///
      byte   DXCCSR_GEN001              321        ///
      byte   DXCCSR_GEN002              322        ///
      byte   DXCCSR_GEN003              323        ///
      byte   DXCCSR_GEN004              324        ///
      byte   DXCCSR_GEN005              325        ///
      byte   DXCCSR_GEN006              326        ///
      byte   DXCCSR_GEN007              327        ///
      byte   DXCCSR_GEN008              328        ///
      byte   DXCCSR_GEN009              329        ///
      byte   DXCCSR_GEN010              330        ///
      byte   DXCCSR_GEN011              331        ///
      byte   DXCCSR_GEN012              332        ///
      byte   DXCCSR_GEN013              333        ///
      byte   DXCCSR_GEN014              334        ///
      byte   DXCCSR_GEN015              335        ///
      byte   DXCCSR_GEN016              336        ///
      byte   DXCCSR_GEN017              337        ///
      byte   DXCCSR_GEN018              338        ///
      byte   DXCCSR_GEN019              339        ///
      byte   DXCCSR_GEN020              340        ///
      byte   DXCCSR_GEN021              341        ///
      byte   DXCCSR_GEN022              342        ///
      byte   DXCCSR_GEN023              343        ///
      byte   DXCCSR_GEN024              344        ///
      byte   DXCCSR_GEN025              345        ///
      byte   DXCCSR_GEN026              346        ///
      byte   DXCCSR_INF001              347        ///
      byte   DXCCSR_INF002              348        ///
      byte   DXCCSR_INF003              349        ///
      byte   DXCCSR_INF004              350        ///
      byte   DXCCSR_INF005              351        ///
      byte   DXCCSR_INF006              352        ///
      byte   DXCCSR_INF007              353        ///
      byte   DXCCSR_INF008              354        ///
      byte   DXCCSR_INF009              355        ///
      byte   DXCCSR_INF010              356        ///
      byte   DXCCSR_INF011              357        ///
      byte   DXCCSR_INF012              358        ///
      byte   DXCCSR_INJ001              359        ///
      byte   DXCCSR_INJ002              360        ///
      byte   DXCCSR_INJ003              361        ///
      byte   DXCCSR_INJ004              362        ///
      byte   DXCCSR_INJ005              363        ///
      byte   DXCCSR_INJ006              364        ///
      byte   DXCCSR_INJ007              365        ///
      byte   DXCCSR_INJ008              366        ///
      byte   DXCCSR_INJ009              367        ///
      byte   DXCCSR_INJ010              368        ///
      byte   DXCCSR_INJ011              369        ///
      byte   DXCCSR_INJ012              370        ///
      byte   DXCCSR_INJ013              371        ///
      byte   DXCCSR_INJ014              372        ///
      byte   DXCCSR_INJ015              373        ///
      byte   DXCCSR_INJ016              374        ///
      byte   DXCCSR_INJ017              375        ///
      byte   DXCCSR_INJ018              376        ///
      byte   DXCCSR_INJ019              377        ///
      byte   DXCCSR_INJ020              378        ///
      byte   DXCCSR_INJ021              379        ///
      byte   DXCCSR_INJ022              380        ///
      byte   DXCCSR_INJ023              381        ///
      byte   DXCCSR_INJ024              382        ///
      byte   DXCCSR_INJ025              383        ///
      byte   DXCCSR_INJ026              384        ///
      byte   DXCCSR_INJ027              385        ///
      byte   DXCCSR_INJ028              386        ///
      byte   DXCCSR_INJ029              387        ///
      byte   DXCCSR_INJ030              388        ///
      byte   DXCCSR_INJ031              389        ///
      byte   DXCCSR_INJ032              390        ///
      byte   DXCCSR_INJ033              391        ///
      byte   DXCCSR_INJ034              392        ///
      byte   DXCCSR_INJ035              393        ///
      byte   DXCCSR_INJ036              394        ///
      byte   DXCCSR_INJ037              395        ///
      byte   DXCCSR_INJ038              396        ///
      byte   DXCCSR_INJ039              397        ///
      byte   DXCCSR_INJ040              398        ///
      byte   DXCCSR_INJ041              399        ///
      byte   DXCCSR_INJ042              400        ///
      byte   DXCCSR_INJ043              401        ///
      byte   DXCCSR_INJ044              402        ///
      byte   DXCCSR_INJ045              403        ///
      byte   DXCCSR_INJ046              404        ///
      byte   DXCCSR_INJ047              405        ///
      byte   DXCCSR_INJ048              406        ///
      byte   DXCCSR_INJ049              407        ///
      byte   DXCCSR_INJ050              408        ///
      byte   DXCCSR_INJ051              409        ///
      byte   DXCCSR_INJ052              410        ///
      byte   DXCCSR_INJ053              411        ///
      byte   DXCCSR_INJ054              412        ///
      byte   DXCCSR_INJ055              413        ///
      byte   DXCCSR_INJ056              414        ///
      byte   DXCCSR_INJ057              415        ///
      byte   DXCCSR_INJ058              416        ///
      byte   DXCCSR_INJ059              417        ///
      byte   DXCCSR_INJ060              418        ///
      byte   DXCCSR_INJ061              419        ///
      byte   DXCCSR_INJ062              420        ///
      byte   DXCCSR_INJ063              421        ///
      byte   DXCCSR_INJ064              422        ///
      byte   DXCCSR_INJ065              423        ///
      byte   DXCCSR_INJ066              424        ///
      byte   DXCCSR_INJ067              425        ///
      byte   DXCCSR_INJ068              426        ///
      byte   DXCCSR_INJ069              427        ///
      byte   DXCCSR_INJ070              428        ///
      byte   DXCCSR_INJ071              429        ///
      byte   DXCCSR_INJ072              430        ///
      byte   DXCCSR_INJ073              431        ///
      byte   DXCCSR_INJ074              432        ///
      byte   DXCCSR_INJ075              433        ///
      byte   DXCCSR_INJ076              434        ///
      byte   DXCCSR_MAL001              435        ///
      byte   DXCCSR_MAL002              436        ///
      byte   DXCCSR_MAL003              437        ///
      byte   DXCCSR_MAL004              438        ///
      byte   DXCCSR_MAL005              439        ///
      byte   DXCCSR_MAL006              440        ///
      byte   DXCCSR_MAL007              441        ///
      byte   DXCCSR_MAL008              442        ///
      byte   DXCCSR_MAL009              443        ///
      byte   DXCCSR_MAL010              444        ///
      byte   DXCCSR_MBD001              445        ///
      byte   DXCCSR_MBD002              446        ///
      byte   DXCCSR_MBD003              447        ///
      byte   DXCCSR_MBD004              448        ///
      byte   DXCCSR_MBD005              449        ///
      byte   DXCCSR_MBD006              450        ///
      byte   DXCCSR_MBD007              451        ///
      byte   DXCCSR_MBD008              452        ///
      byte   DXCCSR_MBD009              453        ///
      byte   DXCCSR_MBD010              454        ///
      byte   DXCCSR_MBD011              455        ///
      byte   DXCCSR_MBD012              456        ///
      byte   DXCCSR_MBD013              457        ///
      byte   DXCCSR_MBD014              458        ///
      byte   DXCCSR_MBD017              459        ///
      byte   DXCCSR_MBD018              460        ///
      byte   DXCCSR_MBD019              461        ///
      byte   DXCCSR_MBD020              462        ///
      byte   DXCCSR_MBD021              463        ///
      byte   DXCCSR_MBD022              464        ///
      byte   DXCCSR_MBD023              465        ///
      byte   DXCCSR_MBD024              466        ///
      byte   DXCCSR_MBD025              467        ///
      byte   DXCCSR_MBD026              468        ///
      byte   DXCCSR_MBD027              469        ///
      byte   DXCCSR_MBD028              470        ///
      byte   DXCCSR_MBD029              471        ///
      byte   DXCCSR_MBD030              472        ///
      byte   DXCCSR_MBD031              473        ///
      byte   DXCCSR_MBD032              474        ///
      byte   DXCCSR_MBD033              475        ///
      byte   DXCCSR_MBD034              476        ///
      byte   DXCCSR_MUS001              477        ///
      byte   DXCCSR_MUS002              478        ///
      byte   DXCCSR_MUS003              479        ///
      byte   DXCCSR_MUS004              480        ///
      byte   DXCCSR_MUS005              481        ///
      byte   DXCCSR_MUS006              482        ///
      byte   DXCCSR_MUS007              483        ///
      byte   DXCCSR_MUS008              484        ///
      byte   DXCCSR_MUS009              485        ///
      byte   DXCCSR_MUS010              486        ///
      byte   DXCCSR_MUS011              487        ///
      byte   DXCCSR_MUS012              488        ///
      byte   DXCCSR_MUS013              489        ///
      byte   DXCCSR_MUS014              490        ///
      byte   DXCCSR_MUS015              491        ///
      byte   DXCCSR_MUS016              492        ///
      byte   DXCCSR_MUS017              493        ///
      byte   DXCCSR_MUS018              494        ///
      byte   DXCCSR_MUS019              495        ///
      byte   DXCCSR_MUS020              496        ///
      byte   DXCCSR_MUS021              497        ///
      byte   DXCCSR_MUS022              498        ///
      byte   DXCCSR_MUS023              499        ///
      byte   DXCCSR_MUS024              500        ///
      byte   DXCCSR_MUS025              501        ///
      byte   DXCCSR_MUS026              502        ///
      byte   DXCCSR_MUS027              503        ///
      byte   DXCCSR_MUS028              504        ///
      byte   DXCCSR_MUS029              505        ///
      byte   DXCCSR_MUS030              506        ///
      byte   DXCCSR_MUS031              507        ///
      byte   DXCCSR_MUS032              508        ///
      byte   DXCCSR_MUS033              509        ///
      byte   DXCCSR_MUS034              510        ///
      byte   DXCCSR_MUS035              511        ///
      byte   DXCCSR_MUS036              512        ///
      byte   DXCCSR_MUS037              513        ///
      byte   DXCCSR_MUS038              514        ///
      byte   DXCCSR_NEO001              515        ///
      byte   DXCCSR_NEO002              516        ///
      byte   DXCCSR_NEO003              517        ///
      byte   DXCCSR_NEO004              518        ///
      byte   DXCCSR_NEO005              519        ///
      byte   DXCCSR_NEO006              520        ///
      byte   DXCCSR_NEO007              521        ///
      byte   DXCCSR_NEO008              522        ///
      byte   DXCCSR_NEO009              523        ///
      byte   DXCCSR_NEO010              524        ///
      byte   DXCCSR_NEO011              525        ///
      byte   DXCCSR_NEO012              526        ///
      byte   DXCCSR_NEO013              527        ///
      byte   DXCCSR_NEO014              528        ///
      byte   DXCCSR_NEO015              529        ///
      byte   DXCCSR_NEO016              530        ///
      byte   DXCCSR_NEO017              531        ///
      byte   DXCCSR_NEO018              532        ///
      byte   DXCCSR_NEO019              533        ///
      byte   DXCCSR_NEO020              534        ///
      byte   DXCCSR_NEO021              535        ///
      byte   DXCCSR_NEO022              536        ///
      byte   DXCCSR_NEO023              537        ///
      byte   DXCCSR_NEO024              538        ///
      byte   DXCCSR_NEO025              539        ///
      byte   DXCCSR_NEO026              540        ///
      byte   DXCCSR_NEO027              541        ///
      byte   DXCCSR_NEO028              542        ///
      byte   DXCCSR_NEO029              543        ///
      byte   DXCCSR_NEO030              544        ///
      byte   DXCCSR_NEO031              545        ///
      byte   DXCCSR_NEO032              546        ///
      byte   DXCCSR_NEO033              547        ///
      byte   DXCCSR_NEO034              548        ///
      byte   DXCCSR_NEO035              549        ///
      byte   DXCCSR_NEO036              550        ///
      byte   DXCCSR_NEO037              551        ///
      byte   DXCCSR_NEO038              552        ///
      byte   DXCCSR_NEO039              553        ///
      byte   DXCCSR_NEO040              554        ///
      byte   DXCCSR_NEO041              555        ///
      byte   DXCCSR_NEO042              556        ///
      byte   DXCCSR_NEO043              557        ///
      byte   DXCCSR_NEO044              558        ///
      byte   DXCCSR_NEO045              559        ///
      byte   DXCCSR_NEO046              560        ///
      byte   DXCCSR_NEO047              561        ///
      byte   DXCCSR_NEO048              562        ///
      byte   DXCCSR_NEO049              563        ///
      byte   DXCCSR_NEO050              564        ///
      byte   DXCCSR_NEO051              565        ///
      byte   DXCCSR_NEO052              566        ///
      byte   DXCCSR_NEO053              567        ///
      byte   DXCCSR_NEO054              568        ///
      byte   DXCCSR_NEO055              569        ///
      byte   DXCCSR_NEO056              570        ///
      byte   DXCCSR_NEO057              571        ///
      byte   DXCCSR_NEO058              572        ///
      byte   DXCCSR_NEO059              573        ///
      byte   DXCCSR_NEO060              574        ///
      byte   DXCCSR_NEO061              575        ///
      byte   DXCCSR_NEO062              576        ///
      byte   DXCCSR_NEO063              577        ///
      byte   DXCCSR_NEO064              578        ///
      byte   DXCCSR_NEO065              579        ///
      byte   DXCCSR_NEO066              580        ///
      byte   DXCCSR_NEO067              581        ///
      byte   DXCCSR_NEO068              582        ///
      byte   DXCCSR_NEO069              583        ///
      byte   DXCCSR_NEO070              584        ///
      byte   DXCCSR_NEO071              585        ///
      byte   DXCCSR_NEO072              586        ///
      byte   DXCCSR_NEO073              587        ///
      byte   DXCCSR_NEO074              588        ///
      byte   DXCCSR_NEO075              589        ///
      byte   DXCCSR_NEO076              590        ///
      byte   DXCCSR_NEO077              591        ///
      byte   DXCCSR_NEO078              592        ///
      byte   DXCCSR_NVS001              593        ///
      byte   DXCCSR_NVS002              594        ///
      byte   DXCCSR_NVS003              595        ///
      byte   DXCCSR_NVS004              596        ///
      byte   DXCCSR_NVS005              597        ///
      byte   DXCCSR_NVS006              598        ///
      byte   DXCCSR_NVS007              599        ///
      byte   DXCCSR_NVS008              600        ///
      byte   DXCCSR_NVS009              601        ///
      byte   DXCCSR_NVS010              602        ///
      byte   DXCCSR_NVS011              603        ///
      byte   DXCCSR_NVS012              604        ///
      byte   DXCCSR_NVS013              605        ///
      byte   DXCCSR_NVS014              606        ///
      byte   DXCCSR_NVS015              607        ///
      byte   DXCCSR_NVS016              608        ///
      byte   DXCCSR_NVS017              609        ///
      byte   DXCCSR_NVS018              610        ///
      byte   DXCCSR_NVS019              611        ///
      byte   DXCCSR_NVS020              612        ///
      byte   DXCCSR_NVS021              613        ///
      byte   DXCCSR_NVS022              614        ///
      byte   DXCCSR_PNL001              615        ///
      byte   DXCCSR_PNL002              616        ///
      byte   DXCCSR_PNL003              617        ///
      byte   DXCCSR_PNL004              618        ///
      byte   DXCCSR_PNL005              619        ///
      byte   DXCCSR_PNL006              620        ///
      byte   DXCCSR_PNL007              621        ///
      byte   DXCCSR_PNL008              622        ///
      byte   DXCCSR_PNL009              623        ///
      byte   DXCCSR_PNL010              624        ///
      byte   DXCCSR_PNL011              625        ///
      byte   DXCCSR_PNL012              626        ///
      byte   DXCCSR_PNL013              627        ///
      byte   DXCCSR_PNL014              628        ///
      byte   DXCCSR_PNL015              629        ///
      byte   DXCCSR_PRG001              630        ///
      byte   DXCCSR_PRG002              631        ///
      byte   DXCCSR_PRG003              632        ///
      byte   DXCCSR_PRG004              633        ///
      byte   DXCCSR_PRG005              634        ///
      byte   DXCCSR_PRG006              635        ///
      byte   DXCCSR_PRG007              636        ///
      byte   DXCCSR_PRG008              637        ///
      byte   DXCCSR_PRG009              638        ///
      byte   DXCCSR_PRG010              639        ///
      byte   DXCCSR_PRG011              640        ///
      byte   DXCCSR_PRG012              641        ///
      byte   DXCCSR_PRG013              642        ///
      byte   DXCCSR_PRG014              643        ///
      byte   DXCCSR_PRG015              644        ///
      byte   DXCCSR_PRG016              645        ///
      byte   DXCCSR_PRG017              646        ///
      byte   DXCCSR_PRG018              647        ///
      byte   DXCCSR_PRG019              648        ///
      byte   DXCCSR_PRG020              649        ///
      byte   DXCCSR_PRG021              650        ///
      byte   DXCCSR_PRG022              651        ///
      byte   DXCCSR_PRG023              652        ///
      byte   DXCCSR_PRG024              653        ///
      byte   DXCCSR_PRG025              654        ///
      byte   DXCCSR_PRG026              655        ///
      byte   DXCCSR_PRG027              656        ///
      byte   DXCCSR_PRG028              657        ///
      byte   DXCCSR_PRG029              658        ///
      byte   DXCCSR_PRG030              659        ///
      byte   DXCCSR_RSP001              660        ///
      byte   DXCCSR_RSP002              661        ///
      byte   DXCCSR_RSP003              662        ///
      byte   DXCCSR_RSP004              663        ///
      byte   DXCCSR_RSP005              664        ///
      byte   DXCCSR_RSP006              665        ///
      byte   DXCCSR_RSP007              666        ///
      byte   DXCCSR_RSP008              667        ///
      byte   DXCCSR_RSP009              668        ///
      byte   DXCCSR_RSP010              669        ///
      byte   DXCCSR_RSP011              670        ///
      byte   DXCCSR_RSP012              671        ///
      byte   DXCCSR_RSP013              672        ///
      byte   DXCCSR_RSP014              673        ///
      byte   DXCCSR_RSP015              674        ///
      byte   DXCCSR_RSP016              675        ///
      byte   DXCCSR_RSP017              676        ///
      byte   DXCCSR_SKN001              677        ///
      byte   DXCCSR_SKN002              678        ///
      byte   DXCCSR_SKN003              679        ///
      byte   DXCCSR_SKN004              680        ///
      byte   DXCCSR_SKN005              681        ///
      byte   DXCCSR_SKN006              682        ///
      byte   DXCCSR_SKN007              683        ///
      byte   DXCCSR_SYM001              684        ///
      byte   DXCCSR_SYM002              685        ///
      byte   DXCCSR_SYM003              686        ///
      byte   DXCCSR_SYM004              687        ///
      byte   DXCCSR_SYM005              688        ///
      byte   DXCCSR_SYM006              689        ///
      byte   DXCCSR_SYM007              690        ///
      byte   DXCCSR_SYM008              691        ///
      byte   DXCCSR_SYM009              692        ///
      byte   DXCCSR_SYM010              693        ///
      byte   DXCCSR_SYM011              694        ///
      byte   DXCCSR_SYM012              695        ///
      byte   DXCCSR_SYM013              696        ///
      byte   DXCCSR_SYM014              697        ///
      byte   DXCCSR_SYM015              698        ///
      byte   DXCCSR_SYM016              699        ///
      byte   DXCCSR_SYM017              700        ///
      byte   DXCCSR_SYM018              701        ///
      str    DXCCSR_VERSION             702- 707   ///
      byte   PRCCSR_ADM001              708        ///
      byte   PRCCSR_ADM002              709        ///
      byte   PRCCSR_ADM003              710        ///
      byte   PRCCSR_ADM004              711        ///
      byte   PRCCSR_ADM005              712        ///
      byte   PRCCSR_ADM006              713        ///
      byte   PRCCSR_ADM007              714        ///
      byte   PRCCSR_ADM008              715        ///
      byte   PRCCSR_ADM009              716        ///
      byte   PRCCSR_ADM010              717        ///
      byte   PRCCSR_ADM011              718        ///
      byte   PRCCSR_ADM012              719        ///
      byte   PRCCSR_ADM013              720        ///
      byte   PRCCSR_ADM014              721        ///
      byte   PRCCSR_ADM015              722        ///
      byte   PRCCSR_ADM016              723        ///
      byte   PRCCSR_ADM017              724        ///
      byte   PRCCSR_ADM018              725        ///
      byte   PRCCSR_ADM019              726        ///
      byte   PRCCSR_ADM020              727        ///
      byte   PRCCSR_ADM021              728        ///
      byte   PRCCSR_ADM022              729        ///
      byte   PRCCSR_CAR001              730        ///
      byte   PRCCSR_CAR002              731        ///
      byte   PRCCSR_CAR003              732        ///
      byte   PRCCSR_CAR004              733        ///
      byte   PRCCSR_CAR005              734        ///
      byte   PRCCSR_CAR006              735        ///
      byte   PRCCSR_CAR007              736        ///
      byte   PRCCSR_CAR008              737        ///
      byte   PRCCSR_CAR009              738        ///
      byte   PRCCSR_CAR010              739        ///
      byte   PRCCSR_CAR011              740        ///
      byte   PRCCSR_CAR012              741        ///
      byte   PRCCSR_CAR013              742        ///
      byte   PRCCSR_CAR014              743        ///
      byte   PRCCSR_CAR015              744        ///
      byte   PRCCSR_CAR016              745        ///
      byte   PRCCSR_CAR017              746        ///
      byte   PRCCSR_CAR018              747        ///
      byte   PRCCSR_CAR019              748        ///
      byte   PRCCSR_CAR020              749        ///
      byte   PRCCSR_CAR021              750        ///
      byte   PRCCSR_CAR022              751        ///
      byte   PRCCSR_CAR023              752        ///
      byte   PRCCSR_CAR024              753        ///
      byte   PRCCSR_CAR025              754        ///
      byte   PRCCSR_CAR026              755        ///
      byte   PRCCSR_CAR027              756        ///
      byte   PRCCSR_CAR028              757        ///
      byte   PRCCSR_CAR029              758        ///
      byte   PRCCSR_CHP001              759        ///
      byte   PRCCSR_CNS001              760        ///
      byte   PRCCSR_CNS002              761        ///
      byte   PRCCSR_CNS003              762        ///
      byte   PRCCSR_CNS004              763        ///
      byte   PRCCSR_CNS005              764        ///
      byte   PRCCSR_CNS006              765        ///
      byte   PRCCSR_CNS007              766        ///
      byte   PRCCSR_CNS008              767        ///
      byte   PRCCSR_CNS009              768        ///
      byte   PRCCSR_CNS010              769        ///
      byte   PRCCSR_CNS011              770        ///
      byte   PRCCSR_CNS012              771        ///
      byte   PRCCSR_CNS013              772        ///
      byte   PRCCSR_CNS014              773        ///
      byte   PRCCSR_ENP001              774        ///
      byte   PRCCSR_ENP002              775        ///
      byte   PRCCSR_ENP003              776        ///
      byte   PRCCSR_ENP004              777        ///
      byte   PRCCSR_ENP005              778        ///
      byte   PRCCSR_ENP006              779        ///
      byte   PRCCSR_ENT001              780        ///
      byte   PRCCSR_ENT002              781        ///
      byte   PRCCSR_ENT003              782        ///
      byte   PRCCSR_ENT004              783        ///
      byte   PRCCSR_ENT005              784        ///
      byte   PRCCSR_ENT006              785        ///
      byte   PRCCSR_ENT007              786        ///
      byte   PRCCSR_ENT008              787        ///
      byte   PRCCSR_ENT009              788        ///
      byte   PRCCSR_ENT010              789        ///
      byte   PRCCSR_ENT011              790        ///
      byte   PRCCSR_ENT012              791        ///
      byte   PRCCSR_ENT013              792        ///
      byte   PRCCSR_ENT014              793        ///
      byte   PRCCSR_ENT015              794        ///
      byte   PRCCSR_ENT016              795        ///
      byte   PRCCSR_ENT017              796        ///
      byte   PRCCSR_ESA001              797        ///
      byte   PRCCSR_ESA002              798        ///
      byte   PRCCSR_ESA003              799        ///
      byte   PRCCSR_ESA004              800        ///
      byte   PRCCSR_ESA005              801        ///
      byte   PRCCSR_ESA006              802        ///
      byte   PRCCSR_ESA007              803        ///
      byte   PRCCSR_ESA008              804        ///
      byte   PRCCSR_ESA009              805        ///
      byte   PRCCSR_ESA010              806        ///
      byte   PRCCSR_ESA011              807        ///
      byte   PRCCSR_ESA012              808        ///
      byte   PRCCSR_EST001              809        ///
      byte   PRCCSR_EST002              810        ///
      byte   PRCCSR_EST003              811        ///
      byte   PRCCSR_EST004              812        ///
      byte   PRCCSR_EST005              813        ///
      byte   PRCCSR_EYP001              814        ///
      byte   PRCCSR_EYP002              815        ///
      byte   PRCCSR_FRS001              816        ///
      byte   PRCCSR_FRS002              817        ///
      byte   PRCCSR_FRS003              818        ///
      byte   PRCCSR_FRS004              819        ///
      byte   PRCCSR_FRS005              820        ///
      byte   PRCCSR_FRS006              821        ///
      byte   PRCCSR_FRS007              822        ///
      byte   PRCCSR_FRS008              823        ///
      byte   PRCCSR_FRS009              824        ///
      byte   PRCCSR_FRS010              825        ///
      byte   PRCCSR_FRS011              826        ///
      byte   PRCCSR_FRS012              827        ///
      byte   PRCCSR_FRS013              828        ///
      byte   PRCCSR_FRS014              829        ///
      byte   PRCCSR_FRS015              830        ///
      byte   PRCCSR_GIS001              831        ///
      byte   PRCCSR_GIS002              832        ///
      byte   PRCCSR_GIS003              833        ///
      byte   PRCCSR_GIS004              834        ///
      byte   PRCCSR_GIS005              835        ///
      byte   PRCCSR_GIS006              836        ///
      byte   PRCCSR_GIS007              837        ///
      byte   PRCCSR_GIS008              838        ///
      byte   PRCCSR_GIS009              839        ///
      byte   PRCCSR_GIS010              840        ///
      byte   PRCCSR_GIS011              841        ///
      byte   PRCCSR_GIS012              842        ///
      byte   PRCCSR_GIS013              843        ///
      byte   PRCCSR_GIS014              844        ///
      byte   PRCCSR_GIS015              845        ///
      byte   PRCCSR_GIS016              846        ///
      byte   PRCCSR_GIS017              847        ///
      byte   PRCCSR_GIS018              848        ///
      byte   PRCCSR_GIS019              849        ///
      byte   PRCCSR_GIS020              850        ///
      byte   PRCCSR_GIS021              851        ///
      byte   PRCCSR_GIS022              852        ///
      byte   PRCCSR_GIS023              853        ///
      byte   PRCCSR_GIS024              854        ///
      byte   PRCCSR_GIS025              855        ///
      byte   PRCCSR_GIS026              856        ///
      byte   PRCCSR_GIS027              857        ///
      byte   PRCCSR_GIS028              858        ///
      byte   PRCCSR_GIS029              859        ///
      byte   PRCCSR_GNR001              860        ///
      byte   PRCCSR_GNR002              861        ///
      byte   PRCCSR_GNR003              862        ///
      byte   PRCCSR_GNR004              863        ///
      byte   PRCCSR_GNR005              864        ///
      byte   PRCCSR_GNR006              865        ///
      byte   PRCCSR_GNR007              866        ///
      byte   PRCCSR_GNR008              867        ///
      byte   PRCCSR_GNR009              868        ///
      byte   PRCCSR_GNR010              869        ///
      byte   PRCCSR_HEP001              870        ///
      byte   PRCCSR_HEP002              871        ///
      byte   PRCCSR_HEP003              872        ///
      byte   PRCCSR_HEP004              873        ///
      byte   PRCCSR_HEP005              874        ///
      byte   PRCCSR_HEP006              875        ///
      byte   PRCCSR_HEP007              876        ///
      byte   PRCCSR_HEP008              877        ///
      byte   PRCCSR_HEP009              878        ///
      byte   PRCCSR_HEP010              879        ///
      byte   PRCCSR_HEP011              880        ///
      byte   PRCCSR_HEP012              881        ///
      byte   PRCCSR_HEP013              882        ///
      byte   PRCCSR_IMG001              883        ///
      byte   PRCCSR_IMG002              884        ///
      byte   PRCCSR_IMG003              885        ///
      byte   PRCCSR_IMG004              886        ///
      byte   PRCCSR_IMG005              887        ///
      byte   PRCCSR_IMG006              888        ///
      byte   PRCCSR_IMG007              889        ///
      byte   PRCCSR_IMG008              890        ///
      byte   PRCCSR_IMG009              891        ///
      byte   PRCCSR_IMG010              892        ///
      byte   PRCCSR_LYM001              893        ///
      byte   PRCCSR_LYM002              894        ///
      byte   PRCCSR_LYM003              895        ///
      byte   PRCCSR_LYM004              896        ///
      byte   PRCCSR_LYM005              897        ///
      byte   PRCCSR_LYM006              898        ///
      byte   PRCCSR_LYM007              899        ///
      byte   PRCCSR_LYM008              900        ///
      byte   PRCCSR_LYM009              901        ///
      byte   PRCCSR_LYM010              902        ///
      byte   PRCCSR_LYM011              903        ///
      byte   PRCCSR_MAM001              904        ///
      byte   PRCCSR_MAM002              905        ///
      byte   PRCCSR_MAM003              906        ///
      byte   PRCCSR_MAM004              907        ///
      byte   PRCCSR_MAM005              908        ///
      byte   PRCCSR_MAM006              909        ///
      byte   PRCCSR_MAM007              910        ///
      byte   PRCCSR_MAM008              911        ///
      byte   PRCCSR_MAM009              912        ///
      byte   PRCCSR_MAM010              913        ///
      byte   PRCCSR_MAM011              914        ///
      byte   PRCCSR_MAM012              915        ///
      byte   PRCCSR_MAM013              916        ///
      byte   PRCCSR_MAM014              917        ///
      byte   PRCCSR_MAM015              918        ///
      byte   PRCCSR_MHT001              919        ///
      byte   PRCCSR_MHT002              920        ///
      byte   PRCCSR_MHT003              921        ///
      byte   PRCCSR_MHT004              922        ///
      byte   PRCCSR_MHT005              923        ///
      byte   PRCCSR_MRS001              924        ///
      byte   PRCCSR_MRS002              925        ///
      byte   PRCCSR_MRS003              926        ///
      byte   PRCCSR_MRS004              927        ///
      byte   PRCCSR_MRS005              928        ///
      byte   PRCCSR_MRS006              929        ///
      byte   PRCCSR_MRS007              930        ///
      byte   PRCCSR_MST001              931        ///
      byte   PRCCSR_MST002              932        ///
      byte   PRCCSR_MST003              933        ///
      byte   PRCCSR_MST004              934        ///
      byte   PRCCSR_MST005              935        ///
      byte   PRCCSR_MST006              936        ///
      byte   PRCCSR_MST007              937        ///
      byte   PRCCSR_MST008              938        ///
      byte   PRCCSR_MST009              939        ///
      byte   PRCCSR_MST010              940        ///
      byte   PRCCSR_MST011              941        ///
      byte   PRCCSR_MST012              942        ///
      byte   PRCCSR_MST013              943        ///
      byte   PRCCSR_MST014              944        ///
      byte   PRCCSR_MST015              945        ///
      byte   PRCCSR_MST016              946        ///
      byte   PRCCSR_MST017              947        ///
      byte   PRCCSR_MST018              948        ///
      byte   PRCCSR_MST019              949        ///
      byte   PRCCSR_MST020              950        ///
      byte   PRCCSR_MST021              951        ///
      byte   PRCCSR_MST022              952        ///
      byte   PRCCSR_MST023              953        ///
      byte   PRCCSR_MST024              954        ///
      byte   PRCCSR_MST025              955        ///
      byte   PRCCSR_MST026              956        ///
      byte   PRCCSR_MST027              957        ///
      byte   PRCCSR_MST028              958        ///
      byte   PRCCSR_MST029              959        ///
      byte   PRCCSR_MST030              960        ///
      byte   PRCCSR_NCM001              961        ///
      byte   PRCCSR_NCM002              962        ///
      byte   PRCCSR_NCM003              963        ///
      byte   PRCCSR_NCM004              964        ///
      byte   PRCCSR_OST001              965        ///
      byte   PRCCSR_OTR001              966        ///
      byte   PRCCSR_OTR002              967        ///
      byte   PRCCSR_OTR003              968        ///
      byte   PRCCSR_OTR004              969        ///
      byte   PRCCSR_OTR005              970        ///
      byte   PRCCSR_PGN001              971        ///
      byte   PRCCSR_PGN002              972        ///
      byte   PRCCSR_PGN003              973        ///
      byte   PRCCSR_PGN004              974        ///
      byte   PRCCSR_PGN005              975        ///
      byte   PRCCSR_PGN006              976        ///
      byte   PRCCSR_PGN007              977        ///
      byte   PRCCSR_PGN008              978        ///
      byte   PRCCSR_PGN009              979        ///
      byte   PRCCSR_PLC001              980        ///
      byte   PRCCSR_PLC002              981        ///
      byte   PRCCSR_PNS001              982        ///
      byte   PRCCSR_PNS002              983        ///
      byte   PRCCSR_PNS003              984        ///
      byte   PRCCSR_PNS004              985        ///
      byte   PRCCSR_PNS005              986        ///
      byte   PRCCSR_PNS006              987        ///
      byte   PRCCSR_RAD001              988        ///
      byte   PRCCSR_RAD002              989        ///
      byte   PRCCSR_RAD003              990        ///
      byte   PRCCSR_RAD004              991        ///
      byte   PRCCSR_RES001              992        ///
      byte   PRCCSR_RES002              993        ///
      byte   PRCCSR_RES003              994        ///
      byte   PRCCSR_RES004              995        ///
      byte   PRCCSR_RES005              996        ///
      byte   PRCCSR_RES006              997        ///
      byte   PRCCSR_RES007              998        ///
      byte   PRCCSR_RES008              999        ///
      byte   PRCCSR_RES009             1000        ///
      byte   PRCCSR_RES010             1001        ///
      byte   PRCCSR_RES011             1002        ///
      byte   PRCCSR_RES012             1003        ///
      byte   PRCCSR_RES013             1004        ///
      byte   PRCCSR_RES014             1005        ///
      byte   PRCCSR_RHB001             1006        ///
      byte   PRCCSR_RHB002             1007        ///
      byte   PRCCSR_RHB003             1008        ///
      byte   PRCCSR_RHB004             1009        ///
      byte   PRCCSR_SKB001             1010        ///
      byte   PRCCSR_SKB002             1011        ///
      byte   PRCCSR_SKB003             1012        ///
      byte   PRCCSR_SKB004             1013        ///
      byte   PRCCSR_SKB005             1014        ///
      byte   PRCCSR_SKB006             1015        ///
      byte   PRCCSR_SKB007             1016        ///
      byte   PRCCSR_SKB008             1017        ///
      byte   PRCCSR_SKB009             1018        ///
      byte   PRCCSR_SKB010             1019        ///
      byte   PRCCSR_SUD001             1020        ///
      byte   PRCCSR_SUD002             1021        ///
      byte   PRCCSR_SUD003             1022        ///
      byte   PRCCSR_SUD004             1023        ///
      byte   PRCCSR_URN001             1024        ///
      byte   PRCCSR_URN002             1025        ///
      byte   PRCCSR_URN003             1026        ///
      byte   PRCCSR_URN004             1027        ///
      byte   PRCCSR_URN005             1028        ///
      byte   PRCCSR_URN006             1029        ///
      byte   PRCCSR_URN007             1030        ///
      byte   PRCCSR_URN008             1031        ///
      byte   PRCCSR_URN009             1032        ///
      byte   PRCCSR_URN010             1033        ///
      byte   PRCCSR_URN011             1034        ///
      byte   PRCCSR_URN012             1035        ///
      str    PRCCSR_VERSION            1036-1041   ///
      str    CCIR_VERSION              1042-1047   ///
      int    CCIR1                     1048-1050   ///
      int    CCIR2                     1051-1053   ///
      int    CCIR3                     1054-1056   ///
      int    CCIR4                     1057-1059   ///
      int    CCIR5                     1060-1062   ///
      int    CCIR6                     1063-1065   ///
      int    CCIR7                     1066-1068   ///
      int    CCIR8                     1069-1071   ///
      int    CCIR9                     1072-1074   ///
      int    CCIR10                    1075-1077   ///
      int    CCIR11                    1078-1080   ///
      int    CCIR12                    1081-1083   ///
      int    CCIR13                    1084-1086   ///
      int    CCIR14                    1087-1089   ///
      int    CCIR15                    1090-1092   ///
      int    CCIR16                    1093-1095   ///
      int    CCIR17                    1096-1098   ///
      int    CCIR18                    1099-1101   ///
      int    CCIR19                    1102-1104   ///
      int    CCIR20                    1105-1107   ///
      int    CCIR21                    1108-1110   ///
      int    CCIR22                    1111-1113   ///
      int    CCIR23                    1114-1116   ///
      int    CCIR24                    1117-1119   ///
      int    CCIR25                    1120-1122   ///
      int    CCIR26                    1123-1125   ///
      int    CCIR27                    1126-1128   ///
      int    CCIR28                    1129-1131   ///
      int    CCIR29                    1132-1134   ///
      int    CCIR30                    1135-1137   ///
      int    CCIR31                    1138-1140   ///
      int    CCIR32                    1141-1143   ///
      int    CCIR33                    1144-1146   ///
      int    CCIR34                    1147-1149   ///
      int    CCIR35                    1150-1152   ///
      int    CCIR36                    1153-1155   ///
      int    CCIR37                    1156-1158   ///
      int    CCIR38                    1159-1161   ///
      int    CCIR39                    1162-1164   ///
      int    CCIR40                    1165-1167   ///
      using  "NIS_2023_DX_PR_GRPS.ASC"

***  Assign labels to the data elements ***
label var HOSP_NIS                 "NIS hospital number"
label var KEY_NIS                  "NIS record number"
label var CMR_AIDS                 "Acquired immune deficiency syndrome"
label var CMR_ALCOHOL              "Alcohol abuse"
label var CMR_AUTOIMMUNE           "Autoimmune conditions"
label var CMR_CANCER_LYMPH         "Lymphoma"
label var CMR_CANCER_LEUK          "Leukemia"
label var CMR_CANCER_METS          "Metastatic cancer"
label var CMR_CANCER_NSITU         "Solid tumor without metastasis, in situ"
label var CMR_CANCER_SOLID         "Solid tumor without metastasis, malignant"
label var CMR_DEMENTIA             "Dementia"
label var CMR_DEPRESS              "Depression"
label var CMR_DIAB_UNCX            "Diabetes without chronic complications"
label var CMR_DIAB_CX              "Diabetes with chronic complications"
label var CMR_DRUG_ABUSE           "Drug abuse"
label var CMR_HTN_CX               "Hypertension, complicated"
label var CMR_HTN_UNCX             "Hypertension, uncomplicated"
label var CMR_LUNG_CHRONIC         "Chronic pulmonary disease"
label var CMR_OBESE                "Obesity"
label var CMR_PERIVASC             "Peripheral vascular disease"
label var CMR_THYROID_HYPO         "Hypothyroidism"
label var CMR_THYROID_OTH          "Other thyroid disorders"
label var CMR_VERSION              "Version of Elixhauser Comorbidity Software Refined"
label var PCLASS1                  "ICD-10-PCS Procedure class 1"
label var PCLASS2                  "ICD-10-PCS Procedure class 2"
label var PCLASS3                  "ICD-10-PCS Procedure class 3"
label var PCLASS4                  "ICD-10-PCS Procedure class 4"
label var PCLASS5                  "ICD-10-PCS Procedure class 5"
label var PCLASS6                  "ICD-10-PCS Procedure class 6"
label var PCLASS7                  "ICD-10-PCS Procedure class 7"
label var PCLASS8                  "ICD-10-PCS Procedure class 8"
label var PCLASS9                  "ICD-10-PCS Procedure class 9"
label var PCLASS10                 "ICD-10-PCS Procedure class 10"
label var PCLASS11                 "ICD-10-PCS Procedure class 11"
label var PCLASS12                 "ICD-10-PCS Procedure class 12"
label var PCLASS13                 "ICD-10-PCS Procedure class 13"
label var PCLASS14                 "ICD-10-PCS Procedure class 14"
label var PCLASS15                 "ICD-10-PCS Procedure class 15"
label var PCLASS16                 "ICD-10-PCS Procedure class 16"
label var PCLASS17                 "ICD-10-PCS Procedure class 17"
label var PCLASS18                 "ICD-10-PCS Procedure class 18"
label var PCLASS19                 "ICD-10-PCS Procedure class 19"
label var PCLASS20                 "ICD-10-PCS Procedure class 20"
label var PCLASS21                 "ICD-10-PCS Procedure class 21"
label var PCLASS22                 "ICD-10-PCS Procedure class 22"
label var PCLASS23                 "ICD-10-PCS Procedure class 23"
label var PCLASS24                 "ICD-10-PCS Procedure class 24"
label var PCLASS25                 "ICD-10-PCS Procedure class 25"
label var PCLASS_VERSION           "Version of ICD-10-PCS Procedure class"
label var DXCCSR_Default_DX1       "Default CCSR for principal/first-listed ICD-10-CM diagnosis"
label var DXCCSR_BLD001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD001"
label var DXCCSR_BLD002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD002"
label var DXCCSR_BLD003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD003"
label var DXCCSR_BLD004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD004"
label var DXCCSR_BLD005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD005"
label var DXCCSR_BLD006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD006"
label var DXCCSR_BLD007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD007"
label var DXCCSR_BLD008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD008"
label var DXCCSR_BLD009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD009"
label var DXCCSR_BLD010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR BLD010"
label var DXCCSR_CIR001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR001"
label var DXCCSR_CIR002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR002"
label var DXCCSR_CIR003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR003"
label var DXCCSR_CIR004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR004"
label var DXCCSR_CIR005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR005"
label var DXCCSR_CIR006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR006"
label var DXCCSR_CIR007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR007"
label var DXCCSR_CIR008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR008"
label var DXCCSR_CIR009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR009"
label var DXCCSR_CIR010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR010"
label var DXCCSR_CIR011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR011"
label var DXCCSR_CIR012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR012"
label var DXCCSR_CIR013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR013"
label var DXCCSR_CIR014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR014"
label var DXCCSR_CIR015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR015"
label var DXCCSR_CIR016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR016"
label var DXCCSR_CIR017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR017"
label var DXCCSR_CIR018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR018"
label var DXCCSR_CIR019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR019"
label var DXCCSR_CIR020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR020"
label var DXCCSR_CIR021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR021"
label var DXCCSR_CIR022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR022"
label var DXCCSR_CIR023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR023"
label var DXCCSR_CIR024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR024"
label var DXCCSR_CIR025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR025"
label var DXCCSR_CIR026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR026"
label var DXCCSR_CIR027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR027"
label var DXCCSR_CIR028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR028"
label var DXCCSR_CIR029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR029"
label var DXCCSR_CIR030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR030"
label var DXCCSR_CIR031            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR031"
label var DXCCSR_CIR032            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR032"
label var DXCCSR_CIR033            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR033"
label var DXCCSR_CIR034            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR034"
label var DXCCSR_CIR035            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR035"
label var DXCCSR_CIR036            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR036"
label var DXCCSR_CIR037            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR037"
label var DXCCSR_CIR038            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR038"
label var DXCCSR_CIR039            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR CIR039"
label var DXCCSR_DEN001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DEN001"
label var DXCCSR_DEN002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DEN002"
label var DXCCSR_DEN003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DEN003"
label var DXCCSR_DIG001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG001"
label var DXCCSR_DIG002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG002"
label var DXCCSR_DIG003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG003"
label var DXCCSR_DIG004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG004"
label var DXCCSR_DIG005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG005"
label var DXCCSR_DIG006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG006"
label var DXCCSR_DIG007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG007"
label var DXCCSR_DIG008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG008"
label var DXCCSR_DIG009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG009"
label var DXCCSR_DIG010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG010"
label var DXCCSR_DIG011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG011"
label var DXCCSR_DIG012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG012"
label var DXCCSR_DIG013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG013"
label var DXCCSR_DIG014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG014"
label var DXCCSR_DIG015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG015"
label var DXCCSR_DIG016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG016"
label var DXCCSR_DIG017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG017"
label var DXCCSR_DIG018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG018"
label var DXCCSR_DIG019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG019"
label var DXCCSR_DIG020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG020"
label var DXCCSR_DIG021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG021"
label var DXCCSR_DIG022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG022"
label var DXCCSR_DIG023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG023"
label var DXCCSR_DIG024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG024"
label var DXCCSR_DIG025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR DIG025"
label var DXCCSR_EAR001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR001"
label var DXCCSR_EAR002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR002"
label var DXCCSR_EAR003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR003"
label var DXCCSR_EAR004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR004"
label var DXCCSR_EAR005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR005"
label var DXCCSR_EAR006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EAR006"
label var DXCCSR_END001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END001"
label var DXCCSR_END002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END002"
label var DXCCSR_END003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END003"
label var DXCCSR_END004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END004"
label var DXCCSR_END005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END005"
label var DXCCSR_END006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END006"
label var DXCCSR_END007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END007"
label var DXCCSR_END008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END008"
label var DXCCSR_END009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END009"
label var DXCCSR_END010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END010"
label var DXCCSR_END011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END011"
label var DXCCSR_END012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END012"
label var DXCCSR_END013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END013"
label var DXCCSR_END014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END014"
label var DXCCSR_END015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END015"
label var DXCCSR_END016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END016"
label var DXCCSR_END017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR END017"
label var DXCCSR_EXT001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT001"
label var DXCCSR_EXT002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT002"
label var DXCCSR_EXT003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT003"
label var DXCCSR_EXT004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT004"
label var DXCCSR_EXT005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT005"
label var DXCCSR_EXT006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT006"
label var DXCCSR_EXT007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT007"
label var DXCCSR_EXT008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT008"
label var DXCCSR_EXT009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT009"
label var DXCCSR_EXT010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT010"
label var DXCCSR_EXT011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT011"
label var DXCCSR_EXT012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT012"
label var DXCCSR_EXT013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT013"
label var DXCCSR_EXT014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT014"
label var DXCCSR_EXT015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT015"
label var DXCCSR_EXT016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT016"
label var DXCCSR_EXT017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT017"
label var DXCCSR_EXT018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT018"
label var DXCCSR_EXT019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT019"
label var DXCCSR_EXT020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT020"
label var DXCCSR_EXT021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT021"
label var DXCCSR_EXT022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT022"
label var DXCCSR_EXT023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT023"
label var DXCCSR_EXT024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT024"
label var DXCCSR_EXT025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT025"
label var DXCCSR_EXT026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT026"
label var DXCCSR_EXT027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT027"
label var DXCCSR_EXT028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT028"
label var DXCCSR_EXT029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT029"
label var DXCCSR_EXT030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EXT030"
label var DXCCSR_EYE001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE001"
label var DXCCSR_EYE002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE002"
label var DXCCSR_EYE003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE003"
label var DXCCSR_EYE004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE004"
label var DXCCSR_EYE005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE005"
label var DXCCSR_EYE006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE006"
label var DXCCSR_EYE007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE007"
label var DXCCSR_EYE008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE008"
label var DXCCSR_EYE009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE009"
label var DXCCSR_EYE010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE010"
label var DXCCSR_EYE011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE011"
label var DXCCSR_EYE012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR EYE012"
label var DXCCSR_FAC001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC001"
label var DXCCSR_FAC002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC002"
label var DXCCSR_FAC003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC003"
label var DXCCSR_FAC004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC004"
label var DXCCSR_FAC005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC005"
label var DXCCSR_FAC006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC006"
label var DXCCSR_FAC007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC007"
label var DXCCSR_FAC008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC008"
label var DXCCSR_FAC009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC009"
label var DXCCSR_FAC010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC010"
label var DXCCSR_FAC011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC011"
label var DXCCSR_FAC012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC012"
label var DXCCSR_FAC013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC013"
label var DXCCSR_FAC014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC014"
label var DXCCSR_FAC015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC015"
label var DXCCSR_FAC016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC016"
label var DXCCSR_FAC017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC017"
label var DXCCSR_FAC018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC018"
label var DXCCSR_FAC019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC019"
label var DXCCSR_FAC020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC020"
label var DXCCSR_FAC021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC021"
label var DXCCSR_FAC022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC022"
label var DXCCSR_FAC023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC023"
label var DXCCSR_FAC024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC024"
label var DXCCSR_FAC025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC025"
label var DXCCSR_FAC026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC026"
label var DXCCSR_FAC027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC027"
label var DXCCSR_FAC028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC028"
label var DXCCSR_FAC029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC029"
label var DXCCSR_FAC030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR FAC030"
label var DXCCSR_GEN001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN001"
label var DXCCSR_GEN002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN002"
label var DXCCSR_GEN003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN003"
label var DXCCSR_GEN004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN004"
label var DXCCSR_GEN005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN005"
label var DXCCSR_GEN006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN006"
label var DXCCSR_GEN007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN007"
label var DXCCSR_GEN008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN008"
label var DXCCSR_GEN009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN009"
label var DXCCSR_GEN010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN010"
label var DXCCSR_GEN011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN011"
label var DXCCSR_GEN012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN012"
label var DXCCSR_GEN013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN013"
label var DXCCSR_GEN014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN014"
label var DXCCSR_GEN015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN015"
label var DXCCSR_GEN016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN016"
label var DXCCSR_GEN017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN017"
label var DXCCSR_GEN018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN018"
label var DXCCSR_GEN019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN019"
label var DXCCSR_GEN020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN020"
label var DXCCSR_GEN021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN021"
label var DXCCSR_GEN022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN022"
label var DXCCSR_GEN023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN023"
label var DXCCSR_GEN024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN024"
label var DXCCSR_GEN025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN025"
label var DXCCSR_GEN026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR GEN026"
label var DXCCSR_INF001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF001"
label var DXCCSR_INF002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF002"
label var DXCCSR_INF003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF003"
label var DXCCSR_INF004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF004"
label var DXCCSR_INF005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF005"
label var DXCCSR_INF006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF006"
label var DXCCSR_INF007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF007"
label var DXCCSR_INF008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF008"
label var DXCCSR_INF009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF009"
label var DXCCSR_INF010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF010"
label var DXCCSR_INF011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF011"
label var DXCCSR_INF012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INF012"
label var DXCCSR_INJ001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ001"
label var DXCCSR_INJ002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ002"
label var DXCCSR_INJ003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ003"
label var DXCCSR_INJ004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ004"
label var DXCCSR_INJ005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ005"
label var DXCCSR_INJ006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ006"
label var DXCCSR_INJ007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ007"
label var DXCCSR_INJ008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ008"
label var DXCCSR_INJ009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ009"
label var DXCCSR_INJ010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ010"
label var DXCCSR_INJ011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ011"
label var DXCCSR_INJ012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ012"
label var DXCCSR_INJ013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ013"
label var DXCCSR_INJ014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ014"
label var DXCCSR_INJ015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ015"
label var DXCCSR_INJ016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ016"
label var DXCCSR_INJ017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ017"
label var DXCCSR_INJ018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ018"
label var DXCCSR_INJ019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ019"
label var DXCCSR_INJ020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ020"
label var DXCCSR_INJ021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ021"
label var DXCCSR_INJ022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ022"
label var DXCCSR_INJ023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ023"
label var DXCCSR_INJ024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ024"
label var DXCCSR_INJ025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ025"
label var DXCCSR_INJ026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ026"
label var DXCCSR_INJ027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ027"
label var DXCCSR_INJ028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ028"
label var DXCCSR_INJ029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ029"
label var DXCCSR_INJ030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ030"
label var DXCCSR_INJ031            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ031"
label var DXCCSR_INJ032            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ032"
label var DXCCSR_INJ033            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ033"
label var DXCCSR_INJ034            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ034"
label var DXCCSR_INJ035            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ035"
label var DXCCSR_INJ036            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ036"
label var DXCCSR_INJ037            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ037"
label var DXCCSR_INJ038            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ038"
label var DXCCSR_INJ039            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ039"
label var DXCCSR_INJ040            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ040"
label var DXCCSR_INJ041            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ041"
label var DXCCSR_INJ042            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ042"
label var DXCCSR_INJ043            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ043"
label var DXCCSR_INJ044            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ044"
label var DXCCSR_INJ045            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ045"
label var DXCCSR_INJ046            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ046"
label var DXCCSR_INJ047            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ047"
label var DXCCSR_INJ048            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ048"
label var DXCCSR_INJ049            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ049"
label var DXCCSR_INJ050            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ050"
label var DXCCSR_INJ051            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ051"
label var DXCCSR_INJ052            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ052"
label var DXCCSR_INJ053            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ053"
label var DXCCSR_INJ054            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ054"
label var DXCCSR_INJ055            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ055"
label var DXCCSR_INJ056            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ056"
label var DXCCSR_INJ057            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ057"
label var DXCCSR_INJ058            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ058"
label var DXCCSR_INJ059            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ059"
label var DXCCSR_INJ060            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ060"
label var DXCCSR_INJ061            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ061"
label var DXCCSR_INJ062            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ062"
label var DXCCSR_INJ063            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ063"
label var DXCCSR_INJ064            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ064"
label var DXCCSR_INJ065            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ065"
label var DXCCSR_INJ066            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ066"
label var DXCCSR_INJ067            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ067"
label var DXCCSR_INJ068            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ068"
label var DXCCSR_INJ069            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ069"
label var DXCCSR_INJ070            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ070"
label var DXCCSR_INJ071            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ071"
label var DXCCSR_INJ072            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ072"
label var DXCCSR_INJ073            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ073"
label var DXCCSR_INJ074            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ074"
label var DXCCSR_INJ075            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ075"
label var DXCCSR_INJ076            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR INJ076"
label var DXCCSR_MAL001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL001"
label var DXCCSR_MAL002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL002"
label var DXCCSR_MAL003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL003"
label var DXCCSR_MAL004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL004"
label var DXCCSR_MAL005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL005"
label var DXCCSR_MAL006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL006"
label var DXCCSR_MAL007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL007"
label var DXCCSR_MAL008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL008"
label var DXCCSR_MAL009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL009"
label var DXCCSR_MAL010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MAL010"
label var DXCCSR_MBD001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD001"
label var DXCCSR_MBD002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD002"
label var DXCCSR_MBD003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD003"
label var DXCCSR_MBD004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD004"
label var DXCCSR_MBD005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD005"
label var DXCCSR_MBD006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD006"
label var DXCCSR_MBD007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD007"
label var DXCCSR_MBD008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD008"
label var DXCCSR_MBD009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD009"
label var DXCCSR_MBD010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD010"
label var DXCCSR_MBD011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD011"
label var DXCCSR_MBD012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD012"
label var DXCCSR_MBD013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD013"
label var DXCCSR_MBD014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD014"
label var DXCCSR_MBD017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD017"
label var DXCCSR_MBD018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD018"
label var DXCCSR_MBD019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD019"
label var DXCCSR_MBD020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD020"
label var DXCCSR_MBD021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD021"
label var DXCCSR_MBD022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD022"
label var DXCCSR_MBD023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD023"
label var DXCCSR_MBD024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD024"
label var DXCCSR_MBD025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD025"
label var DXCCSR_MBD026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD026"
label var DXCCSR_MBD027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD027"
label var DXCCSR_MBD028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD028"
label var DXCCSR_MBD029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD029"
label var DXCCSR_MBD030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD030"
label var DXCCSR_MBD031            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD031"
label var DXCCSR_MBD032            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD032"
label var DXCCSR_MBD033            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD033"
label var DXCCSR_MBD034            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MBD034"
label var DXCCSR_MUS001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS001"
label var DXCCSR_MUS002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS002"
label var DXCCSR_MUS003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS003"
label var DXCCSR_MUS004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS004"
label var DXCCSR_MUS005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS005"
label var DXCCSR_MUS006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS006"
label var DXCCSR_MUS007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS007"
label var DXCCSR_MUS008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS008"
label var DXCCSR_MUS009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS009"
label var DXCCSR_MUS010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS010"
label var DXCCSR_MUS011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS011"
label var DXCCSR_MUS012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS012"
label var DXCCSR_MUS013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS013"
label var DXCCSR_MUS014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS014"
label var DXCCSR_MUS015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS015"
label var DXCCSR_MUS016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS016"
label var DXCCSR_MUS017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS017"
label var DXCCSR_MUS018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS018"
label var DXCCSR_MUS019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS019"
label var DXCCSR_MUS020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS020"
label var DXCCSR_MUS021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS021"
label var DXCCSR_MUS022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS022"
label var DXCCSR_MUS023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS023"
label var DXCCSR_MUS024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS024"
label var DXCCSR_MUS025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS025"
label var DXCCSR_MUS026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS026"
label var DXCCSR_MUS027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS027"
label var DXCCSR_MUS028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS028"
label var DXCCSR_MUS029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS029"
label var DXCCSR_MUS030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS030"
label var DXCCSR_MUS031            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS031"
label var DXCCSR_MUS032            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS032"
label var DXCCSR_MUS033            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS033"
label var DXCCSR_MUS034            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS034"
label var DXCCSR_MUS035            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS035"
label var DXCCSR_MUS036            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS036"
label var DXCCSR_MUS037            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS037"
label var DXCCSR_MUS038            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR MUS038"
label var DXCCSR_NEO001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO001"
label var DXCCSR_NEO002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO002"
label var DXCCSR_NEO003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO003"
label var DXCCSR_NEO004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO004"
label var DXCCSR_NEO005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO005"
label var DXCCSR_NEO006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO006"
label var DXCCSR_NEO007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO007"
label var DXCCSR_NEO008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO008"
label var DXCCSR_NEO009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO009"
label var DXCCSR_NEO010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO010"
label var DXCCSR_NEO011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO011"
label var DXCCSR_NEO012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO012"
label var DXCCSR_NEO013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO013"
label var DXCCSR_NEO014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO014"
label var DXCCSR_NEO015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO015"
label var DXCCSR_NEO016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO016"
label var DXCCSR_NEO017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO017"
label var DXCCSR_NEO018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO018"
label var DXCCSR_NEO019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO019"
label var DXCCSR_NEO020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO020"
label var DXCCSR_NEO021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO021"
label var DXCCSR_NEO022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO022"
label var DXCCSR_NEO023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO023"
label var DXCCSR_NEO024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO024"
label var DXCCSR_NEO025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO025"
label var DXCCSR_NEO026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO026"
label var DXCCSR_NEO027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO027"
label var DXCCSR_NEO028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO028"
label var DXCCSR_NEO029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO029"
label var DXCCSR_NEO030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO030"
label var DXCCSR_NEO031            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO031"
label var DXCCSR_NEO032            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO032"
label var DXCCSR_NEO033            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO033"
label var DXCCSR_NEO034            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO034"
label var DXCCSR_NEO035            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO035"
label var DXCCSR_NEO036            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO036"
label var DXCCSR_NEO037            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO037"
label var DXCCSR_NEO038            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO038"
label var DXCCSR_NEO039            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO039"
label var DXCCSR_NEO040            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO040"
label var DXCCSR_NEO041            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO041"
label var DXCCSR_NEO042            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO042"
label var DXCCSR_NEO043            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO043"
label var DXCCSR_NEO044            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO044"
label var DXCCSR_NEO045            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO045"
label var DXCCSR_NEO046            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO046"
label var DXCCSR_NEO047            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO047"
label var DXCCSR_NEO048            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO048"
label var DXCCSR_NEO049            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO049"
label var DXCCSR_NEO050            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO050"
label var DXCCSR_NEO051            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO051"
label var DXCCSR_NEO052            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO052"
label var DXCCSR_NEO053            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO053"
label var DXCCSR_NEO054            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO054"
label var DXCCSR_NEO055            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO055"
label var DXCCSR_NEO056            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO056"
label var DXCCSR_NEO057            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO057"
label var DXCCSR_NEO058            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO058"
label var DXCCSR_NEO059            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO059"
label var DXCCSR_NEO060            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO060"
label var DXCCSR_NEO061            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO061"
label var DXCCSR_NEO062            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO062"
label var DXCCSR_NEO063            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO063"
label var DXCCSR_NEO064            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO064"
label var DXCCSR_NEO065            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO065"
label var DXCCSR_NEO066            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO066"
label var DXCCSR_NEO067            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO067"
label var DXCCSR_NEO068            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO068"
label var DXCCSR_NEO069            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO069"
label var DXCCSR_NEO070            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO070"
label var DXCCSR_NEO071            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO071"
label var DXCCSR_NEO072            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO072"
label var DXCCSR_NEO073            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO073"
label var DXCCSR_NEO074            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO074"
label var DXCCSR_NEO075            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO075"
label var DXCCSR_NEO076            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO076"
label var DXCCSR_NEO077            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO077"
label var DXCCSR_NEO078            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NEO078"
label var DXCCSR_NVS001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS001"
label var DXCCSR_NVS002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS002"
label var DXCCSR_NVS003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS003"
label var DXCCSR_NVS004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS004"
label var DXCCSR_NVS005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS005"
label var DXCCSR_NVS006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS006"
label var DXCCSR_NVS007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS007"
label var DXCCSR_NVS008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS008"
label var DXCCSR_NVS009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS009"
label var DXCCSR_NVS010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS010"
label var DXCCSR_NVS011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS011"
label var DXCCSR_NVS012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS012"
label var DXCCSR_NVS013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS013"
label var DXCCSR_NVS014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS014"
label var DXCCSR_NVS015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS015"
label var DXCCSR_NVS016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS016"
label var DXCCSR_NVS017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS017"
label var DXCCSR_NVS018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS018"
label var DXCCSR_NVS019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS019"
label var DXCCSR_NVS020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS020"
label var DXCCSR_NVS021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS021"
label var DXCCSR_NVS022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR NVS022"
label var DXCCSR_PNL001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL001"
label var DXCCSR_PNL002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL002"
label var DXCCSR_PNL003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL003"
label var DXCCSR_PNL004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL004"
label var DXCCSR_PNL005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL005"
label var DXCCSR_PNL006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL006"
label var DXCCSR_PNL007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL007"
label var DXCCSR_PNL008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL008"
label var DXCCSR_PNL009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL009"
label var DXCCSR_PNL010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL010"
label var DXCCSR_PNL011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL011"
label var DXCCSR_PNL012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL012"
label var DXCCSR_PNL013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL013"
label var DXCCSR_PNL014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL014"
label var DXCCSR_PNL015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PNL015"
label var DXCCSR_PRG001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG001"
label var DXCCSR_PRG002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG002"
label var DXCCSR_PRG003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG003"
label var DXCCSR_PRG004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG004"
label var DXCCSR_PRG005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG005"
label var DXCCSR_PRG006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG006"
label var DXCCSR_PRG007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG007"
label var DXCCSR_PRG008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG008"
label var DXCCSR_PRG009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG009"
label var DXCCSR_PRG010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG010"
label var DXCCSR_PRG011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG011"
label var DXCCSR_PRG012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG012"
label var DXCCSR_PRG013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG013"
label var DXCCSR_PRG014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG014"
label var DXCCSR_PRG015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG015"
label var DXCCSR_PRG016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG016"
label var DXCCSR_PRG017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG017"
label var DXCCSR_PRG018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG018"
label var DXCCSR_PRG019            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG019"
label var DXCCSR_PRG020            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG020"
label var DXCCSR_PRG021            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG021"
label var DXCCSR_PRG022            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG022"
label var DXCCSR_PRG023            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG023"
label var DXCCSR_PRG024            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG024"
label var DXCCSR_PRG025            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG025"
label var DXCCSR_PRG026            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG026"
label var DXCCSR_PRG027            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG027"
label var DXCCSR_PRG028            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG028"
label var DXCCSR_PRG029            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG029"
label var DXCCSR_PRG030            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR PRG030"
label var DXCCSR_RSP001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP001"
label var DXCCSR_RSP002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP002"
label var DXCCSR_RSP003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP003"
label var DXCCSR_RSP004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP004"
label var DXCCSR_RSP005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP005"
label var DXCCSR_RSP006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP006"
label var DXCCSR_RSP007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP007"
label var DXCCSR_RSP008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP008"
label var DXCCSR_RSP009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP009"
label var DXCCSR_RSP010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP010"
label var DXCCSR_RSP011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP011"
label var DXCCSR_RSP012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP012"
label var DXCCSR_RSP013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP013"
label var DXCCSR_RSP014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP014"
label var DXCCSR_RSP015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP015"
label var DXCCSR_RSP016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP016"
label var DXCCSR_RSP017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR RSP017"
label var DXCCSR_SKN001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN001"
label var DXCCSR_SKN002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN002"
label var DXCCSR_SKN003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN003"
label var DXCCSR_SKN004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN004"
label var DXCCSR_SKN005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN005"
label var DXCCSR_SKN006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN006"
label var DXCCSR_SKN007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SKN007"
label var DXCCSR_SYM001            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM001"
label var DXCCSR_SYM002            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM002"
label var DXCCSR_SYM003            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM003"
label var DXCCSR_SYM004            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM004"
label var DXCCSR_SYM005            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM005"
label var DXCCSR_SYM006            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM006"
label var DXCCSR_SYM007            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM007"
label var DXCCSR_SYM008            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM008"
label var DXCCSR_SYM009            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM009"
label var DXCCSR_SYM010            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM010"
label var DXCCSR_SYM011            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM011"
label var DXCCSR_SYM012            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM012"
label var DXCCSR_SYM013            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM013"
label var DXCCSR_SYM014            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM014"
label var DXCCSR_SYM015            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM015"
label var DXCCSR_SYM016            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM016"
label var DXCCSR_SYM017            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM017"
label var DXCCSR_SYM018            "Indication that at least one ICD-10-CM diagnosis on the record is included in CCSR SYM018"
label var DXCCSR_VERSION           "Version of CCSR for ICD-10-CM diagnoses"
label var PRCCSR_ADM001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM001"
label var PRCCSR_ADM002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM002"
label var PRCCSR_ADM003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM003"
label var PRCCSR_ADM004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM004"
label var PRCCSR_ADM005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM005"
label var PRCCSR_ADM006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM006"
label var PRCCSR_ADM007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM007"
label var PRCCSR_ADM008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM008"
label var PRCCSR_ADM009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM009"
label var PRCCSR_ADM010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM010"
label var PRCCSR_ADM011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM011"
label var PRCCSR_ADM012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM012"
label var PRCCSR_ADM013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM013"
label var PRCCSR_ADM014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM014"
label var PRCCSR_ADM015            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM015"
label var PRCCSR_ADM016            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM016"
label var PRCCSR_ADM017            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM017"
label var PRCCSR_ADM018            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM018"
label var PRCCSR_ADM019            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM019"
label var PRCCSR_ADM020            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM020"
label var PRCCSR_ADM021            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM021"
label var PRCCSR_ADM022            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ADM022"
label var PRCCSR_CAR001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR001"
label var PRCCSR_CAR002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR002"
label var PRCCSR_CAR003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR003"
label var PRCCSR_CAR004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR004"
label var PRCCSR_CAR005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR005"
label var PRCCSR_CAR006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR006"
label var PRCCSR_CAR007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR007"
label var PRCCSR_CAR008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR008"
label var PRCCSR_CAR009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR009"
label var PRCCSR_CAR010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR010"
label var PRCCSR_CAR011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR011"
label var PRCCSR_CAR012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR012"
label var PRCCSR_CAR013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR013"
label var PRCCSR_CAR014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR014"
label var PRCCSR_CAR015            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR015"
label var PRCCSR_CAR016            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR016"
label var PRCCSR_CAR017            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR017"
label var PRCCSR_CAR018            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR018"
label var PRCCSR_CAR019            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR019"
label var PRCCSR_CAR020            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR020"
label var PRCCSR_CAR021            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR021"
label var PRCCSR_CAR022            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR022"
label var PRCCSR_CAR023            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR023"
label var PRCCSR_CAR024            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR024"
label var PRCCSR_CAR025            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR025"
label var PRCCSR_CAR026            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR026"
label var PRCCSR_CAR027            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR027"
label var PRCCSR_CAR028            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR028"
label var PRCCSR_CAR029            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CAR029"
label var PRCCSR_CHP001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CHP001"
label var PRCCSR_CNS001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS001"
label var PRCCSR_CNS002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS002"
label var PRCCSR_CNS003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS003"
label var PRCCSR_CNS004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS004"
label var PRCCSR_CNS005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS005"
label var PRCCSR_CNS006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS006"
label var PRCCSR_CNS007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS007"
label var PRCCSR_CNS008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS008"
label var PRCCSR_CNS009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS009"
label var PRCCSR_CNS010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS010"
label var PRCCSR_CNS011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS011"
label var PRCCSR_CNS012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS012"
label var PRCCSR_CNS013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS013"
label var PRCCSR_CNS014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR CNS014"
label var PRCCSR_ENP001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP001"
label var PRCCSR_ENP002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP002"
label var PRCCSR_ENP003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP003"
label var PRCCSR_ENP004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP004"
label var PRCCSR_ENP005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP005"
label var PRCCSR_ENP006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENP006"
label var PRCCSR_ENT001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT001"
label var PRCCSR_ENT002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT002"
label var PRCCSR_ENT003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT003"
label var PRCCSR_ENT004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT004"
label var PRCCSR_ENT005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT005"
label var PRCCSR_ENT006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT006"
label var PRCCSR_ENT007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT007"
label var PRCCSR_ENT008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT008"
label var PRCCSR_ENT009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT009"
label var PRCCSR_ENT010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT010"
label var PRCCSR_ENT011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT011"
label var PRCCSR_ENT012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT012"
label var PRCCSR_ENT013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT013"
label var PRCCSR_ENT014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT014"
label var PRCCSR_ENT015            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT015"
label var PRCCSR_ENT016            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT016"
label var PRCCSR_ENT017            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ENT017"
label var PRCCSR_ESA001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA001"
label var PRCCSR_ESA002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA002"
label var PRCCSR_ESA003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA003"
label var PRCCSR_ESA004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA004"
label var PRCCSR_ESA005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA005"
label var PRCCSR_ESA006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA006"
label var PRCCSR_ESA007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA007"
label var PRCCSR_ESA008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA008"
label var PRCCSR_ESA009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA009"
label var PRCCSR_ESA010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA010"
label var PRCCSR_ESA011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA011"
label var PRCCSR_ESA012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR ESA012"
label var PRCCSR_EST001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST001"
label var PRCCSR_EST002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST002"
label var PRCCSR_EST003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST003"
label var PRCCSR_EST004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST004"
label var PRCCSR_EST005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EST005"
label var PRCCSR_EYP001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EYP001"
label var PRCCSR_EYP002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR EYP002"
label var PRCCSR_FRS001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS001"
label var PRCCSR_FRS002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS002"
label var PRCCSR_FRS003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS003"
label var PRCCSR_FRS004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS004"
label var PRCCSR_FRS005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS005"
label var PRCCSR_FRS006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS006"
label var PRCCSR_FRS007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS007"
label var PRCCSR_FRS008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS008"
label var PRCCSR_FRS009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS009"
label var PRCCSR_FRS010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS010"
label var PRCCSR_FRS011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS011"
label var PRCCSR_FRS012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS012"
label var PRCCSR_FRS013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS013"
label var PRCCSR_FRS014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS014"
label var PRCCSR_FRS015            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR FRS015"
label var PRCCSR_GIS001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS001"
label var PRCCSR_GIS002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS002"
label var PRCCSR_GIS003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS003"
label var PRCCSR_GIS004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS004"
label var PRCCSR_GIS005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS005"
label var PRCCSR_GIS006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS006"
label var PRCCSR_GIS007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS007"
label var PRCCSR_GIS008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS008"
label var PRCCSR_GIS009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS009"
label var PRCCSR_GIS010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS010"
label var PRCCSR_GIS011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS011"
label var PRCCSR_GIS012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS012"
label var PRCCSR_GIS013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS013"
label var PRCCSR_GIS014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS014"
label var PRCCSR_GIS015            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS015"
label var PRCCSR_GIS016            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS016"
label var PRCCSR_GIS017            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS017"
label var PRCCSR_GIS018            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS018"
label var PRCCSR_GIS019            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS019"
label var PRCCSR_GIS020            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS020"
label var PRCCSR_GIS021            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS021"
label var PRCCSR_GIS022            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS022"
label var PRCCSR_GIS023            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS023"
label var PRCCSR_GIS024            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS024"
label var PRCCSR_GIS025            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS025"
label var PRCCSR_GIS026            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS026"
label var PRCCSR_GIS027            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS027"
label var PRCCSR_GIS028            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS028"
label var PRCCSR_GIS029            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GIS029"
label var PRCCSR_GNR001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR001"
label var PRCCSR_GNR002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR002"
label var PRCCSR_GNR003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR003"
label var PRCCSR_GNR004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR004"
label var PRCCSR_GNR005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR005"
label var PRCCSR_GNR006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR006"
label var PRCCSR_GNR007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR007"
label var PRCCSR_GNR008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR008"
label var PRCCSR_GNR009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR009"
label var PRCCSR_GNR010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR GNR010"
label var PRCCSR_HEP001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP001"
label var PRCCSR_HEP002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP002"
label var PRCCSR_HEP003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP003"
label var PRCCSR_HEP004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP004"
label var PRCCSR_HEP005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP005"
label var PRCCSR_HEP006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP006"
label var PRCCSR_HEP007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP007"
label var PRCCSR_HEP008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP008"
label var PRCCSR_HEP009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP009"
label var PRCCSR_HEP010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP010"
label var PRCCSR_HEP011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP011"
label var PRCCSR_HEP012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP012"
label var PRCCSR_HEP013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR HEP013"
label var PRCCSR_IMG001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG001"
label var PRCCSR_IMG002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG002"
label var PRCCSR_IMG003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG003"
label var PRCCSR_IMG004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG004"
label var PRCCSR_IMG005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG005"
label var PRCCSR_IMG006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG006"
label var PRCCSR_IMG007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG007"
label var PRCCSR_IMG008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG008"
label var PRCCSR_IMG009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG009"
label var PRCCSR_IMG010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR IMG010"
label var PRCCSR_LYM001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM001"
label var PRCCSR_LYM002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM002"
label var PRCCSR_LYM003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM003"
label var PRCCSR_LYM004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM004"
label var PRCCSR_LYM005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM005"
label var PRCCSR_LYM006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM006"
label var PRCCSR_LYM007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM007"
label var PRCCSR_LYM008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM008"
label var PRCCSR_LYM009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM009"
label var PRCCSR_LYM010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM010"
label var PRCCSR_LYM011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR LYM011"
label var PRCCSR_MAM001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM001"
label var PRCCSR_MAM002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM002"
label var PRCCSR_MAM003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM003"
label var PRCCSR_MAM004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM004"
label var PRCCSR_MAM005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM005"
label var PRCCSR_MAM006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM006"
label var PRCCSR_MAM007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM007"
label var PRCCSR_MAM008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM008"
label var PRCCSR_MAM009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM009"
label var PRCCSR_MAM010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM010"
label var PRCCSR_MAM011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM011"
label var PRCCSR_MAM012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM012"
label var PRCCSR_MAM013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM013"
label var PRCCSR_MAM014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM014"
label var PRCCSR_MAM015            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MAM015"
label var PRCCSR_MHT001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT001"
label var PRCCSR_MHT002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT002"
label var PRCCSR_MHT003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT003"
label var PRCCSR_MHT004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT004"
label var PRCCSR_MHT005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MHT005"
label var PRCCSR_MRS001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS001"
label var PRCCSR_MRS002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS002"
label var PRCCSR_MRS003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS003"
label var PRCCSR_MRS004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS004"
label var PRCCSR_MRS005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS005"
label var PRCCSR_MRS006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS006"
label var PRCCSR_MRS007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MRS007"
label var PRCCSR_MST001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST001"
label var PRCCSR_MST002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST002"
label var PRCCSR_MST003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST003"
label var PRCCSR_MST004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST004"
label var PRCCSR_MST005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST005"
label var PRCCSR_MST006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST006"
label var PRCCSR_MST007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST007"
label var PRCCSR_MST008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST008"
label var PRCCSR_MST009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST009"
label var PRCCSR_MST010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST010"
label var PRCCSR_MST011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST011"
label var PRCCSR_MST012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST012"
label var PRCCSR_MST013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST013"
label var PRCCSR_MST014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST014"
label var PRCCSR_MST015            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST015"
label var PRCCSR_MST016            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST016"
label var PRCCSR_MST017            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST017"
label var PRCCSR_MST018            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST018"
label var PRCCSR_MST019            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST019"
label var PRCCSR_MST020            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST020"
label var PRCCSR_MST021            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST021"
label var PRCCSR_MST022            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST022"
label var PRCCSR_MST023            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST023"
label var PRCCSR_MST024            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST024"
label var PRCCSR_MST025            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST025"
label var PRCCSR_MST026            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST026"
label var PRCCSR_MST027            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST027"
label var PRCCSR_MST028            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST028"
label var PRCCSR_MST029            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST029"
label var PRCCSR_MST030            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR MST030"
label var PRCCSR_NCM001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM001"
label var PRCCSR_NCM002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM002"
label var PRCCSR_NCM003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM003"
label var PRCCSR_NCM004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR NCM004"
label var PRCCSR_OST001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OST001"
label var PRCCSR_OTR001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR001"
label var PRCCSR_OTR002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR002"
label var PRCCSR_OTR003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR003"
label var PRCCSR_OTR004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR004"
label var PRCCSR_OTR005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR OTR005"
label var PRCCSR_PGN001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN001"
label var PRCCSR_PGN002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN002"
label var PRCCSR_PGN003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN003"
label var PRCCSR_PGN004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN004"
label var PRCCSR_PGN005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN005"
label var PRCCSR_PGN006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN006"
label var PRCCSR_PGN007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN007"
label var PRCCSR_PGN008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN008"
label var PRCCSR_PGN009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PGN009"
label var PRCCSR_PLC001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PLC001"
label var PRCCSR_PLC002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PLC002"
label var PRCCSR_PNS001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS001"
label var PRCCSR_PNS002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS002"
label var PRCCSR_PNS003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS003"
label var PRCCSR_PNS004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS004"
label var PRCCSR_PNS005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS005"
label var PRCCSR_PNS006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR PNS006"
label var PRCCSR_RAD001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD001"
label var PRCCSR_RAD002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD002"
label var PRCCSR_RAD003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD003"
label var PRCCSR_RAD004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RAD004"
label var PRCCSR_RES001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES001"
label var PRCCSR_RES002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES002"
label var PRCCSR_RES003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES003"
label var PRCCSR_RES004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES004"
label var PRCCSR_RES005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES005"
label var PRCCSR_RES006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES006"
label var PRCCSR_RES007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES007"
label var PRCCSR_RES008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES008"
label var PRCCSR_RES009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES009"
label var PRCCSR_RES010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES010"
label var PRCCSR_RES011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES011"
label var PRCCSR_RES012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES012"
label var PRCCSR_RES013            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES013"
label var PRCCSR_RES014            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RES014"
label var PRCCSR_RHB001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB001"
label var PRCCSR_RHB002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB002"
label var PRCCSR_RHB003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB003"
label var PRCCSR_RHB004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR RHB004"
label var PRCCSR_SKB001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB001"
label var PRCCSR_SKB002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB002"
label var PRCCSR_SKB003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB003"
label var PRCCSR_SKB004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB004"
label var PRCCSR_SKB005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB005"
label var PRCCSR_SKB006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB006"
label var PRCCSR_SKB007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB007"
label var PRCCSR_SKB008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB008"
label var PRCCSR_SKB009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB009"
label var PRCCSR_SKB010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SKB010"
label var PRCCSR_SUD001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD001"
label var PRCCSR_SUD002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD002"
label var PRCCSR_SUD003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD003"
label var PRCCSR_SUD004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR SUD004"
label var PRCCSR_URN001            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN001"
label var PRCCSR_URN002            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN002"
label var PRCCSR_URN003            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN003"
label var PRCCSR_URN004            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN004"
label var PRCCSR_URN005            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN005"
label var PRCCSR_URN006            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN006"
label var PRCCSR_URN007            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN007"
label var PRCCSR_URN008            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN008"
label var PRCCSR_URN009            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN009"
label var PRCCSR_URN010            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN010"
label var PRCCSR_URN011            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN011"
label var PRCCSR_URN012            "Indication that at least one ICD-10-PCS procedure on the record is included in CCSR URN012"
label var PRCCSR_VERSION           "Version of CCSR for ICD-10-PCS procedures"
label var CCIR_VERSION             "Version of Chronic Condition Indicator Refined for ICD-10-CM"
label var CCIR1                    "ICD-10-CM Chronic Condition Indicator Refined 1"
label var CCIR2                    "ICD-10-CM Chronic Condition Indicator Refined 2"
label var CCIR3                    "ICD-10-CM Chronic Condition Indicator Refined 3"
label var CCIR4                    "ICD-10-CM Chronic Condition Indicator Refined 4"
label var CCIR5                    "ICD-10-CM Chronic Condition Indicator Refined 5"
label var CCIR6                    "ICD-10-CM Chronic Condition Indicator Refined 6"
label var CCIR7                    "ICD-10-CM Chronic Condition Indicator Refined 7"
label var CCIR8                    "ICD-10-CM Chronic Condition Indicator Refined 8"
label var CCIR9                    "ICD-10-CM Chronic Condition Indicator Refined 9"
label var CCIR10                   "ICD-10-CM Chronic Condition Indicator Refined 10"
label var CCIR11                   "ICD-10-CM Chronic Condition Indicator Refined 11"
label var CCIR12                   "ICD-10-CM Chronic Condition Indicator Refined 12"
label var CCIR13                   "ICD-10-CM Chronic Condition Indicator Refined 13"
label var CCIR14                   "ICD-10-CM Chronic Condition Indicator Refined 14"
label var CCIR15                   "ICD-10-CM Chronic Condition Indicator Refined 15"
label var CCIR16                   "ICD-10-CM Chronic Condition Indicator Refined 16"
label var CCIR17                   "ICD-10-CM Chronic Condition Indicator Refined 17"
label var CCIR18                   "ICD-10-CM Chronic Condition Indicator Refined 18"
label var CCIR19                   "ICD-10-CM Chronic Condition Indicator Refined 19"
label var CCIR20                   "ICD-10-CM Chronic Condition Indicator Refined 20"
label var CCIR21                   "ICD-10-CM Chronic Condition Indicator Refined 21"
label var CCIR22                   "ICD-10-CM Chronic Condition Indicator Refined 22"
label var CCIR23                   "ICD-10-CM Chronic Condition Indicator Refined 23"
label var CCIR24                   "ICD-10-CM Chronic Condition Indicator Refined 24"
label var CCIR25                   "ICD-10-CM Chronic Condition Indicator Refined 25"
label var CCIR26                   "ICD-10-CM Chronic Condition Indicator Refined 26"
label var CCIR27                   "ICD-10-CM Chronic Condition Indicator Refined 27"
label var CCIR28                   "ICD-10-CM Chronic Condition Indicator Refined 28"
label var CCIR29                   "ICD-10-CM Chronic Condition Indicator Refined 29"
label var CCIR30                   "ICD-10-CM Chronic Condition Indicator Refined 30"
label var CCIR31                   "ICD-10-CM Chronic Condition Indicator Refined 31"
label var CCIR32                   "ICD-10-CM Chronic Condition Indicator Refined 32"
label var CCIR33                   "ICD-10-CM Chronic Condition Indicator Refined 33"
label var CCIR34                   "ICD-10-CM Chronic Condition Indicator Refined 34"
label var CCIR35                   "ICD-10-CM Chronic Condition Indicator Refined 35"
label var CCIR36                   "ICD-10-CM Chronic Condition Indicator Refined 36"
label var CCIR37                   "ICD-10-CM Chronic Condition Indicator Refined 37"
label var CCIR38                   "ICD-10-CM Chronic Condition Indicator Refined 38"
label var CCIR39                   "ICD-10-CM Chronic Condition Indicator Refined 39"
label var CCIR40                   "ICD-10-CM Chronic Condition Indicator Refined 40"

*** Convert special values to missing values ***
recode HOSP_NIS                  (-9999 -8888 -6666=.)
recode KEY_NIS                   (-999999999 -888888888 -666666666=.)
recode CMR_AIDS                  (-9 -8 -6 -5=.)
recode CMR_ALCOHOL               (-9 -8 -6 -5=.)
recode CMR_AUTOIMMUNE            (-9 -8 -6 -5=.)
recode CMR_CANCER_LYMPH          (-9 -8 -6 -5=.)
recode CMR_CANCER_LEUK           (-9 -8 -6 -5=.)
recode CMR_CANCER_METS           (-9 -8 -6 -5=.)
recode CMR_CANCER_NSITU          (-9 -8 -6 -5=.)
recode CMR_CANCER_SOLID          (-9 -8 -6 -5=.)
recode CMR_DEMENTIA              (-9 -8 -6 -5=.)
recode CMR_DEPRESS               (-9 -8 -6 -5=.)
recode CMR_DIAB_UNCX             (-9 -8 -6 -5=.)
recode CMR_DIAB_CX               (-9 -8 -6 -5=.)
recode CMR_DRUG_ABUSE            (-9 -8 -6 -5=.)
recode CMR_HTN_CX                (-9 -8 -6 -5=.)
recode CMR_HTN_UNCX              (-9 -8 -6 -5=.)
recode CMR_LUNG_CHRONIC          (-9 -8 -6 -5=.)
recode CMR_OBESE                 (-9 -8 -6 -5=.)
recode CMR_PERIVASC              (-9 -8 -6 -5=.)
recode CMR_THYROID_HYPO          (-9 -8 -6 -5=.)
recode CMR_THYROID_OTH           (-9 -8 -6 -5=.)
recode PCLASS1                   (-99 -88 -66=.)
recode PCLASS2                   (-99 -88 -66=.)
recode PCLASS3                   (-99 -88 -66=.)
recode PCLASS4                   (-99 -88 -66=.)
recode PCLASS5                   (-99 -88 -66=.)
recode PCLASS6                   (-99 -88 -66=.)
recode PCLASS7                   (-99 -88 -66=.)
recode PCLASS8                   (-99 -88 -66=.)
recode PCLASS9                   (-99 -88 -66=.)
recode PCLASS10                  (-99 -88 -66=.)
recode PCLASS11                  (-99 -88 -66=.)
recode PCLASS12                  (-99 -88 -66=.)
recode PCLASS13                  (-99 -88 -66=.)
recode PCLASS14                  (-99 -88 -66=.)
recode PCLASS15                  (-99 -88 -66=.)
recode PCLASS16                  (-99 -88 -66=.)
recode PCLASS17                  (-99 -88 -66=.)
recode PCLASS18                  (-99 -88 -66=.)
recode PCLASS19                  (-99 -88 -66=.)
recode PCLASS20                  (-99 -88 -66=.)
recode PCLASS21                  (-99 -88 -66=.)
recode PCLASS22                  (-99 -88 -66=.)
recode PCLASS23                  (-99 -88 -66=.)
recode PCLASS24                  (-99 -88 -66=.)
recode PCLASS25                  (-99 -88 -66=.)
recode CCIR1                     (-99 -88 -66=.)
recode CCIR2                     (-99 -88 -66=.)
recode CCIR3                     (-99 -88 -66=.)
recode CCIR4                     (-99 -88 -66=.)
recode CCIR5                     (-99 -88 -66=.)
recode CCIR6                     (-99 -88 -66=.)
recode CCIR7                     (-99 -88 -66=.)
recode CCIR8                     (-99 -88 -66=.)
recode CCIR9                     (-99 -88 -66=.)
recode CCIR10                    (-99 -88 -66=.)
recode CCIR11                    (-99 -88 -66=.)
recode CCIR12                    (-99 -88 -66=.)
recode CCIR13                    (-99 -88 -66=.)
recode CCIR14                    (-99 -88 -66=.)
recode CCIR15                    (-99 -88 -66=.)
recode CCIR16                    (-99 -88 -66=.)
recode CCIR17                    (-99 -88 -66=.)
recode CCIR18                    (-99 -88 -66=.)
recode CCIR19                    (-99 -88 -66=.)
recode CCIR20                    (-99 -88 -66=.)
recode CCIR21                    (-99 -88 -66=.)
recode CCIR22                    (-99 -88 -66=.)
recode CCIR23                    (-99 -88 -66=.)
recode CCIR24                    (-99 -88 -66=.)
recode CCIR25                    (-99 -88 -66=.)
recode CCIR26                    (-99 -88 -66=.)
recode CCIR27                    (-99 -88 -66=.)
recode CCIR28                    (-99 -88 -66=.)
recode CCIR29                    (-99 -88 -66=.)
recode CCIR30                    (-99 -88 -66=.)
recode CCIR31                    (-99 -88 -66=.)
recode CCIR32                    (-99 -88 -66=.)
recode CCIR33                    (-99 -88 -66=.)
recode CCIR34                    (-99 -88 -66=.)
recode CCIR35                    (-99 -88 -66=.)
recode CCIR36                    (-99 -88 -66=.)
recode CCIR37                    (-99 -88 -66=.)
recode CCIR38                    (-99 -88 -66=.)
recode CCIR39                    (-99 -88 -66=.)
recode CCIR40                    (-99 -88 -66=.)

save "NIS_2023_DX_PR_GRPS.dta", replace