public with sharing class AccountCasesController {
    @AuraEnabled
    public static List<Case>  findCasesBySubject (String accountId,String subjectSearchTerm)
   {   
    if (String.IsBlank(subjectSearchTerm)){
    throw new AuraHandledException('le mots clé entrée un invalide ');
}
return CasesSelector.findCasesBySubjectAndAccountId(accountId,subjectSearchTerm);
}
 
}