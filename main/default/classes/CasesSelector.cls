public with sharing class CasesSelector {
    public static List<Case> findCasesBySubjectAndAccountId (String accountId,String subjectSearchTerm)
    {  return     [  SELECT Id, Subject, Status, Priority FROM Case WHERE AccountId = :accountId  AND  Subject LIKE  :('%' + subjectSearchTerm + '%')
];
 
     }
}