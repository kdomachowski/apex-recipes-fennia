public interface AccountRepoInterface {
    /**
     * Returns the all records returned from the query.
     */
    List<Account> queryAccountsWithBinds(
        String queryString,
        Map<String, Object> bindVariablesMap,
        System.AccessLevel accessLevel
    );

    void insertDBObject(Account account);

    void insertDBObjects(List<Account> accounts);

    void updateDBObject(Account account);

    void updateDBObjects(List<Account> accounts);

    // methods are not necessary as long as Account deletion doesn't need to be implemented
    // public void deleteDBObject(Account account)
    // public void deleteDBObjects(List<Account> accounts)

    void deleteDBObject(Account account);

    void deleteDBObjects(List<Account> accounts);
}
