%dw 2.0
output application/java
---
{
  Part_Number__c : trim(payload.RCAA19),
  Stocking_Type_Code__c: 
    if (trim(payload."RC74USTA") == "0") "0-Customer pending apart no."
    else if (trim(payload."RC74USTA") == "1") "1-Available part no."
    else if (trim(payload."RC74USTA") == "2") "2-Old part no."
    else if (trim(payload."RC74USTA") == "3") "3-Part to be phased out"
    else if (trim(payload."RC74USTA") == "4") "4-Purchased part"
    else if (trim(payload."RC74USTA") == "6") "6-Production plan part no."
    else if (trim(payload."RC74USTA") == "7") "7-Dead part no."
    else if (trim(payload."RC74USTA") == "9") "9-Substitution part no."
    else "" ,
    External_ID__c : trim(payload.RCAA19) ++ "-JPN-NTN" ,
    NTN_Company_Number__c : "00001",
    Origin__c : "JPN",
    Brand__c : "NTN" ,
    Part_Number_Type__c : "Base" ,
    Source__c : "JAPAN",
    ProductCode : (trim(payload.RCAA19)),
    CIF_Min__c : 0.00,
    Landed_Cost_Max__c : 0.00 ,
    Landed_Cost_Min__c : 0.00 ,
    Estimated_Production_Lead_Time_Max__c : "0.00",
    Estimated_Production_Lead_Time_Min__c : "0.00",
    IsActive: true as Boolean ,
    Name: (trim(payload.RCAA19)),
    Update_Date__c : if (payload.RCEVNTDATE != null )(payload.RCEVNTDATE as Date {format: "yyyyMMdd"}) as String {format: "yyyy-MM-dd"} as Date {format: "yyyy-MM-dd"} else ""
}
