@isTest
public with sharing class ApexRepoConsumer_Test {
    @isTest(SeeAllData=true)
    static void testAccountRepoNotStubbed() {
        AccountRepoConsumer accountRepoConsumer = new AccountRepoConsumer(null);
        Test.startTest();
        String name = accountRepoConsumer.getAccountNameByAccountNumber(
            '000009999999'
        );
        Test.stopTest();
        System.debug('Account Name: ' + name);
        System.Assert.isTrue(name != null, 'Name should not be null: ' + name);
    }

    @isTest
    static void testAccountRepoStubbed() {
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Kay Account', AccountNumber = '1234567890')
        };
        TestDouble.Method queryAccountsWithBindsTrack = new TestDouble.Method(
                'queryAccountsWithBinds'
            )
            .returning(accounts);

        TestDouble accountRepoStub = new TestDouble(AccountRepo.class)
            .track(queryAccountsWithBindsTrack);

        Test.startTest();
        AccountRepoConsumer accountRepoConsumer = new AccountRepoConsumer(
            (AccountRepo) accountRepoStub.generate()
        );
        String name = accountRepoConsumer.getAccountNameByAccountNumber(
            '1234567890'
        );
        Test.stopTest();
        System.debug('Account Name: ' + name);
        System.Assert.isTrue(name != null, 'Name should not be null');
        System.Assert.isTrue(
            queryAccountsWithBindsTrack.hasBeenCalledXTimes > 0,
            'queryAccountsWithBinds should have been called once'
        );
    }

    @isTest
    static void testAccountRepoMocked() {
        AccountRepoMock accountRepoMock = new AccountRepoMock();
        accountRepoMock.insertDBObject(
            new Account(Name = 'Kay Account', AccountNumber = '1234567890')
        );

        Test.startTest();
        AccountRepoConsumer accountRepoConsumer = new AccountRepoConsumer(
            accountRepoMock
        );
        String name = accountRepoConsumer.getAccountNameByAccountNumber(
            '1234567890'
        );
        Test.stopTest();
        System.debug('Account Name: ' + name);
        System.Assert.isTrue(name != null, 'Name should not be null');
    }
}
