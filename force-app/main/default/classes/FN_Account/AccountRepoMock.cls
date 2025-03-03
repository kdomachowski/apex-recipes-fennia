@IsTest
public with sharing class AccountRepoMock implements AccountRepoInterface {
    static AccountRepoMock instance;

    Map<Id, Account> accountMap = new Map<Id, Account>();

    public class AccountRepoException extends Exception {
    }

    /**
     * Implements the signleton pattern
     */
    public static AccountRepoMock getInstance() {
        if (instance == null) {
            instance = new AccountRepoMock();
        }
        return instance;
    }

    /**
     * Returns the all records returned from the query.
     */
    public List<Account> queryAccountsWithBinds(
        String queryString,
        Map<String, Object> bindVariablesMap,
        System.AccessLevel accessLevel
    ) {
        List<Account> resultList = new List<Account>();
        if (queryString != null) {
            if (
                queryString.contains('WHERE AccountNumber') &&
                bindVariablesMap.get('accountNumber') != null
            ) {
                String accountNumber = bindVariablesMap.get('accountNumber')
                    .toString();
                for (Account account : accountMap.values()) {
                    if (
                        account.AccountNumber != null &&
                        account.AccountNumber == accountNumber
                    ) {
                        resultList.add(account);
                    }
                }
            }
        }
        return resultList;
    }

    public void insertDBObject(Account account) {
        if (account != null) {
            if (account.Id == null) {
                account.Id = TestUtility.getFakeId(
                    Schema.sObjectType.Account.sObjectType
                );
            }
            accountMap.put(account.Id, account);
        }
    }

    public void insertDBObjects(List<Account> accounts) {
        if (accounts != null && accounts.size() > 0) {
            for (Account account : accounts) {
                if (account.Id == null) {
                    account.Id = TestUtility.getFakeId(
                        Schema.sObjectType.Account.sObjectType
                    );
                }
                accountMap.put(account.Id, account);
            }
        }
    }

    public void updateDBObject(Account account) {
        //foo bar
    }

    public void updateDBObjects(List<Account> accounts) {
        //foo bar
    }

    // methods are not necessary as long as Account deletion doesn't need to be implemented
    // public void deleteDBObject(Account account)
    // public void deleteDBObjects(List<Account> accounts)

    public void deleteDBObject(Account account) {
        //foo bar
    }

    public void deleteDBObjects(List<Account> accounts) {
        //foo bar
    }
}
