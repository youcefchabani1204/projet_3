@isTest
private class AccountCasesControllerTest {
    
    @TestSetup
    static void setup() {
        // Création d'un compte de test
        Account testAccount = TestDataFactory.createTestAccount();
        
        // Création d'un cas associé à ce compte
        TestDataFactory.createTestCase(testAccount.Id, 'problem1');
    }
    
    @isTest
    static void testFindCasesBySubject() {
        // Récupération du compte de test
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        
        // Lancer le test
        Test.startTest();
        
        // Recherche de cas par sujet
        List<Case> resultsProblem1 = AccountCasesController.findCasesBySubject(testAccount.Id, 'problem1');
        
        Test.stopTest();
        
        // Vérifications des résultats
        System.assertEquals(1, resultsProblem1.size(), 'Un seul cas doit être retourné pour problem1.');
    }
}