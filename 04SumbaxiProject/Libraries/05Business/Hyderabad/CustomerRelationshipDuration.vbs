'[Verify Display Message based on Customer relationship Duration]
Public Function verifyCRDMessage(strCRDMessage)
    verifyCRDMessage = true
    If Not IsNull (strCRDMessage) Then
       verifyCRDMessage = verifyInnerText(CustomerRelationshipDuration.lblnavBarCustMsg_span(),strCRDMessage, "NavigationBarCustomerRelMessage")
    else
       verifyCRDMessage = false
    End If
End Function
