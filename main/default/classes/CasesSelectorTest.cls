@isTest
private class CasesSelectorTest {
    
    @TestSetup
    static void setup() {
        // Création d'un compte de test
        Account testAccount = TestDataFactory.createTestAccount();
        
        // Création d'un cas associé à ce compte avec un sujet 'problem1'
        TestDataFactory.createTestCase(testAccount.Id, 'problem1');
    }
    
    @isTest
    static void testFindCasesBySubjectAndAccountId() {
        // Récupération du compte de test
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        
        // Lancer le test
        Test.startTest();
        
        // Recherche des cas par sujet 'problem1' pour ce compte
        List<Case> resultsProblem1 = CasesSelector.findCasesBySubjectAndAccountId(testAccount.Id, 'problem1');
        
        Test.stopTest();
        
        // Vérifications des résultats
        System.assertEquals(1, resultsProblem1.size(), 'Un seul cas doit être retourné pour problem1.');
        System.assertEquals('problem1', resultsProblem1[0].Subject, 'Le sujet du cas retourné doit être "problem1".');
    }
}