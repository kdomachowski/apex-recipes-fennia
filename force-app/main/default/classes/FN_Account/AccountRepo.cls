public with sharing class AccountRepo {
    static AccountRepo instance;
    public class AccountRepoException extends Exception {
    }

    /**
     * Implements the signleton pattern
     */
    public static AccountRepo getInstance() {
        if (instance == null) {
            instance = new AccountRepo();
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
        if (queryString != null) {
            List<Account> accounts = Database.queryWithBinds(
                queryString,
                bindVariablesMap,
                accessLevel
            );
            return accounts;
        }
        return null;
    }

    public void insertDBObject(Account account) {
        if (
            account != null &&
            Schema.sObjectType.Account.isAccessible() &&
            Schema.sObjectType.Account.isCreateable()
        ) {
            insert account;
        }
    }

    public void insertDBObjects(List<Account> accounts) {
        if (accounts != null && accounts.size() > 0) {
            if (
                Schema.sObjectType.Account.isAccessible() &&
                Schema.sObjectType.Account.isCreateable()
            ) {
                insert accounts;
            }
        }
    }

    public void updateDBObject(Account account) {
        if (
            account != null &&
            Schema.sObjectType.Account.isAccessible() &&
            Schema.sObjectType.Account.isUpdateable()
        ) {
            update account;
        }
    }

    public void updateDBObjects(List<Account> accounts) {
        if (accounts != null && accounts.size() > 0) {
            if (
                Schema.sObjectType.Account.isAccessible() &&
                Schema.sObjectType.Account.isUpdateable()
            ) {
                update accounts;
            }
        }
    }

    // methods are not necessary as long as Account deletion doesn't need to be implemented
    // public void deleteDBObject(Account account)
    // public void deleteDBObjects(List<Account> accounts)

    public void deleteDBObject(Account account) {
        if (
            account != null &&
            Schema.sObjectType.Account.isAccessible() &&
            Schema.sObjectType.Account.isDeletable()
        ) {
            delete account;
        }
    }

    public void deleteDBObjects(List<Account> accounts) {
        if (accounts != null && accounts.size() > 0) {
            if (
                Schema.sObjectType.Account.isAccessible() &&
                Schema.sObjectType.Account.isDeletable()
            ) {
                delete accounts;
            }
        }
    }
}
