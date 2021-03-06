'Keyword Generation
Class KW_CustomerDetails
    Public Function runKey (strKeyArgument)
        Dim strPriCust_CIN, strPriCust_MotherName, strPriCust_VIP, strPriCust_Employer, strPriCust_AnnualIncome, strPriCust_EnrollmentStatus, strPriCust_EnrollmentDate, strEmbossName_CardholderName, strEmbossName_Gender, strEmbossName_DOB, strEmbossName_CIN

        strPriCust_CIN  = checkNull(strKeyArgument(0))
        strPriCust_MotherName  = checkNull(strKeyArgument(1))
        strPriCust_VIP  = checkNull(strKeyArgument(2))
        strPriCust_Employer  = checkNull(strKeyArgument(3))
        strPriCust_AnnualIncome  = checkNull(strKeyArgument(4))
        strPriCust_EnrollmentStatus  = checkNull(strKeyArgument(5))
        strPriCust_EnrollmentDate  = checkNull(strKeyArgument(6))
        strEmbossName_CardholderName  = checkNull(strKeyArgument(7))
        strEmbossName_Gender  = checkNull(strKeyArgument(8))
        strEmbossName_DOB  = checkNull(strKeyArgument(9))
        strEmbossName_CIN  = checkNull(strKeyArgument(10))

        Dim bCustomerDetails
        bCustomerDetails  = VerifyCustomerDetails(strPriCust_CIN, strPriCust_MotherName, strPriCust_VIP, strPriCust_Employer, strPriCust_AnnualIncome, strPriCust_EnrollmentStatus, strPriCust_EnrollmentDate, strEmbossName_CardholderName, strEmbossName_Gender, strEmbossName_DOB, strEmbossName_CIN)

        If  bCustomerDetails Then
            LogMessage "RSLT", "Verification", "Keyword CustomerDetails executed successfully", True
            runKey =True
        else
            LogMessage "RSLT", "Verification", "Keyword CustomerDetails  failed during execution", False
            runKey =False
        End If

    End Function


End Class

'strPriCust_CIN	PriCust_MotherName	PriCust_VIP	PriCust_Employer	PriCust_AnnualIncome	PriCust_EnrollmentStatus	PriCust_EnrollmentDate	EmbossName_CardholderName	EmbossName_Gender	EmbossName_DOB	EmbossName_CIN
