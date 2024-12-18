@IsTest
public class TestDataFactory {
    public static Account createTestAccount() {
        Account acc = new Account(Name='Test Account');
        insert acc;
        return acc;
    }

    public static Opportunity createTestOpportunity(Id accountId) {
        Opportunity opp = new Opportunity(
                Name='Test Opportunity',
                StageName='Prospecting',
                CloseDate=System.today().addDays(30),
                Amount=10000,
                AccountId=accountId
        );
        insert opp;
        return opp;
    }
    // Méthode pour créer des Cases associés à un Account
    public static List<Case> createTestCases(Id accountId, List<String> subjects) {
        List<Case> caseList = new List<Case>();
        for (String subject : subjects) {
            caseList.add(new Case(
                Status = 'New',
                Priority = 'High',
                Subject = subject,
                AccountId = accountId
            ));
        }
        insert caseList;
        return caseList;
    }

}