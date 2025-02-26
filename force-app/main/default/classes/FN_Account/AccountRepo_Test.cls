@isTest(isParallel=true)
public with sharing class AccountRepo_Test {
    @TestSetup
    static void testSetup() {
        List<Account> accounts = createAccounts('AccountQuery', '007', 2);
        insert accounts;
    }

    @IsTest
    static void testQueryWithBindsPositive() {
        Map<String, Object> bindVariablesMap = new Map<String, Object>{
            'acctName' => 'AccountQuery_0'
        };
        String queryString = 'SELECT Id FROM Account WHERE Name = :acctName';
        AccessLevel accessLevel = AccessLevel.USER_MODE;
        Test.startTest();
        List<Account> accounts = AccountRepo.getInstance()
            .queryAccountsWithBinds(queryString, bindVariablesMap, accessLevel);
        Test.stopTest();
        System.Assert.isTrue(accounts != null, 'Accounts should not be null.');
        System.Assert.isTrue(
            accounts.size() == 1,
            'one single account sould be returned'
        );
    }

    @IsTest
    static void testQueryWithBindsNegative() {
        Map<String, Object> bindVariablesMap = new Map<String, Object>{
            'acctName' => 'AccountQueryNot_0'
        };
        String queryString = 'SELECT Id FROM Account WHERE Name = :acctName';
        AccessLevel accessLevel = AccessLevel.USER_MODE;
        Test.startTest();
        List<Account> accounts = AccountRepo.getInstance()
            .queryAccountsWithBinds(queryString, bindVariablesMap, accessLevel);
        Test.stopTest();
        System.Assert.isTrue(
            accounts != null,
            'Account list should not be null.'
        );
        System.Assert.isTrue(
            accounts.size() == 0,
            'Account list should not have an entry.'
        );
    }

    @IsTest
    static void testCreateSinglePositive() {
        String accountNamePrefix = 'AccountCreateSingle';
        String accountNumberPrefix = '00002222';
        Integer totalNumber = 1;
        Account account = createAccounts(
                accountNamePrefix,
                accountNumberPrefix,
                totalNumber
            )
            .get(0);
        Test.startTest();
        AccountRepo.getInstance().insertDBObject(account);
        Account insertedAccount = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name = 'AccountCreateSingle_0'
        ];
        Test.stopTest();
        System.Assert.isTrue(insertedAccount != null, 'Account should exist');
        System.Assert.isTrue(
            insertedAccount.AccountNumber == '00002222_0',
            'Account name should be correct'
        );
    }

    @IsTest
    static void testCreateBatchPositive() {
        String accountNamePrefix = 'AccountCreateBatch';
        String accountNumberPrefix = '00001111';
        Integer totalNumber = 2;

        List<Account> accounts = createAccounts(
            accountNamePrefix,
            accountNumberPrefix,
            totalNumber
        );
        List<String> accountNames = new List<String>();
        for (Integer i = 0; i < totalNumber; i++) {
            accountNames.add(accountNamePrefix + '_' + i);
        }
        Test.startTest();
        AccountRepo.getInstance().insertDBObjects(accounts);
        List<Account> insertedAccounts = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name IN :accountNames
        ];
        Test.stopTest();
        System.Assert.isTrue(
            insertedAccounts != null,
            'Account list should not be null'
        );
        System.Assert.isTrue(
            insertedAccounts.size() == 2,
            'Account list should have exactly 2 entries'
        );
    }

    @IsTest
    static void testUpdateSinglePositive() {
        String accountNamePrefix = 'AccountUpdateSingle';
        String accountNumberPrefix = '0816';
        Integer totalNumber = 1;
        Account account = createAccounts(
                accountNamePrefix,
                accountNumberPrefix,
                totalNumber
            )
            .get(0);
        Test.startTest();
        insert account;
        Account updatedAccount = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name = 'AccountUpdateSingle_0'
        ];
        updatedAccount.AccountNumber =
            'updated_' + updatedAccount.AccountNumber;
        AccountRepo.getInstance().updateDBObject(updatedAccount);
        updatedAccount = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name = 'AccountUpdateSingle_0'
        ];
        Test.stopTest();

        System.Assert.isTrue(
            updatedAccount != null,
            'Account should not be null'
        );
        System.Assert.isTrue(
            updatedAccount.AccountNumber.startsWith('updated_'),
            'Account number should start with updated_'
        );
    }

    @IsTest
    static void testUpdateBatchPositive() {
        String accountNamePrefix = 'AccountUpdateBatch';
        String accountNumberPrefix = '00001111';
        Integer totalNumber = 2;

        List<Account> accounts = createAccounts(
            accountNamePrefix,
            accountNumberPrefix,
            totalNumber
        );

        List<String> accountNames = new List<String>();
        for (Integer i = 0; i < totalNumber; i++) {
            accountNames.add(accountNamePrefix + '_' + i);
        }
        Test.startTest();
        insert accounts;
        List<Account> updateAccounts = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name IN :accountNames
        ];
        for (Account account : updateAccounts) {
            account.AccountNumber = 'updated_' + account.AccountNumber;
        }
        AccountRepo.getInstance().updateDBObjects(updateAccounts);
        updateAccounts = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name IN :accountNames
        ];
        Test.stopTest();

        System.Assert.isTrue(
            updateAccounts != null,
            'Account list should not be null'
        );
        System.Assert.isTrue(
            updateAccounts.size() == totalNumber,
            'Account list should have exactly ' + totalNumber + ' entries'
        );
        System.Assert.isTrue(
            updateAccounts.get(0).AccountNumber.startsWith('updated_'),
            'Account numbers should start with updated_'
        );
    }

    // methods are not necessary as long as Account deletion doesn't need to be implemented
    // static void testDeleteSinglePositive()
    //@IsTest
    static void testDeleteSinglePositive() {
        String accountNamePrefix = 'AccountDeleteSingle';
        String accountNumberPrefix = '0817';
        Integer totalNumber = 1;
        Account account = createAccounts(
                accountNamePrefix,
                accountNumberPrefix,
                totalNumber
            )
            .get(0);
        Test.startTest();
        insert account;
        Account deleteAccount = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name = 'AccountDeleteSingle_0'
        ];
        AccountRepo.getInstance().deleteDBObject(deleteAccount);
        deleteAccount = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name = 'AccountDeleteSingle_0'
        ];
        Test.stopTest();

        System.Assert.isTrue(deleteAccount == null, 'Account should be null');
    }

    // methods are not necessary as long as Account deletion doesn't need to be implemented
    // static void testDeleteBatchPositive()
    // @IsTest
    static void testDeleteBatchPositive() {
        String accountNamePrefix = 'AccountDeleteBatch';
        String accountNumberPrefix = '0818';
        Integer totalNumber = 2;

        List<Account> accounts = createAccounts(
            accountNamePrefix,
            accountNumberPrefix,
            totalNumber
        );

        List<String> accountNames = new List<String>();
        for (Integer i = 0; i < totalNumber; i++) {
            accountNames.add(accountNamePrefix + '_' + i);
        }
        Test.startTest();
        insert accounts;
        List<Account> deleteAccounts = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name IN :accountNames
        ];
        AccountRepo.getInstance().deleteDBObjects(deleteAccounts);
        deleteAccounts = [
            SELECT Id, Name, AccountNumber
            FROM Account
            WHERE name IN :accountNames
        ];
        Test.stopTest();

        System.Assert.isTrue(
            deleteAccounts != null,
            'Account list should not be null'
        );
        System.Assert.isTrue(
            deleteAccounts.size() == 0,
            'Account list should have exactly 0 entries'
        );
    }

    /**
     * Helper method to create accounts
     */
    private static List<Account> createAccounts(
        String accountNamePrefix,
        String accountNumberPrefix,
        Integer totalNumber
    ) {
        if (
            accountNamePrefix != null &&
            accountNumberPrefix != null &&
            totalNumber > 0
        ) {
            List<Account> accounts = new List<Account>();
            for (Integer i = 0; i < totalNumber; i++) {
                accounts.add(
                    new Account(
                        Name = accountNamePrefix + '_' + i,
                        AccountNumber = accountNumberPrefix + '_' + i
                    )
                );
            }
            return accounts;
        }
        return null;
    }
}
